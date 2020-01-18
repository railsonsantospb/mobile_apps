import 'package:flutter/material.dart';

class TableDemo extends StatefulWidget {
  TableDemo() : super();

  final String title = "Table Demo App";

  @override
  TableDemoState createState() => TableDemoState();
}

class TableDemoState extends State<TableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Data 1"),
              ),
              Text("Data 2"),
              Text("Data 3"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
          TableRow(
            children: [
              Text("Data 4Data 4Data 4Data 4Data 4Data 4Data 4"),
              Text("Data 5"),
              Text("Data 6"),
            ],
          ),
        ],
      ),
    );
  }
}
