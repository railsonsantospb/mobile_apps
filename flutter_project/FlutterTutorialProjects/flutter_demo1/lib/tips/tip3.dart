import 'package:flutter/material.dart';

class Tip3 extends StatefulWidget {
  Tip3() : super();

  final String title = "Tip3 Demo";

  @override
  Tip3State createState() => Tip3State();
}

class Tip3State extends State<Tip3> {
  //
  String imgUrl;

  _dismissKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  _onSelect() {
    print('selected');
  }

  Widget body1() {
    return GestureDetector(
      onTap: () {
        _dismissKeyboard(context);
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            TextField(),
          ],
        ),
      ),
    );
  }

  Widget body2() {
    // return  Container(
    //   color: Color.fromRGBO(0, 0, 0, 0.5),
    // );
    // return  Container(
    //   color: Color(0xFF4286f4),
    // );
    // return  Container(
    //   color: Color(0xFF4286f4).withOpacity(0.5),
    // );
    return Container(
      color: Color(0xFF4286f4),
    );
  }

  Widget body3() {
    return Container(
      color: Colors.orangeAccent,
      height: 100.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.white.withOpacity(0.2),
          onTap: this._onSelect,
          child: Center(
            child: Text("Hello"),
          ),
        ),
      ),
    );
  }

  Widget body4() {
    return Container(
      height: 40.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
    );
  }

  Widget body5() {
    return Container(
      margin: EdgeInsets.all(50),
      width: 250.0,
      height: 350.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        image: DecorationImage(image: NetworkImage(imgUrl), fit: BoxFit.fill),
      ),
    );
  }

  Widget body6() {
    return ClipOval(
      child: Image.network(
        imgUrl,
        fit: BoxFit.fill,
        width: 190.0,
        height: 190.0,
      ),
    );
  }

  Widget body7() {
    return Container(
      height: 300,
      width: 200,
      child: CircleAvatar(
        radius: 100.0,
        backgroundImage: NetworkImage(
          imgUrl,
        ),
      ),
    );
  }

  Widget body8() {
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
      itemCount: 20,
      itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: Text("Index $index")),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // using null aware operators

    if (imgUrl == null) {
      imgUrl =
          'https://images.pexels.com/photos/40984/animal-ara-macao-beak-bird-40984.jpeg?cs=srgb&dl=animal-colorful-colourful-40984.jpg&fm=jpg';
    }

    imgUrl ??=
        'https://images.pexels.com/photos/40984/animal-ara-macao-beak-bird-40984.jpeg?cs=srgb&dl=animal-colorful-colourful-40984.jpg&fm=jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue,
        child: body8(),
      ),
    );
  }
}
