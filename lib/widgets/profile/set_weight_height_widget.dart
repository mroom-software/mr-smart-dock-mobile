import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_bloc.dart';
import 'package:smart_dock_mobile/blocs/home/home_events.dart';

class SetWeightHeightWidget extends StatefulWidget {

  @override
  _SetWeightHeightWidgetState createState() => _SetWeightHeightWidgetState();
}

class _SetWeightHeightWidgetState extends State<SetWeightHeightWidget> {
  HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    _homeBloc = BlocProvider.of<HomeBloc>(context);

    print('DEBUG $_homeBloc');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'SETUP',
          style: Theme.of(context).textTheme.headline,
        ),
        elevation: 0.5,
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
      body: Center(
        child: Text(
          'Text'
        ),
      ),
    );
  }
}