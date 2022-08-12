import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.width * 0.7,
      width: MediaQuery.of(context).size.width * 0.52,
      child: PieChart(PieChartData(
        sections: [
          PieChartSectionData(
            value: 20,
            radius: 80,
            title: "",
            color: Colors.redAccent.shade200.withOpacity(0.7),
          ),
          PieChartSectionData(
            value: 31,
            radius: 80,
            title: "",
            color: Colors.blueAccent,
          ),
          PieChartSectionData(
            value: 23,
            radius: 80,
            title: "",
            color: Colors.lightGreen,
          ),
          PieChartSectionData(
            value: 12,
            radius: 80,
            title: "",
            color: Colors.yellow.shade200,
          ),
          PieChartSectionData(
            value: 15,
            radius: 80,
            title: "",
            color: Colors.deepOrangeAccent,
          ),
        ],
        centerSpaceRadius: 0,
        startDegreeOffset: 270,
        sectionsSpace: 0,
      )),
    );
  }
}
