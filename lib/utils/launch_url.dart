import 'package:dirm_vfd/utils/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(
    {required String url, required BuildContext context}) async {
  void showSnackbar() =>
      context.snackBar(message: 'Failed to launch $url', error: true);
  if (!await launchUrl(Uri.parse(url))) showSnackbar();
}
