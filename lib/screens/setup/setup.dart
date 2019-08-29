
import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/widgets/setup/active_smartdock_widget.dart';
class SetupScreen extends StatefulWidget {

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {

  int _idx;

  @override
  void initState() {
    super.initState();

    _idx = 0;
  }

  @override
  Widget build(BuildContext context) {
    switch (_idx) {
      case 0:
        return ActiveSmartDockWidget(
          title: '1',
          description: '2',
          imgName: 'assets/setup_1.png',
        );

      case 1:
        return ActiveSmartDockWidget(
          title: '1',
          description: '2',
          imgName: 'assets/setup_2.png',
        );
    }
    
    return CircularProgressIndicator();
  }
}