import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              clipBehavior: Clip.antiAlias,
              child: MobileScanner(
                onDetect: (Barcode barcode, MobileScannerArguments? args) {
                  if (barcode.rawValue == null) {
                    debugPrint('Failed to scan Barcode.');
                  } else {
                    final String code = barcode.rawValue!;
                    debugPrint('Barcode found! $code');
                  }
                },
                allowDuplicates: false,
              ),
            ),
          ),
          const SizedBox(height: 400)
        ],
      ),
    );
  }
}
