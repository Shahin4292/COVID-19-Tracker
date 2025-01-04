import 'package:covid_19/view/counties_list/countries_list_view.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            fixedSize: Size(size.width, size.height * 0.055)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const CountriesListView()));
        },
        child: const Text(
          textAlign: TextAlign.center,
          "Track Countries",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white),
        ));
  }
}
