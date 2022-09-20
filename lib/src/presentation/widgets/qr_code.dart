import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class QrCode extends StatefulWidget {

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  late String _data;



  _scan() async{
return await FlutterBarcodeScanner.scanBarcode(
    '#000000',
    'cancel',
    true,
    ScanMode.BARCODE).then((value) =>setState(()=>_data=value));
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('lhdfjjhsjd'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          FlatButton(onPressed: ()=>_scan(),
              child:const Text('Scan Bar Code')),
        //  Text(_data)
        ],
      ),
    );
  }
}
