// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;

// class UploadMultipleImageDemo extends StatefulWidget {
//   UploadMultipleImageDemo() : super();

//   final String title = 'Firebase Storage';

//   @override
//   UploadMultipleImageDemoState createState() => UploadMultipleImageDemoState();
// }

// class UploadMultipleImageDemoState extends State<UploadMultipleImageDemo> {
//   //
//   String _path;
//   Map<String, String> _paths;
//   String _extension;
//   FileType _pickType;
//   bool _multiPick = false;
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//   List<StorageUploadTask> _tasks = <StorageUploadTask>[];

//   openFileExplorer() async {
//     try {
//       _path = null;
//       if (_multiPick) {
//         _paths = await FilePicker.getMultiFilePath(
//             type: _pickType, fileExtension: _extension);
//       } else {
//         _path = await FilePicker.getFilePath(
//             type: _pickType, fileExtension: _extension);
//       }
//       uploadToFirebase();
//     } on PlatformException catch (e) {
//       print('Unsupported Operation ' + e.toString());
//     }
//     if (!mounted) {
//       return;
//     }
//   }

//   uploadToFirebase() {
//     if (_multiPick) {
//       _paths.forEach((fileName, filePath) => {upload(fileName, filePath)});
//     } else {
//       String fileName = _path.split('/').last;
//       String filePath = _path;
//       upload(fileName, filePath);
//     }
//   }

//   upload(fileName, filePath) {
//     _extension = fileName.toString().split('.').last;
//     StorageReference storageReference =
//         FirebaseStorage.instance.ref().child(fileName);
//     final StorageUploadTask uploadTask = storageReference.putFile(
//         File(filePath),
//         StorageMetadata(
//           contentType: '$_pickType/$_extension',
//         ));
//     setState(() {
//       _tasks.add(uploadTask);
//     });
//   }

//   downloadFile(StorageReference ref) async {
//     final String url = await ref.getDownloadURL();
//     final http.Response downloadData = await http.get(url);
//     final Directory systemTempDir = Directory.systemTemp;
//     final File tempFile = File('${systemTempDir.path}/tmp.jpg');
//     if (tempFile.existsSync()) {
//       await tempFile.delete();
//     }
//     await tempFile.create();
//     final StorageFileDownloadTask task = ref.writeToFile(tempFile);
//     final int byteCount = (await task.future).totalByteCount;
//     var bodyBytes = downloadData.bodyBytes;
//     final String name = await ref.getName();
//     final String path = await ref.getPath();
//     print(
//         'Success\nDownloaded $name\nUrl: $url\nPath: $path\nBytes Count: $byteCount');
//     _scaffoldKey.currentState.showSnackBar(SnackBar(
//       backgroundColor: Colors.white,
//       content: Image.memory(
//         bodyBytes,
//         fit: BoxFit.fill,
//       ),
//     ));
//   }

//   dropDown() {
//     return DropdownButton(
//       hint: Text('Select'),
//       value: _pickType,
//       items: <DropdownMenuItem>[
//         DropdownMenuItem(
//           child: Text('Audio'),
//           value: FileType.AUDIO,
//         ),
//         DropdownMenuItem(
//           child: Text('Image'),
//           value: FileType.IMAGE,
//         ),
//         DropdownMenuItem(
//           child: Text('Video'),
//           value: FileType.VIDEO,
//         ),
//         DropdownMenuItem(
//           child: Text('Any'),
//           value: FileType.ANY,
//         ),
//       ],
//       onChanged: (value) {
//         setState(() {
//           _pickType = value;
//         });
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> children = <Widget>[];
//     _tasks.forEach((StorageUploadTask task) {
//       final Widget tile = UploadTaskListTile(
//         task: task,
//         onDismissed: () {
//           setState(() {
//             _tasks.remove(task);
//           });
//         },
//         onDownload: () {
//           downloadFile(task.lastSnapshot.ref);
//         },
//       );
//       children.add(tile);
//     });
//     return new MaterialApp(
//       home: new Scaffold(
//         key: _scaffoldKey,
//         appBar: new AppBar(
//           title: Text(widget.title),
//         ),
//         body: new Container(
//           padding: EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: <Widget>[
//               dropDown(),
//               SwitchListTile.adaptive(
//                 title: Text(
//                   'Pick Multiple Images',
//                   textAlign: TextAlign.left,
//                 ),
//                 onChanged: (bool value) {
//                   setState(() {
//                     _multiPick = value;
//                   });
//                 },
//                 value: _multiPick,
//               ),
//               OutlineButton(
//                 child: Text('Open File Explorer'),
//                 onPressed: () {
//                   openFileExplorer();
//                 },
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Flexible(
//                 child: ListView(
//                   children: children,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class UploadTaskListTile extends StatelessWidget {
//   const UploadTaskListTile(
//       {Key key, this.task, this.onDismissed, this.onDownload})
//       : super(key: key);

//   final StorageUploadTask task;
//   final VoidCallback onDismissed;
//   final VoidCallback onDownload;

//   String get status {
//     String result;
//     if (task.isComplete) {
//       if (task.isSuccessful) {
//         result = 'Complete';
//       } else if (task.isCanceled) {
//         result = 'Cancelled';
//       } else {
//         result = 'Failed Error ${task.lastSnapshot.error}';
//       }
//     } else if (task.isInProgress) {
//       result = 'Uploading';
//     } else if (task.isPaused) {
//       result = 'Paused';
//     }
//     return result;
//   }

//   String bytesTransferred(StorageTaskSnapshot snapshot) {
//     return '${snapshot.bytesTransferred}/${snapshot.totalByteCount}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<StorageTaskEvent>(
//       stream: task.events,
//       builder: (BuildContext context,
//           AsyncSnapshot<StorageTaskEvent> asyncSnapshot) {
//         Widget subtitle;
//         if (asyncSnapshot.hasData) {
//           final StorageTaskEvent event = asyncSnapshot.data;
//           final StorageTaskSnapshot snapshot = event.snapshot;
//           subtitle = Text('$status: ${bytesTransferred(snapshot)} bytes sent');
//         } else {
//           subtitle = const Text('Starting...');
//         }
//         return Dismissible(
//           key: Key(task.hashCode.toString()),
//           onDismissed: (_) => onDismissed(),
//           child: ListTile(
//             title: Text('Upload Task #${task.hashCode}'),
//             subtitle: subtitle,
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Offstage(
//                   offstage: !task.isInProgress,
//                   child: IconButton(
//                     icon: const Icon(Icons.pause),
//                     onPressed: () => task.pause(),
//                   ),
//                 ),
//                 Offstage(
//                   offstage: !task.isPaused,
//                   child: IconButton(
//                     icon: const Icon(Icons.file_upload),
//                     onPressed: () => task.resume(),
//                   ),
//                 ),
//                 Offstage(
//                   offstage: task.isComplete,
//                   child: IconButton(
//                     icon: const Icon(Icons.cancel),
//                     onPressed: () => task.cancel(),
//                   ),
//                 ),
//                 Offstage(
//                   offstage: !(task.isComplete && task.isSuccessful),
//                   child: IconButton(
//                     icon: const Icon(Icons.file_download),
//                     onPressed: () => onDownload(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
