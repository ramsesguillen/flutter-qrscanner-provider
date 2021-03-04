///[]
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscaner_sqlite/providers/ui_provider.dart';


///[]


///[]
class CustomNavigationBar extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: ( int i ) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('mapa')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin_circle),
          title: Text('Direcciónes')
        ),
      ]
    );
  }
}
