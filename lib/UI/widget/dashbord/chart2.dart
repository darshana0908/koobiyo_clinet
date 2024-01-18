import 'package:client_app/const/color.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartScreen extends StatelessWidget {
  const BarChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      color: const Color.fromARGB(255, 1, 22, 39),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
          height: h / 2.5,
          child: BarChart(BarChartData(
              // gridData: const FlGridData(show: false),
              titlesData: titlesData,
              backgroundColor: black,
              borderData: FlBorderData(border: Border.all(width: 2)),
              groupsSpace: 20,
              barGroups: barGroups))),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            interval: 2,
            showTitles: true,
            reservedSize: 60,
            getTitlesWidget: (value, meta) {
              print(value);
              print(meta);
              return getTitles(value, meta);
            },
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );
  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          groupVertically: true,
          barRods: [BarChartRodData(toY: 10, color: red, fromY: 0, width: 20)],
        ),
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.circular(3),
                toY: 1000,
                color: red,
                fromY: 0,
                width: 20)
          ],
        ),
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          barRods: [BarChartRodData(toY: 20, color: red, fromY: 0, width: 20)],
        ),
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          barRods: [BarChartRodData(toY: 10, color: red, fromY: 0, width: 20)],
        ),
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          barRods: [BarChartRodData(toY: 30, color: red, fromY: 0, width: 20)],
        ),
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          barRods: [BarChartRodData(toY: 100, color: red, fromY: 0, width: 20)],
        ),
        BarChartGroupData(
          x: 0,
          barsSpace: 20,
          barRods: [BarChartRodData(toY: 40, color: red, fromY: 0, width: 20)],
        ),
      ];
  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: const Color.fromARGB(255, 1, 22, 39),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'M';
        break;
      case 1:
        text = 'Te';
        break;
      case 2:
        text = 'Wd';
        break;
      case 3:
        text = 'Tu';
        break;
      case 4:
        text = 'Fr';
        break;
      case 5:
        text = 'St';
        break;
      case 6:
        text = 'Sn';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }
}
