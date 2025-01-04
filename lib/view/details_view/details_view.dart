import 'package:flutter/material.dart';

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

  DetailsView(
      {super.key,
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
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
    );
  }
}
