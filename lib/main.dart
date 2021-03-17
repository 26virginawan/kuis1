import 'package:flutter/material.dart';
import 'package:konversi_decimal/converter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // untuk menghilangkan logo debug
      title: 'App', // digunakan untuk judul recent app
      home: Home(title: 'App'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key k, this.title}) : super(key: k);

  final String title;

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: MainLayout(),
    );
  }
}

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // widget untuk membuat appbar
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        // judul yang ditampilkan di appBar
        title: Text(
          "Decimal ke Binner",
          style: TextStyle(color: Colors.black54, fontFamily: "Raleway"),
        ),
      ),
      // isi dari tampilan
      body: Container(
        // agar tulisan menjadi rata atas kiri
        alignment: Alignment.topLeft,
        // memanggil class converterLayout
        child: ConverterLayout(),
      ),
    );
  }
}
