import 'package:flutter/material.dart';

class Level11 extends StatefulWidget {
  @override
  _Level11State createState() => _Level11State();
}

class _Level11State extends State<Level11> {
  int times = 0;

  String a1;
  String a2;
  String a3;
  String a4 = 'assets/red.png';
  String a5 = 'assets/blue.png';
  String a6 = 'assets/orange.png';

  String b1 = 'assets/orange.png';
  String b2 = 'assets/red.png';
  String b3 = 'assets/blue.png';
  String b4;
  String b5;
  String b6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Build Tower'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/small.png'),
                      fit: BoxFit.fill,
                    )),
                    child: Column(
                      children: <Widget>[
                        TowerItem(
                          image: a1,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/mid.png'),
                      fit: BoxFit.fill,
                    )),
                    child: Column(
                      children: <Widget>[
                        TowerItem(
                          image: a2,
                        ),
                        TowerItem(
                          image: a3,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/big.png'),
                      fit: BoxFit.fill,
                    )),
                    child: Column(
                      children: <Widget>[
                        TowerItem(
                          image: a4,
                        ),
                        TowerItem(
                          image: a5,
                        ),
                        TowerItem(
                          image: a6,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 3 / 4,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/movements.png'),
                fit: BoxFit.fill,
              )),
              child: Center(
                child: Text(
                  'Movements $times /4',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/small.png'),
                        fit: BoxFit.fill,
                      )),
                      child: _buildDragTarget(b1, 'B1')),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/mid.png'),
                      fit: BoxFit.fill,
                    )),
                    child: _buildDragTarget(b2, 'B2'),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage('assets/big.png'),
                      fit: BoxFit.fill,
                    )),
                    child: _buildDragTarget(b4, 'B3'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragTarget(String aState, String s) {
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        if (s == 'B1') {
          if (b1 == null) {
            return TowerItem();
          } else {
            return Draggable(
              data: 'B1',
              child: Column(
                children: <Widget>[
                  TowerItem(image: b1),
                ],
              ),
              feedback: TowerItem(image: b1),
              childWhenDragging: Column(
                children: <Widget>[
                  TowerItem(),
                ],
              ), // <-- so it looks like the original view is beeing dragged
              onDraggableCanceled: (v, f) => setState(
                () {},
              ),
            );
          }
        } else if (s == 'B2') {
          if (b2 != null) {
            return Column(
              children: <Widget>[
                Draggable(
                  data: 'B2',
                  child: Column(
                    children: <Widget>[
                      TowerItem(image: b2),
                    ],
                  ),
                  feedback: TowerItem(image: b2),
                  childWhenDragging: Column(
                    children: <Widget>[
                      TowerItem(),
                    ],
                  ), // <-- so it looks like the original view is beeing dragged
                  onDraggableCanceled: (v, f) => setState(
                    () {},
                  ),
                ),
                TowerItem(image: b3),
              ],
            );
          } else if (b3 != null) {
            return Column(
              children: <Widget>[
                TowerItem(),
                Draggable(
                  data: 'B3',
                  child: Column(
                    children: <Widget>[
                      TowerItem(image: b3),
                    ],
                  ),
                  feedback: TowerItem(image: b3),
                  childWhenDragging: Column(
                    children: <Widget>[
                      TowerItem(),
                    ],
                  ), // <-- so it looks like the original view is beeing dragged
                  onDraggableCanceled: (v, f) => setState(
                    () {},
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: <Widget>[
                TowerItem(),
                TowerItem(),
              ],
            );
          }
        } else if (s == 'B3') {
          if (b4 != null) {
            return Column(
              children: <Widget>[
                Draggable(
                  data: 'B4',
                  child: Column(
                    children: <Widget>[
                      TowerItem(
                        image: b4,
                      ),
                    ],
                  ),
                  feedback: TowerItem(
                    image: b4,
                  ),
                  childWhenDragging: Column(
                    children: <Widget>[
                      TowerItem(),
                    ],
                  ), // <-- so it looks like the original view is beeing dragged
                  onDraggableCanceled: (v, f) => setState(
                    () {},
                  ),
                ),
                TowerItem(image: b5),
                TowerItem(image: b6),
              ],
            );
          } else if (b5 != null) {
            return Column(
              children: <Widget>[
                TowerItem(),
                Draggable(
                  data: 'B5',
                  child: Column(
                    children: <Widget>[
                      TowerItem(image: b5),
                    ],
                  ),
                  feedback: TowerItem(image: b5),
                  childWhenDragging: Column(
                    children: <Widget>[
                      TowerItem(),
                    ],
                  ), // <-- so it looks like the original view is beeing dragged
                  onDraggableCanceled: (v, f) => setState(
                    () {},
                  ),
                ),
                TowerItem(image: b6),
              ],
            );
          } else if (b6 != null) {
            return Column(
              children: <Widget>[
                TowerItem(),
                TowerItem(),
                Draggable(
                  data: 'B6',
                  child: Column(
                    children: <Widget>[
                      TowerItem(image: b6),
                    ],
                  ),
                  feedback: TowerItem(
                    image: b6,
                  ),
                  childWhenDragging: Column(
                    children: <Widget>[
                      TowerItem(),
                    ],
                  ), // <-- so it looks like the original view is beeing dragged
                  onDraggableCanceled: (v, f) => setState(
                    () {},
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: <Widget>[
                TowerItem(),
                TowerItem(),
                TowerItem(),
              ],
            );
          }
        } else {
          return TowerItem();
        }
      },
      onAccept: (data) {
        print('s  -- $s $data');
        if (data == 'B1') {
          if (s == 'B2') {
            if (b3 == null) {
              setState(() {
                b3 = b1;
                b1 = null;
                times += 1;
              });
            } else if (b2 == null) {
              setState(() {
                b2 = b1;
                b1 = null;
                times += 1;
              });
            }
          } else if (s == 'B3') {
            if (b6 == null) {
              setState(() {
                b6 = b1;
                b1 = null;
                times += 1;
              });
            } else if (b5 == null) {
              setState(() {
                b5 = b1;
                b1 = null;
                times += 1;
              });
            } else if (b4 == null) {
              setState(() {
                b4 = b1;
                b1 = null;
                times += 1;
              });
            }
          }
        } else if (data == 'B2') {
          if (s == 'B1') {
            if (b1 == null) {
              setState(() {
                b1 = b2;
                b2 = null;
                times += 1;
              });
            }
          } else if (s == 'B3') {
            if (b6 == null) {
              setState(() {
                b6 = b2;
                b2 = null;
                times += 1;
              });
            } else if (b5 == null) {
              setState(() {
                b5 = b2;
                b2 = null;
                times += 1;
              });
            } else if (b4 == null) {
              setState(() {
                b4 = b2;
                b2 = null;
                times += 1;
              });
            }
          }
        } else if (data == 'B3') {
          if (s == 'B1') {
            if (b1 == null) {
              setState(() {
                b1 = b3;
                b3 = null;
                times += 1;
              });
            }
          } else if (s == 'B3') {
            if (b6 == null) {
              setState(() {
                b6 = b3;
                b3 = null;
                times += 1;
              });
            } else if (b5 == null) {
              setState(() {
                b5 = b3;
                b3 = null;
                times += 1;
              });
            } else if (b4 == null) {
              setState(() {
                b4 = b3;
                b3 = null;
                times += 1;
              });
            }
          }
        } else if (data == 'B4') {
          if (s == 'B1') {
            if (b1 == null) {
              setState(() {
                b1 = b4;
                b4 = null;
                times += 1;
              });
            }
          } else if (s == 'B2') {
            if (b3 == null) {
              setState(() {
                b3 = b4;
                b4 = null;
                times += 1;
              });
            } else if (b2 == null) {
              setState(() {
                b2 = b4;
                b4 = null;
                times += 1;
              });
            }
          }
        } else if (data == 'B5') {
          if (s == 'B1') {
            if (b1 == null) {
              setState(() {
                b1 = b5;
                b5 = null;
                times += 1;
              });
            }
          } else if (s == 'B2') {
            if (b3 == null) {
              setState(() {
                b3 = b5;
                b5 = null;
                times += 1;
              });
            } else if (b2 == null) {
              setState(() {
                b2 = b5;
                b5 = null;
                times += 1;
              });
            }
          }
        } else if (data == 'B6') {
          if (s == 'B1') {
            if (b1 == null) {
              setState(() {
                b1 = b6;
                b6 = null;
                times += 1;
              });
            }
          } else if (s == 'B2') {
            if (b3 == null) {
              setState(() {
                b3 = b6;
                b6 = null;
                times += 1;
              });
            } else if (b2 == null) {
              setState(() {
                b2 = b6;
                b6 = null;
                times += 1;
              });
            }
          }
        }
        if (a1 == b1 &&
            a2 == b2 &&
            a3 == b3 &&
            a4 == b4 &&
            a5 == b5 &&
            a6 == b6) {
          showAlertDialog(context);
        }
      },
      onLeave: (data) {},
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Successful"),
      content: Text(
        "Result = ${400 / times} %",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class TowerItem extends StatelessWidget {
  const TowerItem({
    Key key,
    this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: image != null
          ? BoxDecoration(
              image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.fill,
            ))
          : BoxDecoration(),
      height: 50,
      width: 80,
    );
  }
}
