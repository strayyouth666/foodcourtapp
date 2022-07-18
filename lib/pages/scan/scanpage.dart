
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controller/homepageController.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';


class QRScanPage extends StatefulWidget{

  QRScanPage({Key? key,}) : super(key: key);

  @override
  QRScanPageState createState() => new QRScanPageState();

}

class QRScanPageState extends State<QRScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? barcode;

  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();

    if(Platform.isAndroid){
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) =>
      SafeArea(
        child: Scaffold(
            body: Stack(
              alignment: Alignment.topCenter, //inner widget alignment to center
                  children: <Widget>[
                    buildQrView(context),
                    Positioned(bottom: 10, child: buildResult()),
                    Positioned(top: 10, child: buildControlButtons(),)
                  //child: Text("Scan QRCode")
                ]
                ),
            ),
        );

  Widget buildControlButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      IconButton(
          icon: FutureBuilder<bool?>(
            future: controller?.getFlashStatus(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return Icon(
                  snapshot.data! ? Icons.flash_on : Icons.flash_off);
              } else {
                return Container();
              }
            },
          ),
              onPressed:  () async {
            await controller?.toggleFlash();
            setState(() {});
              },
          ),
      IconButton(
          onPressed: () async {
            await controller?.flipCamera();
            setState(() {});
          },
          icon: FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot){
                if(snapshot.data != null){
                  return   Icon(Icons.switch_camera);
                } else {
                  return Container();
                }
              },
          ),
      ),
    ]
  );

  Widget buildResult() => Container(
    padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white
      ),
      child: Text(
    barcode != null ? 'Result : ${barcode!.code}' : 'Scan a code!',
        maxLines: 3,
  )
  );

  Widget buildQrView(BuildContext context) => QRView(
    key: qrKey,
    onQRViewCreated: onQRViewCreated,
    overlay: QrScannerOverlayShape(
      borderWidth: 10,
      borderLength: 20,
      borderRadius: 10,
      borderColor: Theme.of(context).primaryColor,
      cutOutSize: MediaQuery.of(context).size.width*0.8,
    ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream
    .listen((barcode) => setState(() => this.barcode = barcode));
  }

}








class ScanPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
          () => HomePageController(),
    );
  }
}
