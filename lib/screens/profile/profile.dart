
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_bloc.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_states.dart';
import 'package:smart_dock_mobile/widgets/profile/set_weight_height_widget.dart';

class ProfileScreen extends StatefulWidget {
  
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  int _idx;
  ProfileBloc _profileBloc;
  Map data = new Map<String, dynamic>();

  @override
  void initState() {
    _idx = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);

    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {

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