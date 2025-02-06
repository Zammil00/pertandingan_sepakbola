import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CustomGraph extends StatelessWidget {
  const CustomGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Graph'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Graph with decorations
            Stack(
              children: [
                // The Bar Chart
                SizedBox(
                    height: 300,
                    child: BarChart(
                      BarChartData(
                        barGroups: _generateBarGroups(),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                // Customize how the titles appear for the left axis
                                return Text(
                                  value.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                );
                              },
                              reservedSize: 40, // Space for the title
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                // Customize how the titles appear for the bottom axis
                                return Text(
                                  'Label $value',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                );
                              },
                            ),
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false), // Hide right titles
                          ),
                          topTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: false), // Hide top titles
                          ),
                        ),
                        // Add other BarChartData configurations here
                      ),
                    )),
                // Top Row (Icons)
                Positioned(
                  top: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(15, (index) {
                      return Icon(Icons.sports_soccer, size: 24);
                    }),
                  ),
                ),
                // Bottom Row (Icons)
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(15, (index) {
                      return Icon(Icons.redo, size: 24);
                    }),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

 List<BarChartGroupData> _generateBarGroups() {
  final List<BarChartGroupData> barGroups = [];
  for (int i = 0; i < 15; i++) {
    barGroups.add(
      BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: (i % 2 == 0 ? 10 : -10).toDouble(), // Updated 'y' to 'toY'
            color: i % 2 == 0 ? Colors.yellow : Colors.red, // Updated 'colors' to 'color'
            width: 12,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      ),
    );
  }
  return barGroups;
}

}
