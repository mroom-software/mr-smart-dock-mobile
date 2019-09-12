
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_bloc.dart';
import 'package:smart_dock_mobile/blocs/profile/profile_states.dart';
import 'package:smart_dock_mobile/widgets/common/button_icon_widget.dart';

class SetGoalWidget extends StatefulWidget {

  final Function({int action, dynamic value}) onCallback;

  const SetGoalWidget({Key key, this.onCallback}) : super(key: key);

  @override
  _SetGoalWidgetState createState() => _SetGoalWidgetState();
}

class _SetGoalWidgetState extends State<SetGoalWidget> {

  HomeBloc _homeBloc;
  ProfileBloc _profileBloc;
  double _value;

  @override
  void initState() {
    _value = 2000;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _profileBloc = BlocProvider.of<ProfileBloc>(context);

    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _profileBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'PROFILE',
              style: Theme.of(context).textTheme.headline,
            ),
            elevation: 0.5,
            leading: InkWell(
              onTap: () {
                if (widget.onCallback != null) {
                  widget.onCallback(
                    action: -1,
                    value: _value,
                  );
                }
              },
              child: Icon(
                Icons.keyboard_backspace,
                color: Theme.of(context).primaryColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: () {
                    _homeBloc.dispatch(HomeSkipProfileUpdate());
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ] 
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Your Goal',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    _value.round().toString(),
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 21.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'ml/day',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text(
                    'Recommend Volume: ' + ((state is ProfileLoadGoalFinish) ? state.goal.toString() : '...') + ' ml/day',
                    style: Theme.of(context).textTheme.body1,
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Slider(
                  value: _value,
                  min: 1000,
                  max: 4000,
                  divisions: 3000,
                  activeColor: Colors.blue,
                  label: '${_value.toInt().toString()} ml/day',
                  onChanged: (double newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ButtonIconWidget(
                    title: 'FINISH',
                    onPressed: () {
                      if(widget.onCallback != null) {
                        widget.onCallback(
                          action: 1,
                          value: _value,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          
        );
      },
    );
  }
}