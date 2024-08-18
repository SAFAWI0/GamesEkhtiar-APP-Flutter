import 'package:flutter/material.dart';
// import 'question.dart';
import 'app.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

App app = App();

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text("Information"),
        ),
        body: Myst(),
      ),
    );
  }
}

class Myst extends StatefulWidget {
  const Myst({super.key});

  @override
  State<Myst> createState() => _MystState();
}

class _MystState extends State<Myst> {
  List<Widget> list = [];
  int rn = 0;
  void check(bool what) {
    bool corr = app.qgroup[app.qno].qanswer;
    setState(() {
      if (what == corr) {
        rn++;
        list.add(Icon(
          Icons.thumb_up,
          color: Colors.green,
          size: 20,
        ));
      } else {
        list.add(Icon(
          Icons.thumb_down,
          color: Colors.red,
          size: 20,
        ));
      }
      if (app.isfin() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: " انتهاء",
          desc: "لقد اجبت ع $rn صحيحه من اصل 4",
          buttons: [
            DialogButton(
              child: Text(
                "ابدء من جديد",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();
        app.reset();
        list = [];
        rn = 0;
      } else
        [app.next()];
    });
  }

  // List<String> ques = [
  //   "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب 1",
  //   "2 عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب",
  //   "3 عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب",
  // ];
  // List<String> noimage = [
  //   'images/image-1.jpg',
  //   'images/image-2.jpg',
  //   'images/image-3.jpg',
  //   'images/image-4.jpg',
  // ];
  // List<bool> answres = [
  //   true,
  //   true,
  //   false,
  //   false,
  // ];

  // Question question1 = Question(
  //   qtext: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب 1",
  //   qimage: 'images/image-1.jpg',
  //   qanswer: true,
  // );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: list,
        ),
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  app.qgroup[app.qno].qimage,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                app.qgroup[app.qno].qtext,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  check(true);
                },
                child: Text(
                  "صح",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Container(
              color: Colors.red,
              child: TextButton(
                onPressed: () {
                  check(false);
                },
                child: Text(
                  "خطأ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
