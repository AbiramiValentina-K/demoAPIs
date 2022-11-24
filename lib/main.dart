import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'app/core/app_colors.dart';
import 'app/view/screens/loginscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
    );

    return MaterialApp(
      title: "Blast Tracker App",
      color: AppColor.themeColor,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
    visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
