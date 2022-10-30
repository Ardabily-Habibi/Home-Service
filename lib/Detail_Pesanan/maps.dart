import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rincian/Detail_Pesanan/detail_pesanan.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  final Set<Marker> _marker = {};
  final LatLng _currentPosition = LatLng(-7.1754537, 112.6460244);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14,
            ),
            markers: _marker,
            onTap: (position) {
              setState(() {
                _marker.add(Marker(
                  markerId:
                      MarkerId("${position.latitude}, ${position.longitude}"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: position,
                ));
              });
            },
          ),
        ),
        Positioned(
          left: 60,
          right: 60,
          bottom: 0,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailPesanan()));
            },
            child: Text("Tetapkan Lokasi"),
          ),
        )
      ],
    ));
  }
}
