import 'package:flutter/material.dart';

import '../screens/loginscreen.dart';

class Logout extends StatelessWidget {
  const Logout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const LoginScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.logout,
          size: 24.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
