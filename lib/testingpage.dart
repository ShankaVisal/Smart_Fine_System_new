import 'package:flutter/material.dart';
import 'package:untitled27/Home%20Page.dart';

class testing extends StatefulWidget {
  @override
  State<testing> createState() => _testingState();
}

class _testingState extends State<testing> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView Example',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tesing Preveiw'),
        ),
        body: Center(
          /** Card Widget **/
          child: Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.blueAccent[100],
            child: SizedBox(
              width: 300,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.blue[500],
                      radius: 108,
                      child: const CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://shankavisal.github.io/SV-creations/assets/img/products/ssc.png"),
                        //NetworkImage
                        radius: 100,
                      ), //CircleAvatar
                    ), //CircleAvatar
                    const SizedBox(
                      height: 10,
                    ), //SizedBox
                    Text(
                      'SV Creations',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ), //Text
                    const SizedBox(
                      height: 10,
                    ), //SizedBox
                    const Text(
                      "We are a design solutions company with 2 years of experience. We believe that creative vision can create a beautiful world. We have a great team with a creative mindset to design what you need. We understand your brand's purpose, vision, values, audience, competition, personality, etc. through in-depth discovery sessions to establish an appropriate positioning strategy.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ), //Textstyle
                    ), //Text
                    const SizedBox(
                      height: 10,
                    ), //SizedBox
                    SizedBox(
                      width: 100,

                      child: ElevatedButton(
                        onPressed: () => 'Null',
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            children: [
                              Icon(Icons.touch_app),
                              Text('Visit')
                            ],
                          ),
                        ),
                      ),
                      // RaisedButton is deprecated and should not be used
                      // Use ElevatedButton instead

                      // child: RaisedButton(
                      //   onPressed: () => null,
                      //   color: Colors.green,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(4.0),
                      //     child: Row(
                      //       children: const [
                      //         Icon(Icons.touch_app),
                      //         Text('Visit'),
                      //       ],
                      //     ), //Row
                      //   ), //Padding
                      // ), //RaisedButton
                    ) //SizedBox
                  ],
                ), //Column
              ), //Padding
            ), //SizedBox
          ), //Card
        ), //Center
      ), //Scaffold
      //MaterialApp
    );
  }
}