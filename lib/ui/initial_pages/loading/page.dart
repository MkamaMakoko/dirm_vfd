import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InitialLoadingPage extends StatelessWidget {
  const InitialLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator.adaptive(),
        SpaceBetween(),
        Text('Please wait...')
      ],
    );
  }
}
