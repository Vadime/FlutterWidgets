import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BarChartWidget extends StatelessWidget {
  final String? interpretation;
  final String? leftTitle;
  final String? bottomTitle;
  final double maxY;
  final Map<String, double> bars;
  const BarChartWidget({
    this.interpretation,
    required this.maxY,
    required this.bars,
    this.leftTitle,
    this.bottomTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY,
        barTouchData: BarTouchData(
          enabled: true,
          touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: context.theme.primaryColor,
            tooltipMargin: context.config.paddingH,
            fitInsideHorizontally: true,
            fitInsideVertically: true,
            tooltipRoundedRadius: context.config.radius,
            tooltipPadding: EdgeInsets.fromLTRB(
                context.config.paddingH, 6, context.config.paddingH, 0),
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${rod.toY.round()}',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            axisNameWidget: bottomTitle == null ? null : Text(bottomTitle!),
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (index, meta) => Text(
                bars.keys.elementAt(index.toInt()),
              ),
            ),
          ),
          topTitles: AxisTitles(
            axisNameWidget:
                interpretation == null ? null : Text(interpretation!),
          ),
          leftTitles: AxisTitles(
            axisNameWidget: leftTitle == null ? null : Text(leftTitle!),
            sideTitles: SideTitles(
              showTitles: false,
              interval: 1,
              getTitlesWidget: (index, meta) {
                return Text(index.toInt().toString());
              },
            ),
          ),
          rightTitles: const AxisTitles(axisNameWidget: Text('')),
        ),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        barGroups: [
          for (int i = 0; i < bars.length; i++)
            BarChartGroupData(
              x: i,
              barRods: [
                BarChartRodData(
                  fromY: 0.1,
                  toY: bars.values.toList()[i].toDouble(),
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(context.config.radius),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
