import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final Widget title;
  final Widget? subtitle, leading, trailing;
  final List<Widget> children;
  const CustomExpansionTile(
      {super.key,
      required this.title,
      this.subtitle,
      this.leading,
      this.trailing,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      backgroundColor: context.colorScheme.secondaryContainer.withOpacity(.20),
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: context.colorScheme.pr),
        borderRadius: BorderRadius.circular(edgeInsertValue),
      ),
      children: children,
    );
  }
}
