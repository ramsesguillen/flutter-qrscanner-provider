///[]
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


///[]
import 'package:qrscaner_sqlite/pages/direcciones_page.dart';
import 'package:qrscaner_sqlite/pages/mapas_page.dart';
import 'package:qrscaner_sqlite/providers/scan_list_provider.dart';
import 'package:qrscaner_sqlite/widgets/custon_navigatorbar.dart';
import 'package:qrscaner_sqlite/widgets/scan_button.dart';

import 'package:qrscaner_sqlite/providers/db_provider.dart';
import 'package:qrscaner_sqlite/providers/ui_provider.dart';


///[]
class HomePage extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              Provider.of<ScanListProvider>(context, listen: false ).borrarTodos();
            }
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}



///[]
class _HomePageBody extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {

    ///  Obtener el selecte munu opt
    final uiProvider = Provider.of<UiProvider>(context);


    /// Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

  ///
    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false );


    switch ( currentIndex ) {
      case 0:
          scanListProvider.cargarScansPotTipo('geo');
          return MapasPage();
      case 1:
          scanListProvider.cargarScansPotTipo('http');
          return DireccionesPage();
      default:
          return MapasPage();
    }
  }
}
