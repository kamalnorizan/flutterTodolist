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

  LinearGradient get _barsGradient => const LinearGradient(
        colors: [Colors.blueAccent, Colors.lightBlueAccent],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => [
        BarChartGroupData(x: 0, barRods: [
          BarChartRodData(
            toY: 8,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
        BarChartGroupData(x: 1, barRods: [
          BarChartRodData(
            toY: 15,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
        BarChartGroupData(x: 2, barRods: [
          BarChartRodData(
            toY: 9,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
        BarChartGroupData(x: 3, barRods: [
          BarChartRodData(
            toY: 18,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
        BarChartGroupData(x: 4, barRods: [
          BarChartRodData(
            toY: 5,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
        BarChartGroupData(x: 5, barRods: [
          BarChartRodData(
            toY: 18,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
        BarChartGroupData(x: 6, barRods: [
          BarChartRodData(
            toY: 9,
            gradient: _barsGradient,
            width: 25,
          )
        ]),
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
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StatCard(
                      title: 'Jumlah Jualan',
                      value: '20,000',
                      bgColor: Colors.purpleAccent),
                ),
                Expanded(
                    child: StatCard(
                        title: 'Pelanggan',
                        value: '195',
                        bgColor: Colors.orangeAccent))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: StatCard(
                      title: 'Tidak Terjual',
                      value: '80',
                      bgColor: Colors.red),
                ),
                Expanded(
                    child: StatCard(
                        title: 'Untung',
                        value: '1,300',
                        bgColor: Colors.greenAccent))
              ],
            ),
            const Text(
              'Laporan Harian',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                    barTouchData: barTouchData,
                    titlesData: titlesData,
                    borderData: borderData,
                    barGroups: barGroups,
                    gridData: const FlGridData(
                        drawVerticalLine: false, drawHorizontalLine: true),
                    maxY: 20),
              ),
            ),
            Expanded(
              child: BarChart(BarChartData(
                  barTouchData: barTouchData,
                  titlesData: titlesData,
                  borderData: borderData,
                  barGroups: barGroups,
                  gridData: const FlGridData(
                      drawVerticalLine: false, drawHorizontalLine: true),
                  maxY: 20)),
            ),
          ],
        ),
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
      axisSide: meta.axisSide,
      child: Text(text),
    );
  }
}

class StatCard extends StatelessWidget {
  String title;
  String value;
  Color bgColor;

  StatCard({
    required this.title,
    required this.value,
    required this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: bgColor,
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              value,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
