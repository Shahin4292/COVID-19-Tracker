import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../res/colors/app_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PieChart(
                legendOptions:
                    const LegendOptions(legendPosition: LegendPosition.left),
                dataMap: const {
                  "Total": 20,
                  "Recovered": 15,
                  "Deaths": 5,
                },
                chartRadius: MediaQuery.sizeOf(context).width / 3.2,
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              ReusableRow(
                title: 'Total',
                value: '200',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.055,
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(right: 8, left: 8),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
