import 'package:flutter/cupertino.dart';

import '../../home/widget/reusable_row.dart';
import '../details_view.dart';

class NameOfDetails extends StatelessWidget {
  const NameOfDetails({
    super.key,
    required this.widget,
  });

  final DetailsView widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .06,
        ),
        ReusableRow(
          title: 'Cases',
          value: widget.totalCases.toString(),
        ),
        ReusableRow(
          title: 'Recovered',
          value: widget.totalRecovered.toString(),
        ),
        ReusableRow(
          title: 'Death',
          value: widget.totalDeaths.toString(),
        ),
        ReusableRow(
          title: 'Critical',
          value: widget.critical.toString(),
        ),
        ReusableRow(
          title: 'Today Recovered',
          value: widget.totalRecovered.toString(),
        ),
      ],
    );
  }
}
