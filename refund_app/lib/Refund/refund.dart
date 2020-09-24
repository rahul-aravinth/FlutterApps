import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:refund_app/Shared/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Refund extends StatefulWidget {
  @override
  _RefundState createState() => _RefundState();
}

class _RefundState extends State<Refund> {
  final _formkey = GlobalKey<FormState>();
  final RegExp nameRegex = new RegExp(r"^[a-zA-Z ,.'-]+$");
  final RegExp phoneRegex = new RegExp(r'^[6-9]\d{9}$');
  final RegExp expiryDateRegex = new RegExp(r'^(0[1-9]|1[0-2])\/?(2[0-9])$');
  final RegExp cvvRegex = new RegExp(r'^[0-9]{3}$');
  final RegExp cardRegex = new RegExp(r'^\d{16}$');

  String ticketid = '';
  String name = '';
  String phone = '';
  String account = '';
  String date = '';
  String cvv = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Refund Form',
          style: textDecorationForAppBar,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Ticked Id';
                    } else if (val.length <= 5) {
                      return 'Ticket Id is not this short!';
                    }
                    return null;
                  },
                  decoration: boxDecorationForId,
                  autofocus: false,
                  style: textDecorationForFormElements,
                  onChanged: (val) {
                    setState(() {
                      ticketid = val;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Name';
                    } else if (val.length <= 3) {
                      return 'Name is too short. Try Full Name Instead';
                    } else if (!nameRegex.hasMatch(val)) {
                      return 'Name should Not contain any numbers or Special Chars';
                    }
                    return null;
                  },
                  decoration: boxDecorationForName,
                  autofocus: false,
                  style: textDecorationForFormElements,
                  onChanged: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    new FilteringTextInputFormatter.allow(
                        new RegExp(r'^[0-9]*$')),
                    new LengthLimitingTextInputFormatter(10)
                  ],
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Phone Number';
                    } else if (!phoneRegex.hasMatch(val)) {
                      return 'Enter Valid Phone Number';
                    }
                    return null;
                  },
                  decoration: boxDecorationForPhone,
                  autofocus: false,
                  style: textDecorationForFormElements,
                  onChanged: (val) {
                    setState(() {
                      phone = val;
                    });
                  },
                ),
                SizedBox(height: 10),
                Text(
                  'Account Details for Refund',
                  style: textDecorationForFormHeaders,
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Enter Account Number';
                    } else if (!cardRegex.hasMatch(val)) {
                      return 'Account Number is 16 digit Numeric';
                    }
                    return null;
                  },
                  decoration: boxDecorationForAccount,
                  autofocus: false,
                  style: textDecorationForFormElements,
                  onChanged: (val) {
                    setState(() {
                      account = val;
                    });
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    new Flexible(
                      child: new TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          new FilteringTextInputFormatter.allow(
                              new RegExp(r'^[0-9\/]*$')),
                          new LengthLimitingTextInputFormatter(10)
                        ],
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter Expiry Date';
                          } else if (!expiryDateRegex.hasMatch(val)) {
                            return 'Format MM/YY';
                          }
                          return null;
                        },
                        decoration: boxDecorationForExpiryDate,
                        autofocus: false,
                        style: textDecorationForFormElements,
                        onChanged: (val) {
                          setState(() {
                            date = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(width: 10),
                    new Flexible(
                      child: new TextFormField(
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          new FilteringTextInputFormatter.allow(
                              new RegExp(r'^[0-9]*$')),
                          new LengthLimitingTextInputFormatter(10)
                        ],
                        validator: (val) {
                          if (val.isEmpty) {
                            return 'Enter CVV';
                          } else if (!cvvRegex.hasMatch(val)) {
                            return 'Enter Valid CVV';
                          }
                          return null;
                        },
                        decoration: boxDecorationForCVV,
                        autofocus: false,
                        style: textDecorationForFormElements,
                        onChanged: (val) {
                          setState(() {
                            cvv = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                RaisedButton(
                  textColor: Colors.white,
                  padding: EdgeInsets.all(0.0),
                  onPressed: () async {
                    if (_formkey.currentState.validate()) {
                      _statusAlert(context);
                    }
                  },
                  child: Container(
                    decoration: boxDecorationForRefundButton,
                    padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                    child: const Text(
                      'Cancel and Refund',
                      style: textDecorationForButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _statusAlert(context) {
    Alert(
      context: context,
      title: "Status",
      desc:
          "Money Refund is intialized. Please contact Support if there is any issues",
      buttons: [
        DialogButton(
          child: Text(
            "OKAY",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
      ],
    ).show();
  }
}
