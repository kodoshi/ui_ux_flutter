import 'dart:ui';

import 'package:flutter/material.dart';

class CardScroller extends StatelessWidget {
   List<int> numbers = [1, 2, 3,];
   List<String> cardtext = ["XXXX XXXX XX31 0509", "XXXX XXXX XX31 0508", "XXXX XXXX XX31 0507"];
   List<String> expDate = ["05/22", "01/24", "10/22"];
   List<String> cardName = ["Main card", "Europe travel", "Test"];
   List<String> amount = ["€ 4,907.20", "€ 7,118.30", "€ 1,234.18"];
   List<String> cardType = ["assets/image/visa_logo.png", "assets/image/Mastercard-logo.png", "assets/image/visa_logo.png"];

  @override
  Widget build(BuildContext context) {
    AssetImage imageVisa = AssetImage("assets/image/visa_logo.png");
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: numbers.length, itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                  // color: Colors.black,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(13)
                    ),
                    child: Stack(
                      children: <Widget>[
                        Positioned (
                          left: 16,
                          top: 12,
                          child: Text(cardName[index].toString(), style: TextStyle(fontSize: 20.0),),
                        ),
                        Positioned (
                          left: 16,
                          top: 48,
                          child: Text(cardtext[index].toString(), style: TextStyle(fontSize: 16.0),),
                        ),
                        Positioned (
                          left: 19,
                          top: 70,
                          child: Text(expDate[index].toString(), style: TextStyle(fontSize: 16.0),),
                        ),
                         Positioned (
                          left: 19,
                          top: 150,
                          child: Text(amount[index].toString(), style: TextStyle(fontSize: 32.0)
                          ),
                        ),
                        Positioned (
                          width: 80,
                          left: 170,
                          top: 100,
                          child: Image.asset(cardType[index].toString()),
                          ),
                          Positioned (
                          width: 50,
                          left: 180,
                          top: 17,
                          child: Image.asset("assets/image/google_pay.png"),
                          ),
                        // Text(numbers[index].toString(), 
                        // style: const TextStyle (
                        //   color: Colors.white,
                        //   fontSize: 36.0
                        //   ),
                        // )
                      ]
                    ),
                  ),
                ),
              );
        }),
      ),
    );
  }
}