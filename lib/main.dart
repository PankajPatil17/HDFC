// ignore_for_file: unnecessary_null_comparison
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hdfc_bank/Screens/OnBoarding/SplashScreen.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:upgrader/upgrader.dart';

GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Upgrader.clearSavedSettings();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      child: Sizer(builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          theme: ThemeData.fallback(),
          home: SplashScreen(),
          navigatorKey: navKey,
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
