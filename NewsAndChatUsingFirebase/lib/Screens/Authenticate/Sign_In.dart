import 'package:demo/Shared/constants.dart';
import 'package:demo/Shared/loading.dart';
import 'package:demo/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool loading = false;

  //text state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: Text('Sign in'),
              actions: [
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  color: Colors.white,
                ),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      decoration: boxDecorEmail,
                      autofocus: false,
                      style: const TextStyle(fontSize: 21),
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      validator: (val) => val.length < 6
                          ? 'Password should have more than 6 letters'
                          : null,
                      decoration: boxDecorPassword,
                      autofocus: false,
                      style: const TextStyle(fontSize: 21),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    RaisedButton(
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0.0),
                      onPressed: () async {
                        if (_formkey.currentState.validate()) {
                          setState(() => loading = true);
                          dynamic result = await _auth.signIn(email, password);
                          if (result == null) {
                            setState(
                                () => error = 'Please check the Credentials');
                            loading = false;
                          }
                        }
                      },
                      child: Container(
                        decoration: boxDecorSignInAndRegisterButton,
                        padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
                        child: const Text('Sign In',
                            style: TextStyle(fontSize: 21)),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      error,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
