import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import 'package:yagamy/ui/widget/decoration_widgets.dart';
import 'package:yagamy/ui/widget/execute_button.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 100),
            SizedBox(
              width: 350,
              height: 350,
              child: BorderAroundVertex(
                length: 35,
                color: Colors.white,
                width: 2,
                child: MobileScanner(
                  onDetect: (Barcode barcode, MobileScannerArguments? args) {
                    if (barcode.rawValue == null) {
                      debugPrint('Failed to scan Barcode.');
                    } else {
                      final String code = barcode.rawValue!;
                      debugPrint('Barcode found! $code');
                      isRead = true;
                    }
                  },
                  allowDuplicates: false,
                ),
              ),
            ),
            const SizedBox(height: 50),
            ExecuteButton(title: 'Ready!', isActivated: isRead, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
