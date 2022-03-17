import 'package:flutter/material.dart';

class LoadingDialog {
  static bool _isLoadingDialogShowing = false;

  static showLoadingDialog(BuildContext context, {required String text}) async {
    _isLoadingDialogShowing = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Text(text),
          );
        });
  }

  static hideLoadingDialog(BuildContext context, {String? text}) async {
    if (_isLoadingDialogShowing) {
      Navigator.pop(context);
      _isLoadingDialogShowing = false;
    }
  }

  static showNotifyDialog(BuildContext context, {String? text}) async {
    return showDialog<void>(
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dialog'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text ?? "Not Listed"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Okay'),
              onPressed: () {
                // LoadingDialog.hideLoadingDialog(context);
                Navigator.of(context)
                  ..pop()
                  ..pop();
              },
            ),
          ],
        );
      },
      context: context,
    );
  }
}
