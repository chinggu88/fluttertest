import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_Widget(),
    );
  }
}

class Main_Widget extends StatefulWidget {
  const Main_Widget({super.key});

  @override
  State<Main_Widget> createState() => _Main_WidgetState();
}

class _Main_WidgetState extends State<Main_Widget> {
  List<CardData> cardDataList = <CardData>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setCardData();
    dateTimeToday();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ClipOval(
                child: Image.network(
              "https://mobile.busan.com/nas/wcms/wcms_data/photos/2023/01/30/2023013014564053484_l.jpg",
              fit: BoxFit.fill,
              width: 60,
              height: 60,
            )),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            ),
          ],
          backgroundColor: Colors.blueGrey[900],
          elevation: 0.0,
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${dateTimeToday()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: scheduleDays(),
                    ),
                  ),
                  Cardwidget()
                ],
              ),
            ),
          ),
        ));
  }

  String dateTimeToday() {
    print('${DateTime.now().day == DateTime.tuesday}');
    if (DateTime.now().day == DateTime.monday) {
      return "${DateTime.monday} ${DateTime.now().day}";
    } else if (DateTime.now().day == DateTime.tuesday) {
      return "${DateTime.tuesday} ${DateTime.now().day}";
    } else if (DateTime.now().day == DateTime.wednesday) {
      return "${DateTime.wednesday} ${DateTime.now().day}";
    } else if (DateTime.now().day == DateTime.thursday) {
      return "${DateTime.thursday} ${DateTime.now().day}";
    } else if (DateTime.now().day == DateTime.friday) {
      return "${DateTime.friday} ${DateTime.now().day}";
    } else if (DateTime.now().day == DateTime.saturday) {
      return "${DateTime.saturday} ${DateTime.now().day}";
    } else if (DateTime.now().day == DateTime.sunday) {
      return "${DateTime.sunday} ${DateTime.now().day}";
    } else {
      return '';
    }
  }

  ///상단 날짜 위젯
  Widget scheduleDays() {
    List<Widget> days = [];
    days.clear();
    days.add(
      const Text(
        'TODAY',
        style: TextStyle(
            color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
    days.add(
      const SizedBox(
        width: 10,
      ),
    );
    days.add(
      CircleAvatar(
        backgroundColor: Colors.pinkAccent,
        radius: 5,
      ),
    );
    days.add(
      const SizedBox(
        width: 10,
      ),
    );
    remainday().forEach((e) {
      days.add(
        Text(
          '$e',
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
      );
      days.add(const SizedBox(
        width: 15,
      ));
    });
    return Row(
      children: days,
    );
  }

  List<int> remainday() {
    List<int> days = [];
    bool contine = true;
    int addday = 1;
    int monthnow = DateTime.now().month;
    while (contine) {
      if (monthnow == DateTime.now().add(Duration(days: addday)).month) {
        days.add((DateTime.now().add(Duration(days: addday)).day));
        addday++;
      } else {
        contine = false;
      }
    }
    return days;
  }

  void setCardData() {
    cardDataList.add(
      CardData(
          startTime: '09:10:00',
          endTime: '10:10:00',
          subject: 'DESING METTING',
          member: ['lee', 'kim', 'park', 'oh'],
          cardColor: Colors.blueAccent),
    );
    cardDataList.add(
      CardData(
          startTime: '10:20:00',
          endTime: '13:20:00',
          subject: 'DALIY PROJECT',
          member: ['lee', 'kim', 'oh'],
          cardColor: Colors.orange),
    );
    cardDataList.add(
      CardData(
          startTime: '13:30:00',
          endTime: '14:30:00',
          subject: 'WEEKLY PROJECT',
          member: ['jone', 'jeik', 'june', 'oh'],
          cardColor: Colors.greenAccent),
    );
    cardDataList.add(
      CardData(
          startTime: '14:40:00',
          endTime: '16:10:00',
          subject: 'MONTHLY METTING',
          member: ['ME', 'William', 'Sophia', 'Benjamin', 'Olivia'],
          cardColor: Colors.yellowAccent),
    );
    cardDataList.add(
      CardData(
          startTime: '17:00:00',
          endTime: '22:10:00',
          subject: 'DINING METTING',
          member: ['lee', 'kim', 'park', 'oh'],
          cardColor: Colors.cyanAccent),
    );
    setState(() {});
  }

  Widget Cardwidget() {
    List<Widget> wigets = [];
    cardDataList.forEach(
      (e) {
        wigets.add(Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: e.cardColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  //시간 부분
                  Container(
                    alignment: Alignment.center,
                    width: (MediaQuery.of(context).size.width - 40) * 0.3,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${e.startTime!.substring(0, 2)}',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '${e.startTime!.substring(3, 5)}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          width: 1,
                          height: 40,
                          color: Colors.black,
                        ),
                        Text(
                          '${e.endTime!.substring(0, 2)}',
                          style: TextStyle(fontSize: 30),
                        ),
                        Text(
                          '${e.endTime!.substring(3, 5)}',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  //미팅주제
                  Container(
                    alignment: Alignment.center,
                    width: (MediaQuery.of(context).size.width - 40) * 0.7,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${e.subject}',
                          style: const TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: List<Widget>.generate(
                              e.member!.length < 4 ? e.member!.length : 4,
                              (index) {
                            return index < 3
                                ? Text(
                                    '${e.member![index]} ',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: e.member![index] == 'ME'
                                            ? Colors.black
                                            : Colors.grey),
                                  )
                                : Text(
                                    '+${e.member!.length - 3}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  );
                          }),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ));
        wigets.add(SizedBox(
          height: 10,
        ));
      },
    );
    return Column(
      children: wigets,
    );
  }
}

class CardData {
  String? startTime;
  String? endTime;
  String? subject;
  List<String>? member;
  Color? cardColor;

  CardData(
      {this.startTime,
      this.endTime,
      this.subject,
      this.member,
      this.cardColor});

  CardData.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    endTime = json['endTime'];
    subject = json['subject'];
    member = json['member'];
    cardColor = json['cardColor'];
  }
}
