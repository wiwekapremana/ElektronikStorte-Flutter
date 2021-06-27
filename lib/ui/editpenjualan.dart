import 'package:flutter/material.dart';
import 'package:google_signin_example/ui/home.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class EditPenjualan extends StatelessWidget {
  final Map input;
  EditPenjualan({@required this.input});
  final _formkey = GlobalKey<FormState>();
  TextEditingController kodeController = TextEditingController();
  TextEditingController barangController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController gambarController = TextEditingController();
  Future updateData() async {
    final response = await http.put(
        Uri.parse("http://192.168.1.8/api/produks/" + input['id'].toString()),
        body: {
          "kode": kodeController.text,
          "nama_barang": barangController.text,
          "deskripsi": deskripsiController.text,
          "harga": hargaController.text,
          "gambar_url": gambarController.text,
        });
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.keyboard_arrow_left),
      ),
      body: Container(
        color: Colors.blue[0xFF00E5FF],
        child: Form(
          key: _formkey,
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: kodeController..text = input['kode'],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Kode",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: barangController..text = input['nama_barang'],
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Nama Barang",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: deskripsiController
                      ..text = input['deskripsi'].toString(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "deskripsi",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: hargaController
                      ..text = input['harga'].toString(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Harga",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: gambarController
                      ..text = input['gambar_url'].toString(),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        labelText: "Gambar_url",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukin Data";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          color: Colors.green,
                          textColor: Theme.of(context).primaryColorLight,
                          child: Text(
                            "Simpan",
                            textScaleFactor: 1.5,
                          ),
                          onPressed: () {
                            if (_formkey.currentState.validate()) {
                              updateData().then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DataScreen()));
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        width: 5.0,
                      ),
                      Expanded(
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                        color: Colors.red,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "Batal",
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
