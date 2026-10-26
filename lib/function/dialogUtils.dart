import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DialogUtils {
  static Future<void> showLoadingDialog({
    required BuildContext context,
    Color backgroundColor = Colors.white,
    Color  circularBackground=Colors.white,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor:backgroundColor,
        content: Row(
          children: [
            CircularProgressIndicator(backgroundColor: circularBackground ),
            SizedBox(width: 20),
            Text("Loading...."),
          ],
        ),
      ),
    );
  }

  static Future<void> showMessageDialog({
    required BuildContext context,
    required String text,

    //todo Title
    String? title,
    Alignment? titleAlignment,
    //todo Callbacks
    VoidCallback? onPressedOk,
    VoidCallback? onPressedYes,
    VoidCallback? onPressedNo,
    VoidCallback? onPressedCancel,
    //todo Buttons
    bool showOkButton = false,
    bool showYesButton = false,
    bool showNoButton = false,
    bool showCancelButton = false,
    //todo Button Text
    String okText = "OK",
    String yesText = "Yes",
    String noText = "No",
    String cancelText = "Cancel",
    //todo Icon
    IconData? icon,
    Color? iconColor,
    double iconSize = 50,
    //todo Colors
    Color backgroundColor = Colors.white,
    Color? titleColor,
    Color? textColor,
    //todo Dialog
    bool barrierDismissible = false,
    double? width,
    EdgeInsetsGeometry? contentPadding,
    BorderRadius? borderRadius,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (dialogContext) => Dialog(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width ?? 400),
          child: Padding(
            padding: contentPadding ?? const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Icon(icon, size: iconSize, color: iconColor),
                  ),

                if (title != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Align(
                      alignment: titleAlignment ?? Alignment.center,
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                    ),
                  ),

                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor),
                ),

                if (showYesButton ||
                    showOkButton ||
                    showNoButton ||
                    showCancelButton)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (showCancelButton)
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              onPressedCancel?.call();
                            },
                            child: Text(cancelText),
                          ),

                        if (showNoButton)
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              onPressedNo?.call();
                            },
                            child: Text(noText),
                          ),

                        if (showYesButton)
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              onPressedYes?.call();
                            },
                            child: Text(yesText),
                          ),

                        if (showOkButton)
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                              onPressedOk?.call();
                            },
                            child: Text(okText),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<bool?> toastMsg({
    required String msg,
    required Color backgroundColor,
    required Color textColor,
    ToastGravity gravity = ToastGravity.CENTER,
  }) {
    return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor,
      textColor: textColor,
      fontSize: 16.0,
    );
  }
}
