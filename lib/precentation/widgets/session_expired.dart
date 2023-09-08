import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hakaton_uic/precentation/widgets/w_elevated_button.dart';
import 'package:hakaton_uic/utils/colors.dart';

class SessionExpired extends StatelessWidget {
  const SessionExpired({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
        child: AlertDialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          contentPadding: const EdgeInsets.all(2),
          title: const Text(
            "Your session has expired",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            WElevatedButton(
              color: kDisactive,
              onPressed: () {},
              child: const Text("Log Out"),
            ),
          ],
        ));
  }
}
