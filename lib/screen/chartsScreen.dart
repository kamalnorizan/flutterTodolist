import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

class ChartScreen extends StatelessWidget {

  BarTouchData barTouchData = BarTouchData(
    enabled: false,
  );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        // leftTitles: const AxisTitles(
        //   sideTitles: SideTitles(showTitles: false),
        // ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 8)]),
        BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 15)]),
        BarChartGroupData(x: 2, barRods: [BarChartRodData(toY: 9)]),
        BarChartGroupData(x: 3, barRods: [BarChartRodData(toY: 18)]),
        BarChartGroupData(x: 4, barRods: [BarChartRodData(toY: 5)]),
        BarChartGroupData(x: 5, barRods: [BarChartRodData(toY: 18)]),
        BarChartGroupData(x: 6, barRods: [BarChartRodData(toY: 9)]),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: BarChart(BarChartData(
          barTouchData: barTouchData,
          titlesData: titlesData,
          borderData: borderData,
          barGroups: barGroups,
          gridData: const FlGridData(
            drawVerticalLine: false,
            drawHorizontalLine: true
          ),
          maxY: 20
        )),
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    String text = '';
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
        text = 'Th';
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
    }
    return SideTitleWidget(
      child: Text(text),
      axisSide: meta.axisSide,
    );
  }
}
