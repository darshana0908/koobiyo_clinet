import 'package:client_app/const/color.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomChart2 extends StatelessWidget {
  const CustomChart2();

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
            backgroundColor: black,
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
              const TextStyle(
                color: Color.fromARGB(255, 1, 27, 31),
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitlesMonth(double value, TitleMeta meta) {
    final style = TextStyle(
      color: white2,
      fontWeight: FontWeight.bold,
      fontSize: 9,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Jan';
        break;
      case 1:
        text = 'Feb';
        break;
      case 2:
        text = 'Mar';
        break;
      case 3:
        text = 'Ap';
        break;
      case 4:
        text = 'May';
        break;
      case 5:
        text = 'Jun';
        break;
      case 6:
        text = 'Jul';
        break;
      case 7:
        text = 'Aug';
        break;
      case 8:
        text = 'Sep';
        break;
      case 9:
        text = 'Oct';
        break;
      case 10:
        text = 'Nov';
        break;
      case 11:
        text = 'Dec';
        break;

      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 2,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          axisNameSize: 18,
          axisNameWidget: Text(
            'Monthly Orders',
            style: TextStyle(color: white2, fontSize: 14.dp),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitlesMonth,
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

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          const Color.fromARGB(255, 51, 0, 60),
          Color.fromARGB(255, 1, 58, 19)
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(
          barsSpace: 1,
          x: 0,
          barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.circular(3),
                toY: 8,
                color: white3,
                width: 10)
          ],
        ),
        BarChartGroupData(
          x: 1,
          barRods: [
            BarChartRodData(
                borderRadius: BorderRadius.circular(3),
                toY: 10,
                color: white3,
                width: 10)
          ],
        ),
        BarChartGroupData(
          x: 2,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 14,
            )
          ],
        ),
        BarChartGroupData(
          x: 3,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 15,
            )
          ],
        ),
        BarChartGroupData(
          x: 4,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 13,
            )
          ],
        ),
        BarChartGroupData(
          x: 5,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 10,
            )
          ],
        ),
        BarChartGroupData(
          x: 6,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 100,
            )
          ],
        ),
        BarChartGroupData(
          x: 7,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 100,
            )
          ],
        ),
        BarChartGroupData(
          x: 8,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 100,
            )
          ],
        ),
        BarChartGroupData(
          x: 9,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 100,
            )
          ],
        ),
        BarChartGroupData(
          x: 10,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
              toY: 100,
            )
          ],
        ),
        BarChartGroupData(
          x: 11,
          barRods: [
            BarChartRodData(
              borderRadius: BorderRadius.circular(3),
              color: white3,
              width: 10,
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
