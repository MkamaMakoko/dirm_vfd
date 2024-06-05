import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';

class SecondaryContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding, margin;
  const SecondaryContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(edgeInsertValue),
    this.margin,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer.withOpacity(.5),
            borderRadius: BorderRadius.circular(edgeInsertValue)),
        child: child,
      );
}
