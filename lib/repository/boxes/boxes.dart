import 'package:falant/model/box.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Boxes {
  List<Box> _allBoxes() {
    List<Box> boxes = [];

    /*Box pilotBox = Box(name: "Pilot", color: const Color(0xFF3781C1));
    //add box to boxes

    boxes.add(
        pilotBox); //pilot box is a marker box, the box is for starting guideline for user*/

//1st box
    Box firstBox = Box(name: "1", color: const Color(0xFF3583B4));
    //add box to boxes
    boxes.add(firstBox);

    Box secondBox = Box(name: "2", color: const Color(0xFF3B84A7));
    //add box to boxes
    boxes.add(secondBox);

    Box thirdBox = Box(name: "3", color: const Color(0xFF39859C));
    //add box to boxes
    boxes.add(thirdBox);

    Box fourthBox = Box(name: "4", color: const Color(0xFF3B8690));
    //add box to boxes
    boxes.add(fourthBox);

    Box fifthBox = Box(name: "5", color: const Color(0xFF3F8782));
    //add box to boxes
    boxes.add(fifthBox);

    Box sixthBox = Box(name: "6", color: const Color(0xFF588473));
    //add box to boxes
    boxes.add(sixthBox);

    Box seventhBox = Box(name: "7", color: const Color(0xFF6C8164));
    //add box to boxes
    boxes.add(seventhBox);

    Box eighthBox = Box(name: "8", color: const Color(0xFF837B5D));
    //add box to boxes
    boxes.add(eighthBox);

    Box ninthBox = Box(name: "9", color: const Color(0xFF907660));
    //add box to boxes
    boxes.add(ninthBox);

    Box tenthBox = Box(name: "10", color: const Color(0xFF9E6E6F));
    //add box to boxes
    boxes.add(tenthBox);

    Box eleventhBox = Box(name: "11", color: const Color(0xFF9F6D7C));
    //add box to boxes
    boxes.add(eleventhBox);

    Box twelfthBox = Box(name: "12", color: const Color(0xFF9C6D89));
    //add box to boxes
    boxes.add(twelfthBox);

    Box thirteenthBox = Box(name: "13", color: const Color(0xFF927099));
    //add box to boxes
    boxes.add(thirteenthBox);

    Box fourteenthBox = Box(name: "14", color: const Color(0xFF8F6FA4));
    //add box to boxes
    boxes.add(fourteenthBox);

    Box fifteenthBox = Box(name: "15", color: const Color(0xFF8073B2));
    //add box to boxes
    boxes.add(fifteenthBox);
    //return the boxes
    return boxes;
  }

  //get boxes method

  List<Box> getBoxes(num number) {
    List<Box> boxes = [];

    List<Box> all = [];
    all.addAll(_allBoxes());

    //get only number boxes
    for (int i = 0; i < all.length; i++) {
      if (boxes.length < number) {
        Box box = all.elementAt(i);
        boxes.add(box);
      }
    }
    return boxes;
  }

  //number of boxes in a level
  num numberOfBoxes(num level) {
    return level * 16;
  }
}


/*color code rgb to android code
p. rgb(55,129,193) => Color(0xFF3781C1)
1. rgb(108,129,100) => Color(0xFF6C8164)
2. rgb(59,134,144) => Color(0xFF3B8690)
3. rgb(143,111,164) => Color(0xFF8F6FA4)
4. rgb(144,118,96) => 0xFF907660
5. rgb(88,132,115) => 0xFF588473
6. rgb(156,109,137) => 0xFF9C6D89
7. rgb(57,133,156) => 0xFF39859C
8. rgb(159,109,124) => 0xFF9F6D7C
9. rgb(128,115,178) => 0xFF8073B2
10. rgb(59,132,167) => 0xFF3B84A7 
11. rgb(146,112,153) => 0xFF927099
12. rgb(131,123,93) => 0xFF837B5D
13. rgb(53,131,180) => 0xFF3583B4
14. rgb(63,135,130) => 0xFF3F8782
15. rgb(158,110,111) => 0xFF9E6E6F

*/