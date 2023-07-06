import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:hansungunivdorm/pages/menu_view.dart';
import 'package:hansungunivdorm/providers/providers.dart';
import 'package:hansungunivdorm/services/dio_method.dart';
import 'package:provider/provider.dart';

import 'models/shared_pref_model.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SharedPrefModel.initialize();

  // SharedPrefModel.isLogin = false;

  // await logoutDorm();
  // await getScore();
  // await getNotice(pageIndex: 1);
  // await getFaqList();
  // await getSleepOutsList('JSESSIONID=2CAA57581E1273BE94CAAABE0DA3F74D;', 1);
  // await getSpecificNotice('3018');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StateNotifierProvider<ThemeProvider, ThemeState>(
          create: (_) => ThemeProvider(),
        ),
        StateNotifierProvider<LoginProvider, LoginState>(
          create: (_) => LoginProvider(),
        ),
        StateNotifierProvider<NoticeProvider, NoticeState>(
          create: (_) => NoticeProvider(),
        ),
        StateNotifierProvider<FaqProvider, FaqState>(
          create: (_) => FaqProvider(),
        ),
        StateNotifierProvider<ScoreProvider, ScoreState>(
          create: (_) => ScoreProvider(),
        ),
        StateNotifierProvider<SleepOutProvider, SleepOutState>(
          create: (_) => SleepOutProvider(),
        ),
      ],
      child: Builder(builder: (context) {
        context.read<LoginProvider>().initLogin();
        FlutterNativeSplash.remove();
        return MaterialApp(
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          ),
          debugShowCheckedModeBanner: false,
          theme: context.watch<ThemeState>().currentTheme,
          home: const MenuView(),
        );
      }),
    );
  }
}
