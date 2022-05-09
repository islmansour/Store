import 'package:flutter/material.dart';

class LatestUpdatesCard extends StatefulWidget {
  final Function function;

  LatestUpdatesCard({Key key, this.function}) : super(key: key);

  @override
  _LatestUpdatesCardState createState() => _LatestUpdatesCardState();
}

class _LatestUpdatesCardState extends State<LatestUpdatesCard> {
  ScrollController lvController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      /*      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ), */

      // elevation: 10,
      constraints: BoxConstraints.tightForFinite(height: 400),
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFFFB000)),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: Icon(
              Icons.update_sharp,
              size: 50,
              color: Color(0xFFFFB000),
            ),
            title: Text('חדשות', style: TextStyle(color: Colors.black)),
            // subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
