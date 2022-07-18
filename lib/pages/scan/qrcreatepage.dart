import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCreatePage extends StatefulWidget {
  const QRCreatePage({Key? key}) : super(key: key);

  @override
  _QRCreatePageState createState() => _QRCreatePageState();
}

class _QRCreatePageState extends State<QRCreatePage> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: 200,
                backgroundColor: Colors.white,

              ),
              SizedBox(height: 30,),
              buildTextField(context),
            ],
          ),
        ),
      ),
    );


    Widget buildTextField(BuildContext context) => TextField(
      controller: controller,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      decoration: InputDecoration(
        hintText: 'Enter the data',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          )
        ),
        suffixIcon: IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(Icons.done, size: 30,),
          onPressed: () => setState(() {}),
        )
      ),
    );
  }

