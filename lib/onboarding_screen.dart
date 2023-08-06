import 'package:flutter/material.dart';
import 'package:newtest23323/intro_screens/intro_page_1.dart';
import 'package:newtest23323/intro_screens/intro_page_2.dart';
import 'package:newtest23323/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Home_page.dart';

class OnBoardingScreen extends StatefulWidget{
  const OnBoardingScreen ({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}
class _OnBoardingScreenState extends State<OnBoardingScreen>{
  PageController _controller = PageController();

  bool onLastPage = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: [
          PageView(
            onPageChanged: (index){
              setState(() {
                onLastPage = (index == 2 );
              });
            },
            controller: _controller,
            children: [
              IntrPage1(),
              IntrPage2(),
              IntrPage3(),
            ],
          ),
          Container(
              alignment: Alignment(0,0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  GestureDetector(
                    onTap :(){
                      _controller.jumpToPage(2);
          },
                      child: Text('Skip'),
              ),

                  SmoothPageIndicator(controller: _controller, count: 3),
                  onLastPage ?
                  GestureDetector(
                      onTap: (){
                          Navigator.push(
                            context,
                              MaterialPageRoute(
                                builder: (context){
                                return HomePage();
                                 },
                              ),
                          );
                      },
                      child: Text('Done')
                  )
                      : GestureDetector(
                      onTap: (){
                        _controller.nextPage(
                          duration: Duration(microseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text('Next')
                  )

                ],
              )
          )
        ],
      ),

    );
  }
}
