import 'package:flutter/material.dart';

class Coba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            margin: EdgeInsets.fromLTRB(30, 100, 30, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-cleaning-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png',
                                scale: 1.5,
                              ),
                              Text(
                                "Cleaning",
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                  'https://img.icons8.com/external-vitaliy-gorbachev-flat-vitaly-gorbachev/2x/external-plumber-labour-day-vitaliy-gorbachev-flat-vitaly-gorbachev.png',
                                  scale: 1.5),
                              Text(
                                "Ledeng",
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(60, 30, 60, 30),
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                  'https://img.icons8.com/external-wanicon-flat-wanicon/2x/external-multimeter-car-service-wanicon-flat-wanicon.png',
                                  scale: 1.5),
                              Text(
                                "Elektronik",
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Image.network(
                                  'https://img.icons8.com/external-itim2101-flat-itim2101/2x/external-gardener-male-occupation-avatar-itim2101-flat-itim2101.png',
                                  scale: 1.5),
                              Text(
                                "Taman",
                                style: TextStyle(fontSize: 20.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
