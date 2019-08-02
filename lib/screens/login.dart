
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                child: Image.asset('assets/top.png'),
                alignment: Alignment.topCenter,
              ),
            ),
            Expanded(
              flex: 5,
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Sign In'
                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }

}