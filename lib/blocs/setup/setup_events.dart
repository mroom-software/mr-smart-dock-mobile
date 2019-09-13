
import 'package:equatable/equatable.dart';

abstract class SetupEvent extends Equatable {
  SetupEvent([List props = const []]) : super(props);
}

class SetupWifiPressed extends SetupEvent {
  final String ssid;
  final String wpa;

  SetupWifiPressed({this.ssid, this.wpa}) : super([ssid, wpa]);

  @override
  String toString() => 'SetupWifiPressed { ssid: $ssid, wpa: $wpa }';

}

class SetupWebsocketDataReceived extends SetupEvent {
  @override
  String toString() => 'SetupWebsocketDataReceived ';
}