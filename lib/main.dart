import 'package:animation/models/Data.dart';
import 'package:animation/screens/login/login_screen.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'models/citations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Citations()),
          ChangeNotifierProvider(create: (_) => ListOfCitations()),
        ],
        child: MyApp(),
      ),
      // DevicePreview(
      //   enabled: true,
      //   tools: [
      //     ...DevicePreview.defaultTools,
      //     // const CustomPlugin(),
      //   ],
      //   builder: (context) => MyApp(),
      // ),
    );
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final dataListOfCitations = Provider.of<ListOfCitations>(context);
    // context.read<Citations>().readJson();
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: <Locale>[
        // Locale('en'),
        Locale('ar', "AR"),
        // ... other locales the app supports
      ],
      locale: Locale('ar'),
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}
