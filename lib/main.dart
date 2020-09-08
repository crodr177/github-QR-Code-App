import 'package:flutter/material.dart';
import 'package:github_qr_code_app/form_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github QR Code Generator',
      theme: ThemeData(
        primaryColor: Colors.lightBlue[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Github QR Code Generator'),
      debugShowCheckedModeBanner: false
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.lightBlue[900],
            fontSize: 25,
          ),
        ),
        brightness: Brightness.light,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: DraggableScrollableSheet(
        builder: (BuildContext context, ScrollController scrollController) {
        return ListView(
          children: <Widget> [
          Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormScreen(),
          ],
        ),
      ),
      ],
      );
      },
      initialChildSize: 1.0,
      expand: false,
      ),
    );
  }
}
