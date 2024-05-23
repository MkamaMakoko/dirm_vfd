import 'package:dirm_vfd/utils/_.dart';
import 'package:flutter/material.dart';

class SpaceBetween extends StatelessWidget {
  final double size;
  const SpaceBetween({super.key, double times = 1})
      : size = edgeInsertValue * times;

  @override
  Widget build(BuildContext context) => SizedBox(width: size, height: size);
}
