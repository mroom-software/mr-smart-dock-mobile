
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  Widget _buildCircle(String title) {
    return InkWell(
      onTap: () => print('touched'),
      child: Container(
        width: 36,
        height: 36,
        decoration: new BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            title,
          ),
        ),
      ),
    );
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