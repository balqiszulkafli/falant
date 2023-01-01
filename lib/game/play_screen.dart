//play ground
import 'package:falant/game/result_screen.dart';
import 'package:falant/model/box.dart';
import 'package:falant/model/level.dart';
import 'package:falant/repository/boxes/boxes.dart';
import 'package:falant/repository/results.dart';
import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key, required this.level});
  //member
  final Level level;
  //constructor

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  //members
  late List<Box> boxes = [];
  late List<Box> opaqueBoxes = []; //to be filled
  late List<Box> choiceBoxes = []; //user will select from this list
  List<String> userInput = [];
  String result = "";

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
    choiceBoxes.shuffle();
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
          opaqueBoxes[index].color = data.color;
          //opaqueBoxes[index].name = data.name;
          userInput.insert(index, data.name);

          opaqueBoxes.elementAt(index).filled =
              true; //opaqueboxes to be filled is already filled
          //accept box
          acceptBox(opaqueBoxes.elementAt(index));
        });
        calculateResult();

        if (isLevelEnd()) {
          //game level ended
          print(userInput);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  result: result,
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

  void calculateResult() {
    //scoring here
    bool isSameNormal = normalList.every((item) => userInput.contains(item));
    bool isSameProtan = protanList.every((item) => userInput.contains(item));
    bool isSameDeutan = protanList.every((item) => userInput.contains(item));
    bool isSameTritan = protanList.every((item) => userInput.contains(item));

    if (isSameNormal == true) {
      result = "Normal";
    } else if (isSameProtan == true) {
      result = "Protan";
    } else if (isSameDeutan == true) {
      result = "Deutan";
    } else if (isSameTritan == true) {
      result = "Tritan";
    } else {
      result = "Result cannot be detected, please retake";
    }
  }

  void acceptBox(Box box) {
    //find the box from choiceBoxed and remove it
    for (int i = 0; i < choiceBoxes.length; i++) {
      //compare using names
      Box b = choiceBoxes.elementAt(i);
      if (b.name == box.name) {
        setState(() {
          choiceBoxes.removeAt(i);
        });
      }
    }
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
}
