import 'package:dirm_vfd/utils/_.dart';
import 'package:flutter/material.dart';

class InButtonProgressIndicator extends StatelessWidget {
  const InButtonProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) => const SizedBox.square(
      dimension: edgeInsertValue, child: CircularProgressIndicator.adaptive());
}
