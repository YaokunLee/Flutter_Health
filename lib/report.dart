import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jizhang/app_util.dart';
import 'package:jizhang/home.dart';

class Report extends StatefulWidget {
  @override
  _ReportState createState() => new _ReportState();
}

enum DialogDemoAction {
  cancel,
  connect,
}

class _ReportState extends State<Report> {
  // 睡眠部分
  List<String> description_sleep_array = [
    "I struggled to fall asleep at night",
    "I woke up several times during the night.",
    "I felt exhausted even after a full night's sleep.",
    "I experienced nightmares or distressing dreams.",
    "I found myself oversleeping more often than usual.",
    "My sleep pattern was irregular.",
    "I felt restless even when I tried to relax in bed.",
    "I often woke up feeling unrefreshed.",
    "I had difficulty getting out of bed in the morning.",
  ];
  // 睡眠部分
  List<String> description_shiyu_array = [
    "I frequently skipped meals without realizing it.",
    "The taste of food seemed bland or unappealing to me.",
    "Even when I was hungry, I didn't have the energy to eat.",
    "I often had no appetite.",
    "I neglected proper nutrition and often went for easy or junk foods."
  ];
  // 睡眠部分
  List<String> description_emotion_array = [
    "I felt sad or down most of the time.",
    "I felt hopeless about the future.",
    "I often feel like crying.",
    "I often felt worthless or guilty.",
    "I was easily frustrated or angered by trivial things.",
    "I felt a sense of impending doom or anxiety for no reason.",
    "I felt like I was on an emotional roller coaster, with rapid mood swings.",
    "I felt a persistent sense of guilt or self-blame.",
    "I had a hard time feeling positive emotions, even when good things happened.",
    "I felt a deep sense of isolation, even when surrounded by people.",
    "I found it hard to connect emotionally with others.",
  ];
  // 睡眠部分
  List<String> description_coginion_array = [
    "I had trouble concentrating or making decisions.",
    "I frequently forgot things or became easily distracted.",
    "My thoughts were often negative or self-critical.",
    "Tasks that required thinking felt more challenging than before.",
    "I found it hard to organize my thoughts or express myself clearly.",
    "It took me longer to process information or understand things.",
    "I felt indecisive, even about simple choices.",
    "It was difficult for me to stay focused on a single task.",
    "I often lost my train of thought in the middle of conversations.",
    "I felt overwhelmed by complex tasks or multiple instructions."
  ];

  // 睡眠部分
  List<String> description_interest_activities_array = [
    "I lost interest in activities I once enjoyed.",
    "I felt too tired or unmotivated to participate in hobbies orpastimes.",
    "I withdrew from social activities or gatherings.",
    "Activities that used to bring joy felt meaningless or burdensome.",
    "I avoided or postponed tasks, even if they were important.",
    "I found it hard to initiate or complete projects.",
    "Even simple activities felt draining or overwhelming.",
    "I felt detached or uninvolved when participating in activities."
  ];

  // 睡眠部分
  List<String> description_self_worth_array = [
    "I felt like I was a burden to others.",
    "I doubted my worth or abilities frequently.",
    "I constantly criticized myself or focused on my flaws.",
    "I felt unimportant or invisible to others.",
    "I believed I was not good enough, regardless of my achievements.",
    "Negative self-talk dominated my thoughts.",
    "I struggled to recognize or appreciate my strengths.",
    "I felt undeserving of love, kindness, or success."
  ];

  // 睡眠部分
  List<String> description_interpersonal_relations_array = [
    "I felt distant or disconnected from loved ones.",
    "I struggled to communicate my feelings or needs.",
    "I often felt misunderstood or alone in groups.",
    "I avoided social interactions or dreaded social events.",
    "I found it hard to trust or open up to others.",
    "I felt more sensitive to perceived rejections or criticisms.",
    "I felt a lack of emotional connection in my relationships.",
    "I isolated myself, even from those who wanted to support me."
  ];

  List<String> description_life_attitude_array = [
    "I felt indifferent or cynical about my future.",
    "I struggled to find meaning or purpose in life.",
    "Thoughts of self-harm or suicide occasionally crossed my mind.",
    "I believed things would never get better for me.",
    "I had a constant sense of hopelessness or despair.",
    "I felt trapped or stuck in my current situation.",
    "I frequently thought about escaping or disappearing.",
    "I saw little point in planning for the future or setting goals."
  ];

  List list = [];

  List options = ["1-strongly disagree", "2", "3", "4", "5-strongly agree"];

  int now = 0;
  String? select;
  @override
  initState() {
    super.initState();
    addRadom(description_sleep_array);
    addRadom(description_shiyu_array);
    addRadom(description_emotion_array);
    addRadom(description_coginion_array);
    addRadom(description_interest_activities_array);
    addRadom(description_self_worth_array);
    addRadom(description_interpersonal_relations_array);
    addRadom(description_life_attitude_array);
  }

  void addRadom(List array) {
    List l = [...array];
    int index = Random().nextInt(l.length);
    list.add(l[index]);
    l.removeAt(index);

    int index2 = Random().nextInt(l.length);
    list.add(l[index2]);
  }

  void signin() {
    AppUtil.getTo(Home());
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 80) * now / list.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffdf8f2),
        elevation: 0,
      ),
      backgroundColor: Color(0xfffdf8f2),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  height: 5,
                  width: width,
                  color: Color(0xffffa888),
                ),
                Expanded(
                  child: Container(
                    height: 5,
                    width: 10,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(height: 25),
            Text(
              "On a scale of 1-5, with 5 being strongly agree and 1 being strongly disagree:",
              style: TextStyle(color: Color(0xff666666), fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              list[now]!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 30),
            ...options.map((e) => InkWell(
                  onTap: () {
                    setState(() {
                      select = e;
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(select == e ? 0xfff3d040 : 0xffb0bfc6),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      e,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )),
            Spacer(),
            InkWell(
              onTap: () {
                if (select == null) {
                  return;
                }
                setState(() {
                  now = now + 1;
                  select = null;
                  if (now == list.length - 1) {
                    now = list.length - 1;
                  }
                });
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 30),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xfff3d040),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(now == list.length - 1 ? "Report" : "Next"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
