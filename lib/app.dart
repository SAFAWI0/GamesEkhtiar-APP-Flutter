import 'question.dart';

class App {
  int qno = 0;
  List<Question> qgroup = [
    Question(
      qtext: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب 1",
      qimage: 'images/image-1.jpg',
      qanswer: true,
    ),
    Question(
      qtext: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب 2",
      qimage: 'images/image-2.jpg',
      qanswer: true,
    ),
    Question(
      qtext: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب 3",
      qimage: 'images/image-3.jpg',
      qanswer: true,
    ),
    Question(
      qtext: "عدد الكواكب في المجموعة الشمسية هو ثمانية كواكب 4",
      qimage: 'images/image-4.jpg',
      qanswer: true,
    )
  ];

  void next() {
    if (qno < qgroup.length - 1) {
      qno++;
    }
  }

  bool isfin() {
    if (qno >= qgroup.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    qno = 0;
  }
}
