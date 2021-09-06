import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subnet_webapp/assets/styles.dart';
import 'package:subnet_webapp/widgets/hover_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.black,
          textSelectionTheme: TextSelectionThemeData(cursorColor: gold)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            toolbarHeight: 70.0,
            elevation: 1.0,
            backgroundColor: ligthGold,
            title: TopAppBar()),
        body: Container(
          color: Color(0xffF3F3F3),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 50.0, right: 50.0, top: 30.0, bottom: 30.0),
            child: Container(
              child: Row(
                children: [
                  LeftPanel(),
                  SizedBox(
                    width: 25.0,
                  ),
                  RightPanel()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LeftPanel extends StatefulWidget {
  const LeftPanel({
    Key? key,
  }) : super(key: key);

  @override
  _LeftPanelState createState() => _LeftPanelState();
}

class _LeftPanelState extends State<LeftPanel> {
  static final List<String> departments = <String>[
    'ITI-C',
    'ITI-A',
    'ITB',
    'ITS',
    'OTI',
    'OTE',
  ];

  var value = departments.first;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Form(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Projekt Name:'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffF3F3F3),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        hintText: 'tch-iti-dev',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('PO User:'),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xffF3F3F3),
                    ),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14.0),
                      decoration: InputDecoration(
                        hintText: 'Vor- und Nachname',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text('Department:'),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(8.0)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                value: value,
                                items: departments
                                    .map(
                                      (value) => DropdownMenuItem<String>(
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                          value: value),
                                    ) //can be styled
                                    .toList(),
                                onTap: () {
                                  print(value.toString());
                                },
                                onChanged: (value) => setState(() {
                                      this.value = value.toString();
                                      print(value);
                                    })),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Column(
                      children: [
                        Text("Anzahl der benötigten IP Adressen:"),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Color(0xffF3F3F3),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 14.0),
                              decoration: InputDecoration(
                                hintText: '250',
                                border: InputBorder.none,
                                suffix: Text("IP Adressen"),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Expanded(
                        child: Visibility(
                          visible: true,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                print('Reserviert!');
                              },
                              child: GestureDetector(
                                onTap: () => print("Reserviert"),
                                child: OnHoverWidget(
                                  child: Container(
                                    width: 150,
                                    height: 45.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10.0),
                                          bottomRight: Radius.circular(10.0)),
                                    ),
                                    child: Center(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'reservieren',
                                          style: TextStyle(fontSize: 15.0),
                                        ),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        Icon(
                                          CupertinoIcons.forward,
                                          size: 17,
                                        )
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  const RightPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('GCP Subnetdesign')],
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10.0))),
    );
  }
}

class TopAppBar extends StatelessWidget {
  const TopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            height: 40.0,
            child: Image(
                image: AssetImage(
                    '/Users/leonms/Development/Flutter/subnet_webapp/lib/assets/images/tchibo.png')),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'GCP Subnet',
                style: TextStyle(
                    color: darkGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                'v0.0.1',
                style: TextStyle(fontSize: 8.0, color: Colors.black),
              ),
            )
          ],
        )
      ],
    );
  }
}
