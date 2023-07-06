import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hansungunivdorm/providers/login/login_provider.dart';
import 'package:provider/provider.dart';

import '../login/login_view.dart';

Widget NotLogined(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        const Text('아직 로그인 하지 않았어요!'),
        CupertinoButton(
          child: Icon(
            Icons.login_rounded,
            color: Theme.of(context).hintColor.withOpacity(0.8),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const LoginView()),
          ),
        ),
      ],
    ),
  );
}

Widget Logined(BuildContext context, String name) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Text('$name 반갑습니다!'),
        CupertinoButton(
          child: Icon(
            Icons.power_settings_new_rounded,
            color: Theme.of(context).hintColor.withOpacity(0.8),
          ),
          onPressed: () {
            context.read<LoginProvider>().logout();
          },
        ),
      ],
    ),
  );
}
