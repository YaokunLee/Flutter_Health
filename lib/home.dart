import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jizhang/app_util.dart';
import 'package:jizhang/daata_item.dart';
import 'package:jizhang/data_line_chart_item.dart';
import 'package:jizhang/report.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> key = GlobalKey();

  final List<Map> _tabs = [
    {"name": "Home", "icon": Icon(Icons.home), "widget": "/"},
    {"name": "Privacy", "icon": Icon(Icons.privacy_tip), "route": "/hotel"},
    {"name": "Report time", "icon": Icon(Icons.timelapse), "route": "/cate"},
    {
      "name": "Report frequency",
      "icon": Icon(Icons.light),
      "route": "/jieshao"
    },
    {"name": "Logout", "icon": Icon(Icons.logout), "route": "/jieshao"},
    {"name": "Contact us", "icon": Icon(Icons.help), "route": "/jieshao"},
    {"name": "Report frequency", "icon": Icon(Icons.home), "route": "/jieshao"},
  ];
  List list = [];
  String groupValue = "";
  @override
  void initState() {
    super.initState();
  }

  void clickMenuItem(e) {
    List list = ["daily", "once every two days", "once every three days"];
    showDialog<void>(
        context: context,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (BuildContext context1,
              void Function(void Function()) setState1) {
            return AlertDialog(
              backgroundColor: Colors.white,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...list.map((e) => Row(
                        children: [
                          Radio(
                              value: e,
                              groupValue: groupValue,
                              onChanged: (val) {
                                groupValue = val;

                                setState1(() {});
                              }),
                          Text(e)
                        ],
                      ))
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "CANCEL",
                      style: TextStyle(color: Color(0xfff7872f)),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                        Text("OK", style: TextStyle(color: Color(0xfff7872f))))
              ],
            );
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    double gap = 10;
    return Scaffold(
        key: key,
        appBar: AppBar(
          shadowColor: Colors.transparent,
          centerTitle: false,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: Icon(Icons.menu)),
          title: Text(
            "Health Data",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: Container(
            color: const Color(0xfff0f5f0),
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).padding.bottom + 10, top: 50),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xff7687f2)),
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.asset(
                            "images/avatar.jpg",
                            width: 50,
                            height: 50,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Not logged in",
                        style: TextStyle(
                            fontSize: 15, color: const Color(0xffffffff)),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Not logged in",
                        style: TextStyle(
                            fontSize: 15, color: const Color(0xffffffff)),
                      ),
                    ],
                  ),
                ),
                ..._tabs.map((e) {
                  return GestureDetector(
                    onTap: () {
                      clickMenuItem(e);
                    },
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(
                          left: 0, right: 10, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 14),
                          e["icon"],
                          SizedBox(width: 20),
                          Text(
                            e["name"],
                            style: TextStyle(
                                fontSize: 15, color: const Color(0xff000000)),
                          ),
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Column(
                  children: [
                    DataItem(
                      head: "Heart Rate",
                      value: "83",
                      tail: "+12%",
                    ),
                    SizedBox(height: gap),
                    DataLineChartItem(
                      head: "Distance",
                      value: "1.25km",
                      tail: "+126.4%",
                      chartData: [1.0, 2.0, 3.0, 5.0, 2, 2, 1],
                    ),
                    SizedBox(height: gap),
                    DataLineChartItem(
                      head: "Steps",
                      value: "3057",
                      tail: "-52%",
                      chartData: [1.0, 2.0, 2.0, 3.0, 1, 1, 2],
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Self-assessment - Sleep",
                      value: "Score:1.0",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Self-assessment - emotion",
                      value: "Score:5.0",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Self-assessment - activity",
                      value: "Score:5.0",
                    ),
                  ],
                )),
                SizedBox(width: gap),
                Expanded(
                    child: Column(
                  children: [
                    DataItem(
                      head: "Rest Heart Rate",
                      value: "72",
                      tail: "-5%",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Move Minutes",
                      value: "53min",
                      tail: "+2%",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Speed",
                      value: "3.13km/h",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Blood Pressure",
                      value: "83",
                      tail: "+12%",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Blood glucose",
                      value: "83",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Self-assessment - Appetite",
                      value: "Score:4.5",
                    ),
                    SizedBox(height: gap),
                    DataItem(
                      head: "Self-assessment - cognition",
                      value: "Score:4.8",
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffffaa88),
          child: Icon(Icons.add),
          onPressed: () {
            AppUtil.getTo(Report());
          },
        ));
  }
}
