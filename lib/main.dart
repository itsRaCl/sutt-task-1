import 'package:flutter/material.dart';

void main() {
  runApp(const TrackerApp());
}

class TrackerApp extends StatelessWidget {
  const TrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homepage',
      home: const FirstRoute(),
      theme: ThemeData(fontFamily: 'Ubuntu'),
    );
  }
}

class FirstRoute extends StatefulWidget {
  const FirstRoute({super.key});

  @override
  State<FirstRoute> createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  final List<int> _orderNums = [
    8061001,
    7902680,
    1143815,
    4653099,
    2686620,
    4921122,
    1649061,
    9670888,
    9633673,
    5931500,
    6044297,
    1792240,
    1884977,
    2172694,
    8442250,
    3200397,
    1972705,
    5350576,
    9412450,
    8194957
  ];
  final List<String> _orderStatus = [
    "Pending",
    "Pending",
    "Accepted",
    "Pending",
    "Accepted",
    "Accepted",
    "Declined",
    "Accepted",
    "Pending",
    "Accepted",
    "Pending",
    "Pending",
    "Accepted",
    "Pending",
    "Accepted",
    "Accepted",
    "Declined",
    "Accepted",
    "Pending",
    "Accepted"
  ];
  @override
  Widget build(BuildContext context) {
    const textStyle1 = TextStyle(
      color: Colors.grey,
      fontSize: 50,
    );
    const textStyle2 = TextStyle(color: Colors.white, fontSize: 20);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(children: <Widget>[
              const Expanded(
                  child: Text(
                "Orders",
                style: textStyle1,
              )),
              Expanded(
                  child: Text(
                _orderNums.length.toString(),
                style: textStyle1,
                textAlign: TextAlign.right,
              )),
            ])),
        body: ListView.builder(
          itemCount: _orderNums.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SecondRoute()),
                );
              },
              child: Card(
                margin: const EdgeInsets.all(16),
                color: const Color.fromARGB(255, 46, 46, 46),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text("Order No.:${_orderNums[index]}",
                                style: textStyle2),
                            dense: true,
                          ),
                          ListTile(
                            leading: const Icon(Icons.schedule_outlined,
                                size: 30, color: Colors.grey),
                            title: Text(_orderStatus[index],
                                style: whichTextStyle(index)),
                            dense: true,
                          ),
                          const ListTile(
                            leading: Icon(Icons.inventory_2_outlined,
                                size: 30,
                                color: Color.fromARGB(255, 138, 138, 138)),
                            title: Text('>2lbs', style: textStyle2),
                            dense: true,
                          ),
                          const ListTile(
                            leading: Icon(Icons.shopping_cart_outlined,
                                size: 30, color: Colors.grey),
                            title: Text('x8', style: textStyle2),
                            dense: true,
                          ),
                          ListTile(
                            title: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.purple),
                              child: const Text("\$ 2200", style: textStyle2),
                            ),
                            dense: true,
                          ),
                          const ListTile(
                            title: Text("USA-CA", style: textStyle2),
                            dense: true,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Image(
                          image: AssetImage('assets/download.jpeg'),
                        ),
                        Container(child: checkButtons(index))
                      ],
                    ))
                  ],
                ),
              ),
            );
          },
        ));
  }

  TextStyle whichTextStyle(int index) {
    if (_orderStatus[index] == "Declined") {
      return const TextStyle(color: Colors.red, fontSize: 20);
    } else if (_orderStatus[index] == "Accepted") {
      return const TextStyle(color: Colors.green, fontSize: 20);
    }
    return const TextStyle(color: Colors.grey, fontSize: 20);
  }

  Container checkButtons(int index) {
    if (_orderStatus[index] == 'Pending') {
      return Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.red,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _orderStatus[index] = "Declined";
                  });
                },
                icon: const Icon(Icons.close),
                color: Colors.white,
              ),
            ),
            Ink(
              decoration: const ShapeDecoration(
                color: Colors.green,
                shape: CircleBorder(),
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    _orderStatus[index] = "Accepted";
                  });
                },
                icon: const Icon(Icons.done),
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle3 = TextStyle(
      color: Colors.white,
      fontSize: 15,
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Details',
          style: TextStyle(fontSize: 50),
        ),
        centerTitle: true,
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 30),
            child: Image.asset(
              'assets/download.jpeg',
              height: 250,
              width: 400,
              scale: 0.2,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: const CircularProgressIndicator(
                          value: 0.69, color: Colors.purple),
                    ),
                    const Center(
                      child: Text(
                        'Progress',
                        style: TextStyle(color: Colors.purple, fontSize: 20),
                      ),
                    )
                  ],
                )),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.flash_on_outlined),
                  color: Colors.white),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.white),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 0),
          child: Table(
            border:
                TableBorder.all(color: Colors.white, style: BorderStyle.solid),
            children: const [
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                    "Date",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    "Quantity",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    "Progress",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  ))
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(.0),
                    child: Text(
                      "20/10/22",
                      style: textStyle3,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  TableCell(
                      child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "4123",
                      style: textStyle3,
                      textAlign: TextAlign.center,
                    ),
                  )),
                  TableCell(
                      child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                      size: 20,
                    ),
                    title: Text(
                      "+22%",
                      style: textStyle3,
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                    "19/10/22",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    "4000",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.remove_circle_outline,
                      size: 20,
                      color: Colors.red,
                    ),
                    title: Text(
                      "-2%",
                      style: textStyle3,
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              ),
              TableRow(
                children: [
                  TableCell(
                      child: Text(
                    "18/10/22",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: Text(
                    "4566",
                    style: textStyle3,
                    textAlign: TextAlign.center,
                  )),
                  TableCell(
                      child: ListTile(
                    dense: true,
                    leading: Icon(
                      Icons.add_circle_outline,
                      color: Colors.green,
                      size: 20,
                    ),
                    title: Text(
                      "+6%",
                      style: textStyle3,
                      textAlign: TextAlign.center,
                    ),
                  ))
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
