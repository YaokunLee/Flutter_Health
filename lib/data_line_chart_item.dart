import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataLineChartItem extends StatefulWidget {
  String? head;
  String? value;
  String? tail;
  List? chartData;
  DataLineChartItem(
      {Key? key, this.head, this.value, this.tail, this.chartData})
      : super(key: key);

  @override
  _DataLineChartItemState createState() => _DataLineChartItemState();
}

class _DataLineChartItemState extends State<DataLineChartItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double chartHeight = 60;
    double max = 0;
    for (int i = 0; i < widget.chartData!.length; i++) {
      if (widget.chartData![i] > max) {
        max = double.parse(widget.chartData![i].toString()) * 1.0;
      }
    }
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
            height: 20,
          ),
          widget.tail != null
              ? Text(
                  widget.tail!,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )
              : Container(),
          widget.chartData != null
              ? Container(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: widget.chartData!
                        .map((e) => Expanded(
                                child: Container(
                              margin: EdgeInsets.only(right: 4),
                              height: chartHeight * (e / max),
                              decoration: BoxDecoration(
                                  color: Color(0xff02dac5),
                                  borderRadius: BorderRadius.circular(3)),
                            )))
                        .toList(),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
