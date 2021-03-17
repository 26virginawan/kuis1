import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:konversi_decimal/RiwayatKonversi.dart';

class ConverterLayout extends StatefulWidget {
  @override
  ConverterLayoutState createState() {
    return new ConverterLayoutState();
  }
}

class ConverterLayoutState extends State<ConverterLayout> {
  // membuat inset dengan ofset vertikal dan horizontal

  final TextEditingController bin = TextEditingController();
  final TextEditingController dec = TextEditingController();

  @override
  // metode dipanggil secara otomatis dari stateful jika tidak ditentukan.
  void dispose() {
    dec.dispose();
    bin.dispose();
    super.dispose();
  }

  List<String> listViewItem = List<String>();

  void convert(int lastChange, String val) {
    if (val == "") {
      dec.text = "";
      bin.text = "";
      return;
    }

    int convN;
    switch (lastChange) {
      case 0:
        convN = int.tryParse(val);
        //mengembalikan null ketika melebihi batas
        if (convN == null) {
          convN = 9223372036854775807;
          dec.text = convN.toString();
        }
        bin.text = convN.toRadixString(2);
        // menambahkan hasil kedalam riwayat Konversi
        listViewItem.add("decimal : " + val + " => " + "Binner : " + bin.text);

        break;
      default:
        debugPrint("maaf !, terjadi eror");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _lvList = <Widget>[
      SizedBox(height: 25.0),

      // mengisi angka decimal
      TextField(
        keyboardType: TextInputType.number,
        onChanged: (s) => convert(0, s),
        decoration: InputDecoration(
          labelText: "Masukkan Angka Decimal",
          labelStyle: TextStyle(fontSize: 20, color: Colors.black54),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
        inputFormatters: [
          // membatasi jumlah maksimal panjang angka
          LengthLimitingTextInputFormatter(19),
          // untuk membatasi hanya menampilkan angka 0-9
          WhitelistingTextInputFormatter(RegExp("[0-9]"))
        ],
      ),

      // padding kedua
      SizedBox(height: 24.0),

      Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                bin.text,
                style: TextStyle(fontSize: 30),
              ),
            ],
          )),

      RaisedButton(
        onPressed: () {
          setState(() {
            bin.text;
          });
        },
        textColor: Colors.black54,
        color: Colors.greenAccent,
        child: Container(
          height: 50,
          width: 510,
          alignment: Alignment.center,
          child: Text(
            "Konversi ke binner",
            style: TextStyle(fontSize: 17),
          ),
        ),
      ),
      // Container(
      //   // Untuk memberikan tulisan Riwayat Konversi
      //   alignment: Alignment.center,
      //   margin: EdgeInsets.only(top: 20, bottom: 20),
      //   child: Text(
      //     "Riwayat Konversi",
      //     style: TextStyle(fontSize: 20),
      //   ),
      // ),
      // Container(
      //   // menampilkan hasil Riwayat Konersi
      //   child: (Column(
      //     children: listViewItem.map((String val) {
      //       return Container(
      //           margin: EdgeInsets.all(10),
      //           child: Text(
      //             val,
      //             style: TextStyle(fontSize: 15),
      //           ));
      //     }).toList(),
      //   )),
      // ),
    ];

    return Theme(
      data: Theme.of(context),
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: _lvList,
      ),
    );
  }
}
