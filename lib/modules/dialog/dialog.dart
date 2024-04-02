import 'package:flutter/material.dart';

class BFDialog {
  static Future loading({
    required BuildContext context,
    String message = "Loading",
    TextStyle? style,
    bool barrierDismissible = true,
    Widget? child,
    Widget? loadingWidget,
  }) async {
    await showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.transparent,
          child: Center(
            child: child ??
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: loadingWidget ?? const CircularProgressIndicator(),
                      ),
                      Text(
                        message,
                        style: style ?? const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }

  static Future success({
    required BuildContext context,
    Widget? child,
    required String title,
    required String message,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return Dialog.fullscreen(
          backgroundColor: Colors.transparent,
          child: Center(
            child: child ??
                Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                  ),
                ),
          ),
        );
      },
    );
  }
}
