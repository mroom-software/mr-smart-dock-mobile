import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:label_textfield_widget/label_textfield_widget.dart';

class SetupScreen extends StatefulWidget {

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  String txtSSID, txtWPA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SETUP',
          style: Theme.of(context).textTheme.headline,
        ),
        elevation: 0.5,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: LabelTextFieldWidget(
                    hintText: 'SSID',
                    showBorder: false,
                    showClearBtn: true,
                    onTxtChanged: (value) {
                      txtSSID = value;
                    },
                  ),
                ), 
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: LabelTextFieldWidget(
                    hintText: 'WPA',
                    showBorder: false,
                    showClearBtn: true,
                    onTxtChanged: (value) {
                      txtWPA = value;
                    },
                  ),
                ), 
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 44,
                width: 120,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    Socket.connect('192.168.4.1', 4567).then((socket) {
                    print('Connected to: '
                      '${socket.remoteAddress.address}:${socket.remotePort}');
                    socket.listen((List<int> event) {
                        String message = new String.fromCharCodes(event).trim();
                        print('Received: $message');
                      },
                      onError: (error) {
                        print(error);
                      },
                      onDone: () {
                        print('done');
                      });

                      Map<String, String> data = new Map();
                      data['SSID'] = txtSSID;
                      data['WPA'] = txtWPA;

                      socket.write(jsonEncode(data));
                    });
                  },
                  child: Text(
                    'SEND',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}