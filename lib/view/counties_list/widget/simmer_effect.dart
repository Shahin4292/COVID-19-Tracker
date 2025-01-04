import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimmerEffect extends StatelessWidget {
  const SimmerEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade700,
        highlightColor: Colors.grey.shade100,
        child: ListTile(
          subtitle: Container(
            height: 10,
            width: 80,
            color: Colors.white,
          ),
          leading: Container(
            height: 50,
            width: 50,
            color: Colors.white,
          ),
          title: Container(
            height: 10,
            width: 80,
            color: Colors.white,
          ),
        ));
  }
}
