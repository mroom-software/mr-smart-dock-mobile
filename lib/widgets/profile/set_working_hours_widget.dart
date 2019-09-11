import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';

class SetWorkingHoursWidget extends StatefulWidget {

  final String title;
  final String desc;
  final Function({int action, dynamic value}) onCallback;

  const SetWorkingHoursWidget({Key key, 
    @required this.title, 
    @required this.desc, 
    @required this.onCallback}) : super(key: key);

  @override
  _SetWorkingHoursWidgetState createState() => _SetWorkingHoursWidgetState();
}

class _SetWorkingHoursWidgetState extends State<SetWorkingHoursWidget> {

  HomeBloc _homeBloc;
  RangeValues _values;
  
  @override
  void initState() {
    _values = RangeValues(9, 19);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _homeBloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'YOUR PROFILE',
          style: Theme.of(context).textTheme.headline,
        ),
        elevation: 0.5,
        leading: InkWell(
          onTap: () {
            if (widget.onCallback != null) {
              widget.onCallback(
                action: -1,
                value: _values,
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
                widget.title,
                style: Theme.of(context).textTheme.title,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Center(
              child: Text(
                widget.desc,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            RangeSlider(
              min: 6,
              max: 20,
              values: _values,
              onChanged: (RangeValues values) {
                setState(() {
                  _values = values;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}