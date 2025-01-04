import 'package:flutter/material.dart';

import '../home/widget/reusable_row.dart';

class DetailsView extends StatefulWidget {
  String image;
  String name;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;

  DetailsView({super.key,
    required this.image,
    required this.active,
    required this.critical,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.todayRecovered,
    required this.totalRecovered,
    required this.test});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
        appBar: AppBar(
          title: Text(widget.name),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    color: Colors.grey.shade700,
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .06,),
                        ReusableRow(title: 'Cases', value: widget.totalCases.toString(),),
                        ReusableRow(title: 'Recovered', value:  widget.totalRecovered.toString(),),
                        ReusableRow(title: 'Death', value:  widget.totalDeaths.toString(),),
                        ReusableRow(title: 'Critical', value: widget.critical.toString(),),
                        ReusableRow(title: 'Today Recovered', value:widget.totalRecovered.toString(),),

                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(widget.image),
                  ),
                ),
              ],
          )
        ],
        ),
    );
  }
}
