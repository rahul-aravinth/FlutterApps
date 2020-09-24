import 'package:flutter/material.dart';
import 'package:refund_app/Refund/refund.dart';

void main() {
  runApp(MaterialApp(
    title: 'Ticke Reservation App',
    initialRoute: '/refund',
    routes: {
      '/refund': (context) => Refund(),
    },
  ));
}
