///[]
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscaner_sqlite/providers/scan_list_provider.dart';
import 'package:qrscaner_sqlite/widgets/scans_tiles.dart';


///[]


///[]
class MapasPage extends StatelessWidget {

///[]
  @override
  Widget build(BuildContext context) {
    return ScanTile(tipo: 'geo');
  }
}
