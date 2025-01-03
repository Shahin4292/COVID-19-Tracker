import 'package:covid_19/view/home/widget/reusable_row.dart';
import 'package:covid_19/view/home/widget/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../model/covid_model.dart';
import '../../res/colors/app_color.dart';
import '../../service/covid_19_service.dart';

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

  Covid19Service covid19service = Covid19Service();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FutureBuilder(
                future: covid19service.getCovidApi(),
                builder: (BuildContext context,
                    AsyncSnapshot<CovidModel?> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        controller: _controller,
                        size: 60,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true),
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString()),
                          },
                          chartRadius: MediaQuery.sizeOf(context).width / 3.2,
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        Card(
                          color: Colors.grey.shade700,
                          child: Column(
                            children: [
                              ReusableRow(
                                title: 'Total',
                                value: snapshot.data!.cases.toString(),
                              ),
                              ReusableRow(
                                title: 'Deaths',
                                value: snapshot.data!.deaths.toString(),
                              ),
                              ReusableRow(
                                title: 'Recovered',
                                value: snapshot.data!.recovered.toString(),
                              ),
                              ReusableRow(
                                title: 'Active',
                                value: snapshot.data!.active.toString(),
                              ),
                              ReusableRow(
                                title: 'Critical',
                                value: snapshot.data!.critical.toString(),
                              ),
                              ReusableRow(
                                title: 'Affected Countries',
                                value:
                                    snapshot.data!.affectedCountries.toString(),
                              ),
                              ReusableRow(
                                title: 'Critical Per One Million',
                                value: snapshot.data!.criticalPerOneMillion
                                    .toString(),
                              ),
                              ReusableRow(
                                title: 'Deaths Per One Million',
                                value: snapshot.data!.deathsPerOneMillion
                                    .toString(),
                              ),
                              ReusableRow(
                                title: 'Today Deaths',
                                value: snapshot.data!.todayDeaths.toString(),
                              ),
                              ReusableRow(
                                title: 'Today Recovered',
                                value: snapshot.data!.todayRecovered.toString(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        RoundedButton(size: size)
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
