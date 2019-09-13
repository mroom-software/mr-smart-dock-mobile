
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_bloc.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_events.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_states.dart';
import 'package:smart_dock_mobile/widgets/profile/set_goal_widget.dart';
import 'package:smart_dock_mobile/widgets/profile/set_weight_height_widget.dart';
import 'package:smart_dock_mobile/widgets/profile/set_working_hours_widget.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int _idx;
  ProfileBloc _profileBloc;
  HomeBloc _homeBloc;

  Map data = new Map<String, dynamic>();

  @override
  void initState() {
    _idx = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileFinish) {
          _homeBloc.dispatch(HomeSkipProfileUpdate());
        }

      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _profileBloc,
        builder: (context, state) {
          switch (_idx) {
            case 0:
              return SetWeightHeightWidget(
                key: Key('Weight'),
                title: 'Weight',
                desc: 'Your personal information allows us to calculate your water metabolism and recommend a healthy hydration target.',
                unit: 'kg',
                onCallback: ({action, value}) {
                  data['weight'] = value;
                  setState(() {
                    _idx = _idx + action;
                  });
                },
              );
              break;
            case 1:
              return SetWeightHeightWidget(
                key: Key('Height'),
                title: 'Height',
                desc: 'Your personal information allows us to calculate your water metabolism and recommend a healthy hydration target.',
                unit: 'cm',
                onCallback: ({action, value}) {
                  data['height'] = value;
                  setState(() {
                    _idx = _idx + action;
                  });
                },
              );
              break;

            case 2:
              return SetWorkingHoursWidget(
                key: Key('WorkingHours'),
                title: 'Working Hours',
                desc: 'Your personal information allows us to calculate your water metabolism and recommend a healthy hydration target.',
                onCallback: ({action, value}) {
                  data['working_hours'] = value;
                  setState(() {
                    _idx = _idx + action;
                  });
                },
              );
              break;

            case 3:
              _profileBloc.dispatch(LoadWaterGoal(workingHours: data['working_hours']));
              return SetGoalWidget(
                onCallback: ({action, value}) {
                  data['goal'] = value;
                  if (action < 0) {
                    setState(() {
                      _idx = _idx + action;
                    });
                  } else {
                    _profileBloc.dispatch(FinishButtonPressed(
                      workingHours: data['working_hours'],
                      weight: data['weight'].round(),
                      height: data['height'].round(),
                      waterGoal: data['goal'].round(),
                    ));
                  }
                },
              );
              break;
            default:
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}