
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
          title: 'Activate your SmartDock',
          description: 'Press reset button till the leds flash',
          imgName: 'assets/setup_1.png',
          onCallback: () {
            setState(() {
              _idx++;
            });
          },
        );

      case 1:
        return ActiveSmartDockWidget(
          title: 'Activate your SmartDock',
          description: 'Place an empty cup on top of SmartDock till the leds off',
          imgName: 'assets/setup_2.png',
          onCallback: () {
            setState(() {
              _idx++;
            });
          },
        );
    }
    
    return CircularProgressIndicator();
  }
}