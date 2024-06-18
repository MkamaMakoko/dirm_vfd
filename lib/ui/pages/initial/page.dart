import 'package:auto_route/auto_route.dart';
import 'package:dirm_vfd/providers/_.dart';
import 'package:dirm_vfd/ui/routes/router.gr.dart';
import 'package:dirm_vfd/utils/_.dart';
import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class InitialPage extends ConsumerWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(userProvider, (preState, state) {
      final user = preState?.value ?? state.value;
      final router = context.router;
      switch (state) {
        case AsyncError(:final error, :final stackTrace):
          {
            print(stackTrace);
            context.snackBar(message: error.toString(), error: true);
          }
        case AsyncData(:final value):
          {
            if (value == null) {
              router.navigate(const InitialLoginRoute());
            } else if (user != null) {
              router.replace(const HomeRoute());
            }
          }
        case AsyncLoading():
          router.navigate(const InitialLoadingRoute());
      }
    });
    return Scaffold(
      // appBar: AppBar(title: const Text('Welcome back')),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // const Padding(
            //   padding: EdgeInsets.all(edgeInsertValue),
            //   child: Text(appTitle),
            // ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: edgeInsertValue * 2, horizontal: edgeInsertValue),
                child: AutoRouter(),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(edgeInsertValue),
              child: Column(
                children: [
                  Image.asset(
                      width: edgeInsertValue * 2,
                      height: edgeInsertValue * 2,
                      assetAddress.traLogo),
                  RichText(
                    text: TextSpan(
                        text: 'Approved by ',
                        children: const [
                          TextSpan(
                              text: 'TRA',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                        style: context.textTheme.bodyMedium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
