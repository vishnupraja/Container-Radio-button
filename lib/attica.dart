import 'package:flutter/material.dart';


class Attica extends StatefulWidget {
  const Attica({Key? key}) : super(key: key);

  @override
  State<Attica> createState() => _AtticaState();
}

class _AtticaState extends State<Attica> {
  int? _selectedValueIndex;
  List<String> buttonText = ["Male", "Female","Other"];

  Widget button({required String text, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () {
        setState(() {
          _selectedValueIndex = index;
        });
      },
      child:Row(
        children: [
          SizedBox(width: 18,),

          Container(
            height: 50,
            width: 90,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: index == _selectedValueIndex ? Colors.greenAccent : Colors.white12,
              borderRadius: BorderRadius.circular(20)
            ),

            child: Text(
              text,
              style: TextStyle(
                color: index == _selectedValueIndex ? Colors.white : Colors.white24,
              ),
            ),
          ),
        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
    child:AppBar(
    backgroundColor: Color(0xff15654F),
    title:Padding(
      padding: EdgeInsets.only(top: 5),
      child:  Text("Sign Up",style: TextStyle(fontSize: 50,color: Colors.white24,)),
    ),
    leading:Padding(
      padding: EdgeInsets.all(10),
      child:  Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffF1D459),
                Color(0xffB27E29)
              ],
            ),
            borderRadius: BorderRadius.circular(50)
        ),
        child: Icon(Icons.arrow_back,color: Color(0xff0C3B2E),),
      ),
    ),
      actions: [
       Container(
         height: 150,
         width: 60,
         decoration: BoxDecoration(
           image: DecorationImage(
             image: AssetImage("assets/appbar.png",),
             fit: BoxFit.fill
           )
         ),
       )
      ],
    )
        ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
         gradient: LinearGradient(
             begin: Alignment.topLeft,
             end: Alignment.bottomRight,
             colors: [
             Color(0xff15654F),
            Color(0xff0F261E)
            ]
         )
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Padding(
             padding: EdgeInsets.only(left: 20,top: 20),
             child:  Text("Your name",style: TextStyle(color: Colors.white24),),
           ),
           Padding(
             padding: EdgeInsets.only(right: 20,left: 20,top: 10),
             child: Container(
               height: 50,
               width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
               child:  TextFormField(
             style: TextStyle(color: Colors.white54),
             decoration: InputDecoration(
                 filled: true,
                 fillColor: Colors.white12,
                 hintText: "Enter Your name here",
                 hintStyle: TextStyle(color: Colors.white12),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(20),
                   borderSide: BorderSide.none
                 )


             ),
           ),
             )
           ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 20),
              child:  Text("Your mobile number",style: TextStyle(color: Colors.white24),),
            ),
            Padding(
                padding: EdgeInsets.only(right: 20,left: 20,top: 10),
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  TextFormField(
                    style: TextStyle(color: Colors.white54),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white12,
                        hintText: "Enter Your name here",
                        hintStyle: TextStyle(color: Colors.white12),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none
                        )


                    ),
                  ),
                )
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 20),
              child:  Text("Your Gender",style: TextStyle(color: Colors.white24),),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                ...List.generate(
                  buttonText.length,
                      (index) => button(
                    index: index,
                    text: buttonText[index],
                  ),
                )
              ],
            ),
          ],
        ),
        ),
      ) ;
  }
}

