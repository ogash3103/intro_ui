import 'package:flutter/material.dart';

import '../utils/StringsText.dart';
import 'homePag.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  static const String id = "intro_page";

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  late PageController _pageController;
  int currentIndex = 0;
 @override
  void initState() {
    _pageController = PageController(
      initialPage: 0
    );
    super.initState();
  }
@override
  void dispose() {
   _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged:(int page){
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                title: Strings.stepOneTitle,
                content: Strings.stepOneContent,
                image: "assets/images/image_1.png",
              ),
              makePage(
                title: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
                image: "assets/images/image_2.png",
              ),
              makePage(
                title: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
                image: "assets/images/image_3.png",
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                _buildIndicator(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20 , right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (currentIndex >= 2)
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, HomePage.id);
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 20, left: 20),
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.orange, fontSize: 18),
                      ),
                    ),
                  ),
              ],
            ),
          )

        ],
      ),
    );
  }
  Widget  makePage({title, content,image,}){
   return Container(
     padding: const EdgeInsets.only(right: 50, left: 50),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(title , style: const TextStyle(color: Colors.orange , fontSize: 30),),
              const SizedBox(height: 10,),
              Text(content , style: const TextStyle(color: Colors.grey , fontSize: 18), textAlign: TextAlign.center,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          )
        ],
      ),
   );
  }

  Widget _indicator(bool isActive){
   return AnimatedContainer(
       duration: const Duration(milliseconds: 300),
     height: 6,
     width: isActive ? 30 : 6,
     margin: const EdgeInsets.only(right: 5),
     decoration: BoxDecoration(
       color: Colors.orange,
       borderRadius: BorderRadius.circular(5),
     ),
   );
  }
  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i= 0; i < 3; i++){
      if(currentIndex == i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
