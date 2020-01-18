import 'package:flutter/material.dart';
import 'dart:async';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'fragment.dart';

Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Not in stock'),
        content: const Text('This item is no longer available'),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

enum ConfirmAction { CANCEL, ACCEPT }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.CANCEL);
            },
          ),
          FlatButton(
            child: const Text('ACCEPT'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.ACCEPT);
            },
          )
        ],
      );
    },
  );
}

Future<String> _asyncInputDialog(BuildContext context) async {
  String teamName = '';
  return showDialog<String>(
    context: context,
    barrierDismissible:
        false, // dialog is dismissible with a tap on the barrier
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter current team'),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: new TextField(
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Team Name', hintText: 'eg. Juventus F.C.'),
              onChanged: (value) {
                teamName = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop(teamName);
            },
          ),
        ],
      );
    },
  );
}

enum Departments { Production, Research, Purchasing, Marketing, Accounting }

Future<Departments> _asyncSimpleDialog(BuildContext context) async {
  return await showDialog<Departments>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Select Departments '),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Production);
              },
              child: const Text('Production'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Research);
              },
              child: const Text('Research'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Purchasing);
              },
              child: const Text('Purchasing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Marketing);
              },
              child: const Text('Marketing'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(context, Departments.Accounting);
              },
              child: const Text('Accounting'),
            )
          ],
        );
      });
}

double lat = 0;
double long = 0;
String address = "";

//locateUser() {
//  Geolocator()
//      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//      .then((location) {
//    if (location != null) {
//      lat = location.latitude;
//      long = location.longitude;
//      print("Location: ${location.latitude},${location.longitude}");
//    } else {
//      print('dddddddd');
//    }
//  });
//}

getLocation() async {
  Position position = await Geolocator()
      .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  debugPrint('location: ${position.latitude}');
  final coordinates = new Coordinates(position.latitude, position.longitude);
  lat = position.latitude;
  long = position.longitude;
  var addresses =
      await Geocoder.local.findAddressesFromCoordinates(coordinates);
  var first = addresses.first;
  print("${first.featureName} : ${first.addressLine}");
  address = first.addressLine;
}

Completer<GoogleMapController> _controller = Completer();
const LatLng _center = const LatLng(-6.758, -35.6591);

LatLng _lastMapPosition = _center;
MapType _currentMapType = MapType.normal;

_onMapCreated(GoogleMapController controller) {
  _controller.complete(controller);
}

_onCameraMove(CameraPosition position) {
  _lastMapPosition = position.target;
}

class PrimeiraRota extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Abrir rota(tela)'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//
//    Set<Marker> _markers = {};
//
//    if (lat == 0 || long == 0 || address == "") {
//      main();
//    }
//
////    locateUser();
//    getLocation();
//
//    MarkerId markerId = MarkerId("1");
//
//    _markers = {
//      Marker(
//          markerId: markerId,
//          position: LatLng(lat, long),
//          infoWindow: InfoWindow(
//            title: 'Inducesmile.com',
//            snippet: 'Here is an Info Window Text on a Google Map',
//          ))
//    };
//
//    final CameraPosition _position1 = CameraPosition(
//      bearing: 192.833,
//      target: LatLng(lat, long),
//      tilt: 59.440,
//      zoom: 11.0,
//    );
//
//    _goToPosition1() async {
//      final GoogleMapController controller = await _controller.future;
//      controller.animateCamera(CameraUpdate.newCameraPosition(_position1));
//    }
//
////  _markers.add(
////
////    Marker(
////        markerId: MarkerId('value'),
////        position: LatLng(lat, long)),
////
////
////
////  );
//
//    print(lat);
//    print(long);
//
//// TODO: implement build
//    return new Scaffold(
//      appBar: AppBar(
//        title: Text(address),
//      ),
//      body: Center(
//        child: Stack(
//          //mainAxisAlignment: MainAxisAlignment.center,
//
//          children: <Widget>[
//            Container(
//              height: MediaQuery.of(context).size.height,
//              width: MediaQuery.of(context).size.width,
//              child: GoogleMap(
//                onMapCreated: _onMapCreated,
//                initialCameraPosition: CameraPosition(
//                  target: _center,
//                  zoom: 11.0,
//                ),
//                mapType: _currentMapType,
//                markers: _markers,
//                onCameraMove: _onCameraMove,
//              ),
//            ),
//            Padding(
//              padding: EdgeInsets.all(16.0),
//              child: Align(
//                alignment: Alignment.topRight,
//                child: Column(children: <Widget>[
//                  FloatingActionButton(
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.blue,
//                    child: Icon(
//                      Icons.settings,
//                      size: 36.0,
//                    ),
//                    onPressed: () {
//                      _ackAlert(context);
//                    },
//                  ),
//                  FloatingActionButton(
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.blue,
//                    child: Icon(
//                      Icons.update,
//                      size: 36.0,
//                    ),
//                    onPressed: () async {
//                      final ConfirmAction action =
//                          await _asyncConfirmDialog(context);
//                      print("Confirm Action $action");
//                    },
//                  ),
//                  FloatingActionButton(
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.blue,
//                    child: Icon(
//                      Icons.insert_chart,
//                      size: 36.0,
//                    ),
//                    onPressed: () async {
//                      final Departments deptName =
//                          await _asyncSimpleDialog(context);
//                      print("Selected Departement is $deptName");
//                    },
//                  ),
//                  FloatingActionButton(
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.blue,
//                    child: Icon(
//                      Icons.dialpad,
//                      size: 36.0,
//                    ),
//                    onPressed: () async {
//                      final String currentTeam =
//                          await _asyncInputDialog(context);
//                      print("Current team name is $currentTeam");
//                    },
//                  ),
//                  FloatingActionButton(
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.blue,
//                    child: Icon(
//                      Icons.search,
//                      size: 36.0,
//                    ),
//                    onPressed: () async {
//                      _goToPosition1();
//                    },
//                  ),
//                  FloatingActionButton(
//                    materialTapTargetSize: MaterialTapTargetSize.padded,
//                    backgroundColor: Colors.blue,
//                    child: Icon(
//                      Icons.dialpad,
//                      size: 36.0,
//                    ),
//                    onPressed: ()  {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => PrimeiraRota()),
//                      );
//                    },
//                  ),
//                ]),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exemplo Drawer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Exemplo Drawer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Cabeçalho'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              selected: 0 == _selectedIndex,
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              selected: 1 == _selectedIndex,
              onTap: () {
                _onSelectItem(1);
              },
            ),
          ],
        ),
      ),
      body: _getDrawerItem(_selectedIndex),
    );
  }

  _getDrawerItem(int pos) {
    switch (pos) {
      case 0:
        return Fragment("Tela 1");
      case 1:
        return Fragment("Tela 2");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop();
  }
}
