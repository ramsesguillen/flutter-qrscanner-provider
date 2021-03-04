import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:qrscaner_sqlite/pages/home_page.dart';
import 'package:qrscaner_sqlite/pages/mapa_page.dart';

import 'package:qrscaner_sqlite/providers/scan_list_provider.dart';
import 'package:qrscaner_sqlite/providers/ui_provider.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home' : ( _ ) => HomePage(),
          'mapa' : ( _ ) => MapaPage()
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
          )
        )
      ),
    );
  }
}