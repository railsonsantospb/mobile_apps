import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class LaunchUrlDemo extends StatefulWidget {
  //
  LaunchUrlDemo({Key key}) : super(key: key);
  final String title = 'Launch Url';

  @override
  _LaunchUrlDemoState createState() => _LaunchUrlDemoState();
}

class _LaunchUrlDemoState extends State<LaunchUrlDemo> {
  //
  Future<void> _launched;
  String phoneNumber = '';
  String _launchUrl = 'https://www.google.com';

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInApp(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
        headers: <String, String>{'header_key': 'header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(String url) async {
    if (await canLaunch(url)) {
      final bool nativeAppLaunchSucceeded = await launch(
        url,
        forceSafariVC: false,
        universalLinksOnly: true,
      );
      if (!nativeAppLaunchSucceeded) {
        await launch(url, forceSafariVC: true);
      }
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: const Text('Launch In Browser'),
              onPressed: () {
                setState(() {
                  _launched = _launchInBrowser(_launchUrl);
                });
              },
            ),
            RaisedButton(
              child: const Text('Launch In App'),
              onPressed: () {
                setState(() {
                  _launched = _launchInApp(_launchUrl);
                });
              },
            ),
            RaisedButton(
              child: const Text('Launch Universal Link'),
              onPressed: () {
                setState(() {
                  _launched = _launchUniversalLinkIos('https://youtube.com');
                });
              },
            ),
            RaisedButton(
              child: const Text('Make Phone Call'),
              onPressed: () {
                setState(() {
                  _launched = _makePhoneCall('tel:1234567890');
                });
              },
            ),
            RaisedButton(
              child: const Text('Close webview after 5 seconds'),
              onPressed: () {
                setState(() {
                  _launched = _launchInApp(_launchUrl);
                });
                Timer(const Duration(seconds: 5), (){
                  closeWebView();
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            FutureBuilder(
              future: _launched,
              builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return Text('Launched.');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
