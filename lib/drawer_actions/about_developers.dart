import 'package:flutter/material.dart';
import 'package:online_store/widgets/default_txt.dart';
import '../widgets/colors.dart';
class AboutDevelopers extends StatelessWidget {
  const AboutDevelopers({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        title: defText(txt: "About Developers", fontSize: 24,txtColor: pink),
      ),
      body:Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image:AssetImage('assets/imgs/developer.jpg'),
                  fit: BoxFit.cover,
                )

            ),
          ),
          defText(txt: "Karim Mokhtar Ramadan Faculty of Engineering Helwan university Software Engineer Flutter developer ", fontSize: 24,txtColor: pink,txtAlign: TextAlign.center)
        ],
      )
    )
    );
  }
}
