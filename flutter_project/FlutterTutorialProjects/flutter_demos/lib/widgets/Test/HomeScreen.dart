import 'package:flutter/material.dart';
//import 'services.dart';
import 'album.dart';
import 'gridcell.dart';
import 'details.dart';
import 'dart:async';
import 'Utility.dart';

class HomeScreen extends StatefulWidget {
  //
  HomeScreen() : super();

  final String title = "Home";

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  //

  StreamController<int> streamController = new StreamController<int>();
  List<Album> albums;

  @override
  void initState() {
    super.initState();
    albums = [];
    getTiles();
  }

  getTiles() {
    albums.clear();
    Album album = new Album(0, 0, 'I...', '', 'images/apple.png');
    albums.add(album);
    album = new Album(0, 0, 'A...', '', 'images/apple.png');
    albums.add(album);
    album = new Album(0, 0, 'Ob...', '', 'images/apple.png');
    albums.add(album);
    album = new Album(0, 0, 'E...', '', 'images/apple.png');
    albums.add(album);
    album = new Album(0, 0, 'R...', '', 'images/apple.png');
    albums.add(album);
    album = new Album(0, 0, 'A...', '', 'images/apple.png');
    albums.add(album);
    album = new Album(0, 0, 'A...', '', 'images/apple.png');
    albums.add(album);
  }

  gridview() {
    return Padding(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 2.0,
            children: albums.map(
              (album) {
                return GestureDetector(
                  child: GridTile(
                    child: AlbumCell(album),
                  ),
                  onTap: () {
                    goToDetailsPage(context, album);
                  },
                );
              },
            ).toList(),
          ),
        ));
  }

  goToDetailsPage(BuildContext context, Album album) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => GridDetails(
          curAlbum: album,
        ),
      ),
    );
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 55.0,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10.0,
              ),
              Image.asset(
                'images/apple.png',
                height: 80,
                width: 80,
                fit: BoxFit.fill,
              ),
              Text(
                'Edelsten',
                style: Utility.titleFontStyle(),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 30, 20, 0),
            child: Text(
              'Search',
              style: Utility.searchFontStyle(),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 80, 0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(
                      25.0,
                    ),
                  ),
                  borderSide: new BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(
                      25.0,
                    ),
                  ),
                  borderSide: new BorderSide(color: Colors.black),
                ),
                filled: true,
                fillColor: Colors.white60,
                contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                hintText: 'Cherche un article',
              ),
              onChanged: (string) {
                //
              },
            ),
          ),
          Flexible(
            child: gridview(),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }
}
