
import 'dart:convert';
import 'package:meta/meta.dart';
import 'dart:io';
import 'package:smart_dock_mobile/blocs/setup/setup_bloc.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_events.dart';
import 'package:smart_dock_mobile/config/config.dart';
import 'package:smart_dock_mobile/data/db/db.dart';
import 'package:smart_dock_mobile/data/models/user.dart';

class ProductRepository {
  final DB db;

  ProductRepository({@required this.db}) : assert(db != null);

  Future<void> setupWifi({
    @required String ssid,
    @required String wpa,
    @required Function onCallback,
    @required SetupBloc setupBloc,
  }) async {
    User user = await db.selectUser();
    await Socket.connect(Config.hostspotIP, 4567, timeout: Duration(seconds: 5)).then((socket) {
      print('Connected to: '
        '${socket.remoteAddress.address}:${socket.remotePort}');
      
      socket.listen((List<int> event) {
        String message = new String.fromCharCodes(event).trim();
        print('Received: $message');
        if (message == 'NO') {
          setupBloc.add(SetupWebsocketDataNotReceived());
        } else {
          setupBloc.add(SetupWebsocketDataReceived());
        }
        
      },
      onError: (error) {
        onCallback(error);
      },
      onDone: () {
        print('done');
      });

      Map<String, String> data = new Map();
      data['SSID'] = ssid;
      data['WPA'] = wpa;
      data['ID'] = user.apiToken;

      socket.write(jsonEncode(data));
    });

  }

}