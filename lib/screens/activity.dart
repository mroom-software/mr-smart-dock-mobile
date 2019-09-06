
import 'package:flutter/material.dart';
import 'package:smart_dock_mobile/widgets/activity/filter_widget.dart';
import 'package:smart_dock_mobile/widgets/activity/pie_chart_widget.dart';
import 'package:smart_dock_mobile/widgets/activity/time_series_chart_widget.dart';

class ActivityScreen extends StatefulWidget {

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {

  Widget _buildTopbar() {
    return FilterWidget();
  }

  Widget _buildLineChart() {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'TOTAL: 86 Oz',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: TimeSeriesChartWidget.withSampleData(),
          ),
        ],
      )
    );
  }

  Widget _buildPieChart() {
    return Container(
      padding: const EdgeInsets.all(5),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Daily Progress',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 220,
            child: PieChartWidget.withSampleData(),
          ),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          _buildTopbar(),
          SizedBox(
            height: 30,
          ),
          _buildLineChart(),
          SizedBox(
            height: 30,
          ),
          _buildPieChart(),
        ],
      ),
    );
  }
}