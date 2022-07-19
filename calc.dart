import 'package:eval_ex/expression.dart';
import 'package:flutter/material.dart';

class calc extends StatefulWidget {
  const calc({Key? key}) : super(key: key);

  @override
  State<calc> createState() => _calcState();
}

class _calcState extends State<calc> {
  late String currentvalue;
  String textval = "";
  TextEditingController tc = TextEditingController();
  GestureDetector _digitButton({required String number, required col}) {
    return GestureDetector(
      onTap: () {
        currentvalue = number;
        tc.text = tc.text + currentvalue;
        setState(() {});
      },
      child: Container(
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(color: col, shape: BoxShape.circle),
      ),
    );
  }

  GestureDetector _equal(String number) {
    return GestureDetector(
      onTap: () {
        Expression exp = Expression(tc.text);

        tc.text = exp.eval().toString();
      },
      child: Container(
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
      ),
    );
  }

  GestureDetector _restart(String number) {
    return GestureDetector(
      onTap: () {
        tc.text = "";
      },
      child: Container(
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
    );
  }

  GestureDetector _sing(String number) {
    return GestureDetector(
      onTap: () {
        tc.text = (int.parse(tc.text) * -1).toString();
      },
      child: Container(
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
      ),
    );
  }

  GestureDetector _zero(String number) {
    return GestureDetector(
      onTap: () {
        Expression exp = Expression(tc.text);
        tc.text = exp.eval().toString();
      },
      child: Container(
        width: 150,
        height: 70,
        child: Center(
          child: Text(
            number,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(50),
            shape: BoxShape.rectangle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: TextField(
                  controller: tc,
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _restart("AC"),
                _sing("+/-"),
                _digitButton(number: "%", col: Colors.grey),
                _digitButton(number: "/", col: Colors.orange)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _digitButton(number: "7", col: Colors.grey.shade800),
                _digitButton(number: "8", col: Colors.grey.shade800),
                _digitButton(number: "9", col: Colors.grey.shade800),
                _digitButton(number: "*", col: Colors.orange)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _digitButton(number: "4", col: Colors.grey.shade800),
                _digitButton(number: "5", col: Colors.grey.shade800),
                _digitButton(number: "6", col: Colors.grey.shade800),
                _digitButton(number: "-", col: Colors.orange)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _digitButton(number: "1", col: Colors.grey.shade800),
                _digitButton(number: "2", col: Colors.grey.shade800),
                _digitButton(number: "3", col: Colors.grey.shade800),
                _digitButton(number: "+", col: Colors.orange)
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _zero("0"),
                _digitButton(number: ".", col: Colors.grey.shade800),
                _equal("=")
              ],
            ),
          ],
        ),
      )),
    );
  }
}
