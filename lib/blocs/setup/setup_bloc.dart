import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_events.dart';
import 'package:smart_dock_mobile/blocs/setup/setup_states.dart';
import 'package:smart_dock_mobile/repositories/product_repos.dart';

class SetupBloc extends Bloc<SetupEvent, SetupState> {
  final ProductRepository productRepository;

  SetupBloc({this.productRepository}) : assert(productRepository != null);

  @override
  SetupState get initialState => SetupInitial();

  @override
  Stream<SetupState> mapEventToState(SetupEvent event) async* {
    if (event is SetupWifiPressed) {
      yield SetupLoading();
      try {
        await productRepository.setupWifi(
          ssid: event.ssid,
          wpa: event.wpa,
          onCallback: (error) {
            if (error != null) {
              throw new Exception(error.toString());
            } 
          },
          setupBloc: this,
        );
        
      } on Exception catch(error) {
        yield SetupFailure(error: error.toString());        
      }
    }

    if (event is SetupWebsocketDataReceived) {
      yield SetupSuccess();
    }
  }

  
}