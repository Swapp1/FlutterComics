import 'package:comics_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('fr_FR', null);
    runApp(const MyApp());
}

/// Main de l'application 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Comics app',
      theme: ThemeData(
        fontFamily: "nunito",
        scaffoldBackgroundColor: const Color(0xFF15232E),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => const HomePage(),
      ),
    );
  }
}
