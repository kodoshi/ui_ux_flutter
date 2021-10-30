import 'package:flutter/material.dart';

class CardScroller extends StatelessWidget {
   List<int> numbers = [1, 2, 3, 5, 8, 13, 21, 34, 55];
   List<String> cardtext = ["XXXX XXXX XX31 0509", "XXXX XXXX XX31 0508", "XXXX XXXX XX31 0507"];

  @override
  Widget build(BuildContext context) {
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
                      children: const <Widget>[
                        Positioned (
                          left: 16,
                          top: 12,
                          child: Text("Europe Travel", style: TextStyle(fontSize: 24.0),),
                        ),
                        Positioned (
                          left: 16,
                          top: 48,
                          child: Text("XXXX XXXX XX31 0509" , style: TextStyle(fontSize: 18.0),),
                        ),
                        Positioned (
                          left: 16,
                          top: 70,
                          child: Text("05/25", style: TextStyle(fontSize: 18.0),),
                        ),
                         Positioned (
                          left: 16,
                          top: 150,
                          child: Text("€ 7,118.30", style: TextStyle(fontSize: 36.0)
                          ),
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