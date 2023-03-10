//play ground
import 'package:falant/game/result_screen.dart';
import 'package:falant/model/box.dart';
import 'package:falant/model/level.dart';
import 'package:falant/repository/boxes/boxes.dart';
import 'package:falant/repository/results.dart';
import 'package:flutter/material.dart';

class D15 extends StatefulWidget {
  const D15({super.key, required this.level});
  //member
  final Level level;
  //constructor

  @override
  State<D15> createState() => _D15State();
}

class _D15State extends State<D15> {
  //members
  late List<Box> boxes = [];
  late List<Box> opaqueBoxes = []; //to be filled
  late List<Box> choiceBoxes = []; //user will select from this list
  var userInput = [];
  String result = "";
  int mismatches = 0;

  //disposal
  @override
  void dispose() {
    super.dispose();
  }

  //initial
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
//level from widget passed in consructor

    //get all level boxes
    boxes.addAll(Boxes().getBoxes(Boxes().numberOfBoxes(1)));
    opaqueBoxes.addAll(boxes); //to be filled
    //opaqueBoxes.shuffle(); //randomly arranged

//choice
    choiceBoxes.addAll(boxes);
    //choiceBoxes.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text("D15 TEST"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              //list of opaque boxes
              child: Center(
                child: ListView(
                  children: [
                    GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 5,
                        children: List.generate(1, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 4, bottom: 2),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFF3781C1),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: Border.all(color: Colors.grey),
                            ),
                          );
                        })),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 5,
                      children: List.generate(opaqueBoxes.length,
                          (index) => _generateOpaque(index)),
                    ),
                  ],
                ),
              ),
            ),

            //choice boxes'
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 5,
                children: List.generate(
                    choiceBoxes.length, (index) => _generateChoiceBox(index)),
              ),
            ),

            ElevatedButton(
              child: Text("Reset"),
              onPressed: _reset,
            )
          ],
        ));
  }

  Widget _generateOpaque(int index) {
    return DragTarget<Box>(
      builder: (BuildContext context, List<dynamic> accepted,
          List<dynamic> rejected) {
        return opaqueBoxes.elementAt(index).filled
            ? _filledBox(index)
            : _opaqueBox(index);
      },
      onWillAccept: (data) {
        //Calcualate score
        //result();

        return true;
      },
      onAccept: (data) {
        //once box is accepted call back

        setState(() {
          var box = Box(
            color: data.color,
            name: data.name,
            filled: true,
          );
          opaqueBoxes[index] = box; //opaqueboxes to be filled is already filled
          userInput.add(data.name);
          choiceBoxes.removeWhere((element) => element.name == data.name);
        });

        if (isLevelEnd()) {
          _evaluate();
          print(userInput);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  result: result,
                  mismatches: mismatches,
                  total: userInput.length,
                ),
              ));
        }
      },
    );
  }

  _filledBox(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        color: opaqueBoxes.elementAt(index).color,
      ),
    );
  }

  _opaqueBox(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        border: Border.all(color: Colors.grey),
      ),
      child: Text(
        opaqueBoxes.elementAt(index).name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  bool isLevelEnd() {
    //ends only  if no more choice
    return choiceBoxes.isEmpty;
  }

  Widget _generateChoiceBox(int index) {
    return Draggable<Box>(
      data: choiceBoxes.elementAt(index),
      feedback: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey),
          color: choiceBoxes[index].color,
        ),
      ),
      childWhenDragging: Container(),
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 4, bottom: 2),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: Colors.grey),
          color: choiceBoxes[index].color,
        ),
      ),
    );
  }

  void _evaluate() {
    mismatches = 0;
    if (userInput.length != 15) {
      return;
    }

    for (int i = 0; i < userInput.length; i++) {
      if (userInput[i] != normalList[i]) {
        mismatches++;
      }
    }
    if (mismatches == 0) {
      if (userInput.toString().toLowerCase() ==
          normalList.toString().toLowerCase()) {
        result = "Normal";
      }
    } else if (mismatches <= 2) {
      result = "Normal";
    } else {
      if (userInput.toString().toLowerCase() !=
          normalList.toString().toLowerCase()) {
        if (userInput.toString().toLowerCase() ==
            protanList.toString().toLowerCase()) {
          result = "Protan";
          print("Protan");
        } else if (userInput.toString().toLowerCase() ==
            deutanList.toString().toLowerCase()) {
          result = "Deutan";
          print("Deutan");
        } else if (userInput.toString().toLowerCase() ==
            tritanList.toString().toLowerCase()) {
          result = "Tritan";
          print("Tritan");
        } else {
          result = "Color Defient";
          print("Color Defient");
        }
      }
    }
    print(mismatches);
  }

  void _reset() {
    setState(() {
      opaqueBoxes = Boxes().getBoxes(Boxes().numberOfBoxes(1));
      choiceBoxes = Boxes().getBoxes(Boxes().numberOfBoxes(1));
      // reset the state of the boxes here
      for (int i = 0; i < opaqueBoxes.length; i++) {
        opaqueBoxes[i] = Box(
            color: opaqueBoxes[i].color,
            name: opaqueBoxes[i].name,
            filled: false);
      }
      // clear the userInput list
      userInput.clear();
      mismatches = 0;
    });
  }
}
