
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_bloc.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_events.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_states.dart';
import 'package:smart_dock_mobile/widgets/setup/active_smartdock_widget.dart';
import 'package:smart_dock_mobile/widgets/setup/connect_hotspot_widget.dart';
import 'package:smart_dock_mobile/widgets/setup/setup_wifi_widget.dart';

class SetupScreen extends StatefulWidget {

  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {

  int _idx;

  SetupBloc _setupBloc;

  @override
  void initState() {
    _idx = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setupBloc = BlocProvider.of<SetupBloc>(context);

    return BlocListener<SetupBloc, SetupState>(
      listener: (context, state) {

      },
      child: BlocBuilder<SetupBloc, SetupState>(
        bloc: _setupBloc,
        builder: (context, state) {
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

            case 2:
              return ConnectHotspotWidget(
                title: 'Connect SmartDock hotspot',
                description: 'Go to Settings > Wifi > Connect SmartDock',
                imgName: 'assets/setup_3.png',
                onCallback: () {
                  setState(() {
                    _idx++;
                  });
                },
              );

            case 3:
              return SetupWifiWidget(
                title: 'WIFI',
                description: 'Input your wifi configuration to finish process',
                onCallback: (ssid, wpa) {
                  _setupBloc.add(
                    SetupWifiPressed(
                      ssid: ssid,
                      wpa: wpa,
                    )
                  );
                },
              );
          }
          
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}