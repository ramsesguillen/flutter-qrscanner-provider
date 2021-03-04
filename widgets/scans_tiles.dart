

///[]
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrscaner_sqlite/providers/scan_list_provider.dart';


///[]


///[]
class ScanTile extends StatelessWidget {

  final String tipo;

  const ScanTile({@required this.tipo});

///[]
  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _, i) => Dismissible(
        background: Container(
          color: Colors.red,
        ),
        onDismissed: ( DismissDirection direction ){
          Provider.of<ScanListProvider>(context, listen: false).borrarScanPorId(scans[i].id);
        },
        key: UniqueKey(),
        child: ListTile(
          leading: Icon(
                  (this.tipo == 'http')
                    ? Icons.home
                    : Icons.map,
                    color: Theme.of(context).primaryColor,),
          title: Text(scans[i].valor),
          subtitle: Text(scans[i].id.toString() ),
          trailing: Icon( Icons.keyboard_arrow_right, color: Colors.grey,),
          onTap: () {},
        ),
      ),
    );
  }
}
