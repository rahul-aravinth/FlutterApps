import 'package:demo/Screens/Authenticate/authenticate.dart';
import 'package:demo/Screens/Home/home.dart';
import 'package:demo/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FbUser>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
