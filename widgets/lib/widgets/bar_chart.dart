import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ChartWidgetAxis {
  final Widget? axisName;
  final double axisNameSpace;
  final List<String?>? axisTitles;

  const ChartWidgetAxis({
    this.axisName,
    this.axisNameSpace = 16,
    this.axisTitles,
  });

  AxisTitles genFL() => AxisTitles(
        axisNameWidget: axisName,
        axisNameSize: axisNameSpace,
        sideTitles: SideTitles(
          showTitles: axisTitles != null,
          getTitlesWidget: (i, m) =>
              Center(child: Text(axisTitles?[i.toInt()] ?? '')),
          reservedSize: 40,
          interval: null,
        ),
        drawBelowEverything: true,
      );
}

class ChartWidgetBarRod {
  final double value;
  final Color? color;

  const ChartWidgetBarRod(this.value, {this.color});

  BarChartRodData genFL(BuildContext context) => BarChartRodData(
        fromY: value + 0.05,
        toY: value + 0.95,
        color: color ?? context.config.neutralColor,
        borderRadius: BorderRadius.circular(context.config.radius),
      );
}

class ChartWidgetBarGroup {
  final int x;
  final String? title;
  final List<ChartWidgetBarRod>? rods;

  const ChartWidgetBarGroup({this.x = 0, this.title, this.rods});

  BarChartGroupData genFL(BuildContext context) => BarChartGroupData(
      x: x,
      groupVertically: true,
      barRods: rods?.map((e) => e.genFL(context)).toList());
}

class BarChartWidget extends StatelessWidget {
  final double maxY;

  final ChartWidgetAxis? leftAxis;
  final ChartWidgetAxis? topAxis;
  final ChartWidgetAxis? rightAxis;
  final ChartWidgetAxis? bottomAxis;

  final List<ChartWidgetBarGroup> barGroups;

  const BarChartWidget({
    this.maxY = 0,
    required this.barGroups,
    this.leftAxis,
    this.topAxis,
    this.rightAxis,
    this.bottomAxis,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY + 0.1,
          minY: 0.1,
          barTouchData: BarTouchData(enabled: false),
          titlesData: FlTitlesData(
            show: leftAxis != null ||
                topAxis != null ||
                rightAxis != null ||
                bottomAxis != null,
            bottomTitles: bottomAxis?.genFL() ?? const AxisTitles(),
            topTitles: topAxis?.genFL() ?? const AxisTitles(),
            leftTitles: leftAxis?.genFL() ?? const AxisTitles(),
            rightTitles: rightAxis?.genFL() ?? const AxisTitles(),
          ),
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          barGroups: barGroups.map((e) => e.genFL(context)).toList()),
    );
  }
}
