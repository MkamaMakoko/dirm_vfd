import 'package:dirm_vfd/ui/widgets/space_between.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  ThemeData get themeData => Theme.of(this);
  ColorScheme get colorScheme => themeData.colorScheme;
  TextTheme get textTheme => themeData.textTheme;

  Size get screenSize => MediaQuery.of(this).size;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> Function(
          SnackBar snackbar)
      get showSnackBar => ScaffoldMessenger.of(this).showSnackBar;

  void snackBar(
      {required String message, required bool error, SnackBarAction? action}) {
    Widget content = Text(message);
    if (error) {
      content = Row(
        children: [
          Icon(Icons.error_rounded, color: colorScheme.onError),
          const SpaceBetween(),
          Expanded(child: content),
        ],
      );
    }
    showSnackBar(SnackBar(
        backgroundColor: error ? colorScheme.error : null,
        duration: Duration(seconds: error ? 8 : 4),
        showCloseIcon: error,
        action: action,
        content: content));
  }

  void waitDialog() {
    showAdaptiveDialog(
        barrierDismissible: false,
        context: this,
        builder: (context) => const AlertDialog.adaptive(
              title: Text('Please wait...'),
              content: LinearProgressIndicator(),
            ));
  }
}
