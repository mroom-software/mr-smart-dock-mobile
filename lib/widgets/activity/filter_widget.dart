
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  final Function(String value) onCallback;

  const FilterWidget({Key key, this.onCallback}) : super(key: key);

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String selectedTab = 'D';

  Widget _buildCircle(String title) {
    return InkWell(
      onTap: () {
        if (widget.onCallback != null) {
          widget.onCallback(title);
        }

        setState(() {
          selectedTab = title;
        });
      },
      child: Container(
        width: 36,
        height: 36,
        decoration: new BoxDecoration(
          color: (selectedTab == title) ? Theme.of(context).bottomAppBarColor : Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: (selectedTab == title) ? Colors.white : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black26,
              blurRadius: .0,
              offset: Offset(0.0, 0.25)
          )
        ],
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: _buildCircle('D'),
          ),
          Expanded(
            flex: 2,
            child: _buildCircle('W'),
          ),
          Expanded(
            flex: 2,
            child: _buildCircle('M'),
          ),
          Expanded(
            flex: 2,
            child: _buildCircle('Y'),
          ),
        ],
      ),
    );
  }
}