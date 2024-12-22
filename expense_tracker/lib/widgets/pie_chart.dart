import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatefulWidget {
  final Map<String, double> dataMap;

  const PieChartWidget({super.key, required this.dataMap});

  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: widget.dataMap.isNotEmpty ? widget.dataMap : {'No Data': 100},
      chartType: ChartType.disc,
      baseChartColor: Colors.grey[300]!,
      colorList: const [
        Colors.blue,
        Colors.green,
        Colors.orange,
        Colors.red,
      ],
      chartRadius: MediaQuery.of(context).size.width * 0.4,
      chartValuesOptions: const ChartValuesOptions(
        showChartValues: true,
        showChartValuesOutside: false,
      ),
    );
  }
}
