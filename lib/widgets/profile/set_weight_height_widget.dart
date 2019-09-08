import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';

class SetWeightHeightWidget extends StatefulWidget {

  final String title;
  final String desc;
  final String unit;
  final Function(String value) onCallback;

  const SetWeightHeightWidget({Key key, 
    @required this.title, 
    @required this.desc, 
    @required this.unit, 
    @required this.onCallback}) : super(key: key);


  @override
  _SetWeightHeightWidgetState createState() => _SetWeightHeightWidgetState();
}

class _SetWeightHeightWidgetState extends State<SetWeightHeightWidget> {
  HomeBloc _homeBloc;

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
        leading: (widget.unit == 'kg') ? null : InkWell(
          onTap: () {
            Navigator.pop(context);
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
      body: Column(
        children: <Widget>[
          
        ],
      ),
    );
  }
}