import 'package:flutter/material.dart';
import 'package:rincian/Detail_Pesanan/detail_pesanan.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Pembayaran extends StatefulWidget {
  const Pembayaran({Key? key}) : super(key: key);

  @override
  _PembayaranState createState() => _PembayaranState();
}

class _PembayaranState extends State<Pembayaran> {
  double _panelHeightOpen = 200.0;
  double _panelHeightClosed = 50.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: _panelHeightOpen,
        minHeight: _panelHeightClosed,
        body: Center(child: Text("body")),
        panel: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Detail Pembayaran",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Selengkapnya",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Harga (estimasi)",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "15.000",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Biaya Aplikasi",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "2.000",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      "Total Pembayaran",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "17.000",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    )
                  ],
                ),
              ),
              Container(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Bayar",
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
              ))
            ],
          ),
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
    );
  }
}
