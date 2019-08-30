
import 'dart:convert';
import 'package:meta/meta.dart';
import 'dart:io';

import 'package:smart_dock_mobile/config/config.dart';

class ProductRepository {

  Future<void> setupWifi({
    @required String ssid,
    @required String wpa,
    @required Function onCallback,
  }) async {

    await Socket.connect(Config.hostspotIP, 4567).then((socket) {
      print('Connected to: '
        '${socket.remoteAddress.address}:${socket.remotePort}');
      
      socket.listen((List<int> event) {
        String message = new String.fromCharCodes(event).trim();
        print('Received: $message');
      },
      onError: (error) {
        onCallback(error);
        return error;
      },
      onDone: () {
        print('done');
      });

      Map<String, String> data = new Map();
      data['SSID'] = ssid;
      data['WPA'] = wpa;

      socket.write(jsonEncode(data));
    });

  }

}