import 'package:flutter/material.dart';
import 'package:google_signin_example/ui/inputpenjualan.dart';

class DetailProduk extends StatefulWidget {
  DetailProduk(
      {Key key, this.nama, this.deskripsi, this.harga, this.gambar, this.star})
      : super(key: key);
  final String nama;
  final String deskripsi;
  final int harga;
  final String gambar;
  final int star;
  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  final childrenstar = <Widget>[];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < widget.star; i++) {
      childrenstar.add(new Icon(
        Icons.star,
        size: 20,
        color: Colors.yellow[700],
      ));
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.nama}"),
        backgroundColor: Colors.blue[600],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InputPenjualan()));
        },
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.blue[300],
      body: new Container(
        width: double.infinity,
        child: new ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                new Image.asset("assets/appimage/" + widget.gambar)
              ],
            ),
            Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xFF00E5FF), const Color(0xFF29B6F6)],
                ),
              ),
              padding: EdgeInsets.all(10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: childrenstar,
                  ),
                  new Container(
                    child: new Text(
                      "Rp. " + this.widget.harga.toString(),
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "NeoSansBold"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.blue[100],
              width: double.infinity,
              height: double.maxFinite,
              child: new Text(
                widget.deskripsi,
                style: new TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
