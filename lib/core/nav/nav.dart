import 'package:flutter/material.dart';

class Nav {
  static Future<T?> to<T>(BuildContext context, Widget page) {
    if (!context.mounted) return Future.value(null); // Cegah push jika context tidak valid
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  static void back(BuildContext context, [dynamic result]) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context, result);
    }
  }
}
