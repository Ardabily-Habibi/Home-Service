import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rincian/Detail_Pesanan/detail_pesanan.dart';
import 'package:rincian/FadeAnimation/FadeAnimation.dart';

class elektronik extends StatefulWidget {
  const elektronik({Key? key}) : super(key: key);

  @override
  _elektronikState createState() => _elektronikState();
}

class _elektronikState extends State<elektronik> {
  List<dynamic> _barang = [
    [
      'Mesin Cuci',
      'https://w7.pngwing.com/pngs/857/543/png-transparent-washing-machines-electrolux-home-appliance-laundry-clothes-dryer-mesin-cuci-clothes-dryer-home-appliance-oven.png',
      Colors.red,
      0
    ],
    [
      'AC',
      'https://w7.pngwing.com/pngs/637/818/png-transparent-air-conditioning-samsung-ac-home-appliance-air-conditioning.png',
      Colors.orange,
      1
    ],
    [
      'Kulkas',
      'https://w7.pngwing.com/pngs/119/814/png-transparent-refrigerator-door-home-appliance-kitchen-major-appliance-refrigerator-kitchen-angle-electronics.png',
      Colors.purple,
      1
    ],
    [
      'TV',
      'https://w7.pngwing.com/pngs/847/247/png-transparent-vintage-brown-tv-illustration-television-set-television-channel-tv-yellow-television-retro-rectangle.png',
      Colors.orange,
      0
    ],
    [
      'Microwave',
      'https://w7.pngwing.com/pngs/301/438/png-transparent-cartoon-microwave-oven-cartoon-microwave-oven-cartoon-character-electronics-rectangle.png',
      Colors.green,
      0
    ],
    [
      'Vacuum Cleaner',
      'https://w7.pngwing.com/pngs/867/437/png-transparent-vacuum-cleaner-appliances-s-cleaning-cartoon-vacuum.png',
      Colors.yellow,
      0
    ],
    [
      'Kipas Angin',
      'https://w7.pngwing.com/pngs/858/476/png-transparent-table-window-fan-desk-home-appliance-table-furniture-office-window.png',
      Colors.brown,
      0
    ],
    [
      'Laptop Atau Komputer',
      'https://w7.pngwing.com/pngs/662/277/png-transparent-computer-architecture-desktop-computers-computer-monitors-computer-computer-computer-monitor-accessory-computer-program.png',
      Colors.orange,
      0
    ],
  ];

  List<int> _pilihBarang = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: _pilihBarang.length > 0
            ? FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailPesanan()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_pilihBarang.length}',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 2),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                    ),
                  ],
                ),
                backgroundColor: Colors.blue,
              )
            : null,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 120.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Mana Yang Ingin \nDiperbaiki?',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: _barang.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeAnimation(
                      (1.2 + index) / 4, room(_barang[index], index));
                }),
          ),
        ));
  }

  room(List room, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_pilihBarang.contains(index))
            _pilihBarang.remove(index);
          else
            _pilihBarang.add(index);
        });
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          margin: EdgeInsets.only(bottom: 20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: _pilihBarang.contains(index)
                ? room[2].shade50.withOpacity(0.5)
                : Colors.grey.shade100,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Image.network(
                        room[1],
                        width: 35,
                        height: 35,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        room[0],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Spacer(),
                  _pilihBarang.contains(index)
                      ? Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent.shade100.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                            size: 20,
                          ))
                      : SizedBox()
                ],
              ),
              // (_pilihRuangan.contains(index) && room[3] >= 1)
              //     ? Container(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             SizedBox(
              //               height: 20.0,
              //             ),
              //             Text(
              //               "Berapa Banyak ${room[0]}?",
              //               style: TextStyle(fontSize: 15),
              //             ),
              //             SizedBox(
              //               height: 10.0,
              //             ),
              //             Container(
              //               height: 45,
              //               child: ListView.builder(
              //                   scrollDirection: Axis.horizontal,
              //                   itemCount: 4,
              //                   itemBuilder: (BuildContext context, int index) {
              //                     return GestureDetector(
              //                       onTap: () {
              //                         setState(() {
              //                           room[3] = index + 1;
              //                         });
              //                       },
              //                       child: Container(
              //                         margin: EdgeInsets.only(right: 10.0),
              //                         padding: EdgeInsets.all(10.0),
              //                         width: 50,
              //                         decoration: BoxDecoration(
              //                           borderRadius:
              //                               BorderRadius.circular(10.0),
              //                           color: room[3] == index + 1
              //                               ? room[2].withOpacity(0.5)
              //                               : room[2].shade200.withOpacity(0.5),
              //                         ),
              //                         child: Center(
              //                             child: Text(
              //                           (index + 1).toString(),
              //                           style: TextStyle(
              //                               fontSize: 22, color: Colors.white),
              //                         )),
              //                       ),
              //                     );
              //                   }),
              //             )
              //           ],
              //         ),
              //       )
              //     : SizedBox()
            ],
          )),
    );
  }
}
