import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataItem extends StatefulWidget {
  String? head;
  String? value;
  String? tail;
  DataItem({Key? key, this.head, this.value, this.tail}) : super(key: key);

  @override
  _DataItemState createState() => _DataItemState();
}

class _DataItemState extends State<DataItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0XFF6100AC),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.head != null
              ? Text(
                  widget.head!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          widget.value != null
              ? Text(
                  widget.value!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )
              : Container(),
          SizedBox(
            height: widget.tail != null ? 20 : 0,
          ),
          widget.tail != null
              ? Text(
                  widget.tail!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              : Container(),
        ],
      ),
    );
  }
}
