import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rincian/Detail_Pesanan/maps.dart';
import 'package:rincian/Detail_Pesanan/pembayaran.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../FadeAnimation/FadeAnimation.dart';

class DetailPesanan extends StatefulWidget {
  const DetailPesanan({Key? key}) : super(key: key);

  @override
  _DetailPesananState createState() => _DetailPesananState();
}

class _DetailPesananState extends State<DetailPesanan> {
  int _pilihHari = 2;
  int _pilihPerulangan = 0;
  String _pilihJam = '13:30';
  List<int> _pilihJasa = [];
  final LatLng _currentPosition = LatLng(-7.1754537, 112.6460244);

  ItemScrollController _scrollController = ItemScrollController();

  final List<dynamic> _hari = [
    [1, 'Fri'],
    [2, 'Sat'],
    [3, 'Sun'],
    [4, 'Mon'],
    [5, 'Tue'],
    [6, 'Wed'],
    [7, 'Thu'],
    [8, 'Fri'],
    [9, 'Sat'],
    [10, 'Sun'],
    [11, 'Mon'],
    [12, 'Tue'],
    [13, 'Wed'],
    [14, 'Thu'],
    [15, 'Fri'],
    [16, 'Sat'],
    [17, 'Sun'],
    [18, 'Mon'],
    [19, 'Tue'],
    [20, 'Wed'],
    [21, 'Thu'],
    [22, 'Fri'],
    [23, 'Sat'],
    [24, 'Sun'],
    [25, 'Mon'],
    [26, 'Tue'],
    [27, 'Wed'],
    [28, 'Thu'],
    [29, 'Fri'],
    [30, 'Sat'],
    [31, 'Sun']
  ];

  final List<String> _jam = <String>[
    '01:00',
    '01:30',
    '02:00',
    '02:30',
    '03:00',
    '03:30',
    '04:00',
    '04:30',
    '05:00',
    '05:30',
    '06:00',
    '06:30',
    '07:00',
    '07:30',
    '08:00',
    '08:30',
    '09:00',
    '09:30',
    '10:00',
    '10:30',
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '15:00',
    '15:30',
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
    '22:30',
    '23:00',
    '23:30',
  ];

  final List<String> _pengulangan = [
    'Tidak Berlangganan',
    'Setiap Hari',
    'Setiap Minggu',
    'Setiap Bulan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        //nanti diisi button untuk ke metode pembayaran
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: FadeAnimation(
                      1,
                      Padding(
                        padding: EdgeInsets.only(
                            top: 120.0, right: 20.0, left: 20.0),
                        child: Text(
                          'Pilih Tanggal Dan Waktu',
                          style: TextStyle(
                            fontSize: 35,
                            color: Colors.grey.shade900,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                )
              ];
            },
            body: ListView(padding: EdgeInsets.all(20.0), children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    FadeAnimation(
                        1,
                        Row(
                          children: [
                            Text("Tanggal"), // perlu nambah api tanggal
                            Spacer(),
                            IconButton(
                                padding: EdgeInsets.all(0),
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.grey.shade700,
                                ))
                          ],
                        )),
                    Container(
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1.5, color: Colors.grey.shade200)),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _hari.length,
                            itemBuilder: (BuildContext context, int index) {
                              return FadeAnimation(
                                (1 + index) / 6,
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _pilihHari = _hari[index][0];
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      width: 62,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: _pilihHari == _hari[index][0]
                                              ? Colors.blue.shade100
                                                  .withOpacity(0.5)
                                              : Colors.blue.withOpacity(0),
                                          border: Border.all(
                                            color: _pilihHari == _hari[index][0]
                                                ? Colors.blue
                                                : Colors.white.withOpacity(0),
                                            width: 1.5,
                                          )),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            _hari[index][0].toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            _hari[index][1],
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    )),
                              );
                            })),
                    SizedBox(
                      height: 10,
                    ),
                    FadeAnimation(
                        1.2,
                        Container(
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            border: Border.all(
                                width: 1.5, color: Colors.grey.shade200),
                          ),
                          child: ScrollablePositionedList.builder(
                              itemScrollController: _scrollController,
                              scrollDirection: Axis.horizontal,
                              itemCount: _jam.length,
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _pilihJam = _jam[index];
                                    });
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: _pilihJam == _jam[index]
                                          ? Colors.orange.shade100
                                              .withOpacity(0.5)
                                          : Colors.orange.withOpacity(0),
                                      border: Border.all(
                                        color: _pilihJam == _jam[index]
                                            ? Colors.orange
                                            : Colors.white.withOpacity(0),
                                        width: 1.5,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          _jam[index],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                        1.2,
                        Text(
                          "Pengulangan",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _pengulangan.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _pilihPerulangan = index;
                                });
                              },
                              child: FadeAnimation(
                                  (1.2 + index) / 4,
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _pilihPerulangan == index
                                          ? Colors.blue.shade400
                                          : Colors.grey.shade100,
                                    ),
                                    margin: EdgeInsets.only(right: 20),
                                    child: Center(
                                        child: Text(
                                      _pengulangan[index],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: _pilihPerulangan == index
                                              ? Colors.white
                                              : Colors.grey.shade800),
                                    )),
                                  )),
                            );
                          },
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    new TextField(
                      maxLines: 1,
                      decoration: new InputDecoration(
                          hintText: "Tulis disini!",
                          labelText: "Tambahkan Catatan",
                          border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0))),
                    ),
                    Container(
                      width: 400.0,
                      height: 400.0,
                      margin: EdgeInsets.all(20),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: CameraPosition(
                          target: _currentPosition,
                          zoom: 14,
                        ),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Maps()));
                            },
                            child: Text(
                              "Tambahkan Lokasi",
                              style: TextStyle(
                                  fontSize: 16.0, color: Colors.green),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Center(
                          child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Pembayaran()));
                        },
                        child: Text("Pesan Sekarang",
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white)),
                      )),
                    )
                  ],
                ),
              ),
            ])));
  }
}
