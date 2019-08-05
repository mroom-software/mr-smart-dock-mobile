
import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/widgets/button_icon_widget.dart';
import 'package:smart_dock_mobile/widgets/button_widget.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/top.png'),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.headline,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).accentColor),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Your Password',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 30,
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF5F5F5),
                                border: Border.all(color: Color(0xFFF5F5F5)),
                                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                              ),
                              child: Center(
                                child: InkWell(
                                  onTap: () {
                                    
                                  },
                                  child: Text(
                                    'SHOW',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF003BFF),
                                    ),
                                  ),
                                ), 
                              ),
                            ), 
                          ),
                          
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonWidget(

                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      child: Text(
                        '_____OR_____',
                        style: TextStyle(
                          fontSize: 13.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    ButtonIconWidget(

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Text(
                            'FORGOT DETAIL?',
                            style: Theme.of(context).textTheme.display1,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Align(
                            alignment: Alignment.centerRight, 
                            child: Text(
                              'CREATE ACCOUNT',
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ],

                ),
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}