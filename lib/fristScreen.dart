import 'dart:io';

import 'package:flutter/material.dart';
import 'second.dart';

class ScreenA extends StatefulWidget{
  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child:  Container(
          height: 53,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextButton(
            onPressed: (){
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InvoiceScreen()));
              });
            },
            child: Text("Generate Invoice",style: TextStyle(
                color: Colors.black,fontSize: 25,letterSpacing: 0.5
            ),),
          ),
        ),
      ),
    );
  }

}