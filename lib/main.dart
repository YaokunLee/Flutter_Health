import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/route_manager.dart';
import 'package:jizhang/login.dart';

void main() {
  runApp(const MyApp());
  // registerWxApi(
  //     appId: AppConfig.WXAppId, universalLink: AppConfig.UniversalLink);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, //这里替换你选择的颜色
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color primaryColor = Colors.tealAccent;

  @override
  void initState() {
    super.initState();
    // WindowManager windowManager = (WindowManager) applicationContext.getSystemService(Context.WINDOW_SERVICE))
    // float fps = windowManager.getDefaultDisplay().getRefreshRate();
    // setMode();
  }

  @override
  Widget build(BuildContext context) {
    final easyload = EasyLoading.init();

    return GetMaterialApp(
        title: 'Health',
        builder: (BuildContext context, Widget? child) {
          return easyload(context, child);
        },
        theme: ThemeData(
            brightness: Brightness.light,
            textTheme:
                const TextTheme(button: TextStyle(color: Colors.black12)),
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black),
                titleTextStyle: TextStyle(
                    color: Color.fromARGB(255, 65, 57, 57), fontSize: 20.0),
                color: Colors.white)),
        debugShowCheckedModeBanner: false,
        home: Login(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('zh'));
  }
}
