import 'package:bloc/bloc.dart';
import 'package:smart_dock_mobile/blocs/activity/activity_events.dart';
import 'package:smart_dock_mobile/blocs/activity/activity_states.dart';
import 'package:smart_dock_mobile/repositories/log_respos.dart';

class ActivityBloc extends Bloc<ActivityEvent, ActivityState> {
  final LogRepository logRepository;

  ActivityBloc({this.logRepository}) : assert(logRepository != null);

  @override
  ActivityState get initialState => ActivityInitial();

  @override
  Stream<ActivityState> mapEventToState(ActivityEvent event) {
    return null;
  }

}