import 'package:flutter/material.dart';
import 'Album.dart';

class AlbumCell extends StatelessWidget {
  const AlbumCell(this.album);
  @required
  final Album album;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Container(
          color: Colors.amber,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Hero(
                        tag: "image${album.id}",
                        child: Container(
                          color: Colors.blue,
                          child: Image.asset(
                            album.thumbnailUrl,
                          ),
                        ),
                      ), //
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          album.title,
                          maxLines: 1,
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
