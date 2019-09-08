
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
                title: 'Weight',
                desc: 'Your personal information allows us to calculate your water metabolism and recommend a healthy hydration target.',
                unit: 'kg',
                onCallback: (value) {

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