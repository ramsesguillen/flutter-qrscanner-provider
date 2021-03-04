


import 'package:flutter/cupertino.dart';
import 'package:qrscaner_sqlite/models/scan_model.dart';
import 'package:qrscaner_sqlite/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {


  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';


  nuevoScan( String valor ) async {
    final nuevoScan = new ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    /// Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if ( this.tipoSeleccionado == nuevoScan.tipo ) {
      this.scans.add( nuevoScan );
      notifyListeners();
    }
  }



  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...scans];
    notifyListeners();
  }



  cargarScansPotTipo( String tipo ) async {
    final scans = await DBProvider.db.getScansPorTipos(tipo);
    this.scans = [...scans];
    this.tipoSeleccionado = tipo;
    notifyListeners();
  }


  borrarTodos() async {
    await DBProvider.db.deleteAllScan();
    this.scans = [];
    notifyListeners();
  }


  borrarScanPorId( int id ) async {
    await DBProvider.db.deleteScan(id);
  }
}




