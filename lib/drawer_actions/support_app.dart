import 'dart:math';

import 'package:flutter/material.dart';
import 'package:online_store/widgets/default_txt.dart';
import 'package:online_store/widgets/scaffold_snack_bar.dart';
import '../widgets/colors.dart';
class SupportApp extends StatelessWidget {
  const SupportApp({super.key});
  @override
  Widget build(BuildContext context) {
    Random randomMessageIndex = Random();
    return SafeArea(child:
    Scaffold(
        appBar: AppBar(
          title: defText(txt: "Support App", fontSize: 24,txtColor: pink),
        ),
        body:Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       const Spacer(),
        defText(txt: "Your Supporting Comes form your visit us every day 😍 🥰 😘 press the following button to take your daily messages", fontSize: 32,fontWeight:FontWeight.bold,txtAlign: TextAlign.center,txtColor: pink),
       const Spacer(),
        MaterialButton(onPressed: (){
         ScaffoldMessenger.of(context).showSnackBar(
             scaffoldSnackBar(msg: messages[randomMessageIndex.nextInt(messages.length-1)],durationTime: 1000),
         );
       },
         child: Container(
           padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             color: pink,
           ),
             child:defText(txt: "Press here", fontSize: 22,)
         ),
       ),
        const Spacer(),
      ],
    )
        ),
    )
    );
  }
}

List<String> messages = [
  'This too shall pass',
  'Every cloud has a silver lining',
  'It’s not the end of the world',
  'Everything happens for a reason',
  'There is always hope',
  'God never gives us more than we can handle',
  'There is light at the end of the tunnel',
  'If there’s a will, there’s a way',
  'Everything will work out in the end'
  'The sun will rise again'
];

