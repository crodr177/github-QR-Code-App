import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final String firstName;
  final String lastName;
  final String githubUsername;

  HomeScreen({Key key, @required this.firstName, @required this.lastName, @required this.githubUsername}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SafeArea(
      child: Center(
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage(
                              'images/profile_icon.png'),
                          width: 23,
                          height: 23,
                        ),
                        margin: EdgeInsets.only(right: 15),
                      ),
                      Flexible(
                        child: Text(
                          '$firstName $lastName',
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage(
                              'images/github_icon.png'),
                          width: 23,
                          height: 23,
                        ),
                        margin: EdgeInsets.only(right: 15),
                      ),
                      Text(
                        '$githubUsername',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 15,
                      style: BorderStyle.solid,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  margin: EdgeInsets.only(top: 20),
                  child: Image(
                    image: NetworkImage('https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=github.com/$githubUsername'
                    )
                  )
                ),
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}