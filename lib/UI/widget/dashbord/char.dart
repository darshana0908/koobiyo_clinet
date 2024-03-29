import 'package:client_app/const/color.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomChart extends StatelessWidget {
  const CustomChart();

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: h / 2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BarChart(
          BarChartData(
            backgroundColor: bacground2,
            barTouchData: barTouchData,
            titlesData: titlesData,
            borderData: FlBorderData(
                border: Border.all(
              width: 1,
            )),
            barGroups: barGroups,
            alignment: BarChartAlignment.spaceAround,
          ),
        ),
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Color.fromARGB(0, 236, 231, 231),
          tooltipPadding: EdgeInsets.zero,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: white2,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: white3,
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mn';
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

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          axisNameSize: 20,
          axisNameWidget: Text(
            'Daily Orders',
            style: TextStyle(color: white2, fontSize: 14.dp),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitles,
            interval: 20,
            reservedSize: 42,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          showingTooltipIndicators: [0],
          barsSpace: 10,
          x: 0,
          barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.circular(3),
                toY: 8,
                color: red,
                width: 20)
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.circular(3),
                toY: 10,
                color: Colors.green,
                width: 20)
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: brown,
              width: 20,
              toY: 14,
            )
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: blue,
              width: 20,
              toY: 15,
            )
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: black,
              width: 20,
              toY: 13,
            )
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: bacground2,
              width: 20,
              toY: 10,
            )
          ],
        ),
        BarChartGroupData(
          barsSpace: 2,
          x: 6,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: Colors.deepOrange,
              width: 20,
              toY: 100,
            )
          ],
        ),
      ];
  Widget leftTitles(double value, TitleMeta meta) {
    final style = TextStyle(color: white2, fontSize: 10);
    String text;
    if (value == 0) {
      text = '0';
    } else {
      text = '${value.toInt()}0k';
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }
}
