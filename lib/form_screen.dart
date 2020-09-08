import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_qr_code_app/home_screen.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  String _firstName;
  String _lastName;
  String _githubUsername;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstNameField() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'First Name',
        ),
        validator: (String value) {
          if(value.isEmpty){
            return ' First Name is Required';
          }
        },
        onSaved: (String value) {
          _firstName = value;
        },
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'))],
        textCapitalization: TextCapitalization.words,
      ),
    );
  }

  Widget _buildLastNameField() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Last Name',
        ),
        validator: (String value) {
          if(value.isEmpty){
            return ' Last Name is Required';
          }
        },
        onSaved: (String value) {
          _lastName = value;
        },
        textCapitalization: TextCapitalization.words,
      ),
    );
  }

  Widget _buildGithubNameField() {
    return Container(
      margin: EdgeInsets.only(left: 40, right: 40),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Github Username',
        ),
        validator: (String value) {
          RegExp usernameRegex = RegExp(r'^[a-z\d](?:[a-z\d]|-(?=[a-z\d])){0,38}$');
          if(value.isEmpty){
            return 'Username is Required';
          }
          if(!usernameRegex.hasMatch(value)) {
            return 'Enter Valid Github Username';
          }
        },
        onSaved: (String value) {
          _githubUsername = value;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            _buildFirstNameField(),
            SizedBox(height: 25),
            _buildLastNameField(),
            SizedBox(height: 25),
            _buildGithubNameField(),
            SizedBox(height: 50),
            RaisedButton(
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              color: Colors.lightBlue[700],
              onPressed: () {
                if(!_formKey.currentState.validate()){
                    return;
                }
                _formKey.currentState.save();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(firstName: _firstName, lastName: _lastName, githubUsername: _githubUsername,)),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}