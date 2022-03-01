import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsb_medecin/view/departement_list.dart';
import 'package:gsb_medecin/view/medecin_details.dart';
import 'package:gsb_medecin/view/medecin_list.dart';
import 'package:gsb_medecin/view/nav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge).then(
    (_) => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GSB Médecins',
        routes: {
          MedecinDetails.routeName: (context) => const MedecinDetails(),
          DepartementList.routeName: (context) => const DepartementList(),
          MedecinList.routeName: (context) => const MedecinList(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan, brightness: Brightness.light),
          appBarTheme: AppBarTheme(
            backgroundColor: Theme.of(context).canvasColor,
            shadowColor: Colors.transparent,
            foregroundColor: Theme.of(context).textTheme.titleLarge?.color,
          ),
          inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
        ),
        darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.cyan, brightness: Brightness.dark, accentColor: Colors.cyanAccent),
            appBarTheme: AppBarTheme(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.grey[850],
            ),
            inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
        ),
        home: const Nav());
  }
}
