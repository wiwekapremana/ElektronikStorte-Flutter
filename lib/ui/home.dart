import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_signin_example/ui/editpenjualan.dart';
import 'package:google_signin_example/ui/inputpenjualan.dart';
import 'package:http/http.dart' as http;

class DataScreen extends StatefulWidget {
  const DataScreen({
    Key key,
  }) : super(key: key);
  @override
  _DataScreenState createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final String url = "http://192.168.1.8/api/produks";

  Future getData() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  Future deleteData(String dataId) async {
    final String url = "http://192.168.1.8/api/produks/" + dataId;
    var response = await http.delete(Uri.parse(url));

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penjualan Produk'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.lightBlue, Colors.blue])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InputPenjualan()));
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data['data'].length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 180,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            height: 190,
                            width: 160,
                            child: Image.network(
                                snapshot.data['data'][index]['gambar_url']),
                          ),
                          Expanded(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        snapshot.data['data'][index]
                                            ['nama_barang'],
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold),
                                      )),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                        snapshot.data['data'][index]
                                            ['deskripsi'],
                                        style: TextStyle(
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      snapshot.data['data'][index]['kode']
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('-'),
                                      Text(
                                          'Rp.' +
                                              snapshot.data['data'][index]
                                                      ['harga']
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.edit),
                                          color: Colors.red,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        EditPenjualan(
                                                            input:
                                                                snapshot.data[
                                                                        'data']
                                                                    [index])));
                                          }),
                                      Text(snapshot.data['data'][index]['harga']
                                          .toString()),
                                      IconButton(
                                        icon: Icon(Icons.delete),
                                        color: Colors.red,
                                        onPressed: () {
                                          deleteData(snapshot.data['data']
                                                      [index]['id']
                                                  .toString())
                                              .then((value) {
                                            setState(() {});
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(
                                                        "Data berhasil didelete")));
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text("GAGAL");
            }
          }),
    );
  }
}
