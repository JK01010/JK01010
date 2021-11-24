import 'package:flutter/material.dart';
import 'package:barcode_scan_fix/barcode_scan.dart';
import 'dart:async';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:(context)=>Scan())
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      color: Colors.grey[900],
      child: FlutterLogo(size:MediaQuery.of(context).size.height),
    );
  }
}


class Scan extends StatefulWidget {
  const Scan({ Key? key }) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String Qr="Not Yet Scanned !";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title:Text('QR Scanner',
            style: TextStyle(
              fontSize: 25,
              letterSpacing:2.0,
              fontWeight: FontWeight.bold,
            )
        ),
        centerTitle: true,
      ),
      body:Container(
        padding:EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Result:",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.0,
            ),
            SelectableText(
              Qr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign:TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15),
              onPressed:() async {
                String cds = await BarcodeScanner.scan();
                setState(() {
                  Qr = cds;
                });
              },
              child:Text(
                'Scan Now',
                style: TextStyle(

                  fontSize: 22.0,
                  letterSpacing: 2.0,
                  color: Colors.white
                ),
              ) ,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey[600]!,width: 4.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
          ],
        ),

      ),
    );
  }
}