import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animator/animator.dart';
import 'dart:math';

class AnimationDemo extends StatefulWidget {
  AnimationDemo() : super();

  final String title = "Flutter Animation";

  @override
  AnimationDemoState createState() => AnimationDemoState();
}

class AnimationDemoState extends State<AnimationDemo>
    with SingleTickerProviderStateMixin {
  //
  final logo = FlutterLogo(
    size: 100,
  );

  Widget animatorOpacity() {
    return Animator(
      repeats: 5,
      //cycles: 2 * 5,
      builder: (anim) => Opacity(
            opacity: anim.value,
            child: logo,
          ),
    );
  }

  Widget animatorFadeIn() {
    return Animator(
      duration: Duration(seconds: 3),
      curve: Curves.elasticOut,
      // repeats: 5,
      cycles: 0,
      builder: (anim) => FadeTransition(
            opacity: anim,
            child: logo,
          ),
    );
  }

  Widget transformScale() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform.scale(
            scale: anim.value,
            alignment: Alignment.bottomRight,
            child: logo,
          ),
    );
  }

  Widget transformScale2() {
    return Animator(
      tween: Tween<double>(begin: 0.5, end: 1.5),
      duration: Duration(seconds: 3),
      curve: Curves.elasticOut,
      cycles: 0,
      builder: (anim) => Transform.scale(
            scale: anim.value,
            child: logo,
          ),
    );
  }

  Widget sizeTransition1() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => SizeTransition(
            sizeFactor: anim,
            child: logo,
          ),
    );
  }

  Widget sizeTransition2() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => SizeTransition(
            axis: Axis.horizontal,
            sizeFactor: anim,
            child: logo,
          ),
    );
  }

  Widget sizeTransition3() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => SizeTransition(
            axis: Axis.horizontal,
            axisAlignment: -1,
            sizeFactor: anim,
            child: logo,
          ),
    );
  }

  Widget sizeTransition4() {
    return Animator(
      tween: Tween<double>(begin: 0.5, end: 1.5),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => SizeTransition(
            axis: Axis.horizontal,
            axisAlignment: 1,
            sizeFactor: anim,
            child: logo,
          ),
    );
  }

  Widget rotate() {
    return Animator(
      tween: Tween<double>(begin: 0, end: 2 * pi),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform.rotate(
            angle: anim.value,
            child: logo,
          ),
    );
  }

  Widget rotate2() {
    return Animator(
      tween: Tween<double>(begin: 0, end: 2 * pi),
      duration: Duration(seconds: 3),
      cycles: 0,
      curve: Curves.elasticOut,
      builder: (anim) => Transform(
            transform: Matrix4.rotationZ(anim.value),
            alignment: Alignment.center,
            child: logo,
          ),
    );
  }

  Widget rotate3() {
    return Animator(
      tween: Tween<double>(begin: 0, end: 3),
      duration: Duration(seconds: 3),
      repeats: 0,
      builder: (anim) => Transform(
            transform: Matrix4.rotationY(anim.value),
            alignment: Alignment.center,
            child: logo,
          ),
    );
  }

  Widget rotate4() {
    return Animator(
      tween: Tween<double>(begin: 0, end: 3),
      duration: Duration(seconds: 3),
      repeats: 0,
      builder: (anim) => RotationTransition(
            turns: anim,
            alignment: Alignment.center,
            child: logo,
          ),
    );
  }

  Widget skew1() {
    return Animator(
      tween: Tween<double>(begin: -0.5, end: 0.5),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform(
            transform: Matrix4.skewX(anim.value),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: logo,
            ),
          ),
    );
  }

  Widget skew2() {
    return Animator(
      tween: Tween<double>(begin: -0.5, end: 0.5),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform(
            transform: Matrix4.skew(anim.value, anim.value),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: logo,
            ),
          ),
    );
  }

  Widget skew3() {
    return Animator(
      tween: Tween<Offset>(begin: Offset(-1, 0), end: Offset(1, 0)),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => FractionalTranslation(
            translation: anim.value,
            child: logo,
          ),
    );
  }

  Widget scaleFromCenter() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => SizedBox(
            width: anim.value * 50,
            height: anim.value * 50,
            child: logo,
          ),
    );
  }

  Widget translate1() {
    return Animator(
      tween: Tween<Offset>(begin: Offset(-50, 0), end: Offset(50, 0)),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform.translate(
            offset: anim.value,
            child: logo,
          ),
    );
  }

  // SlideTransition
  Widget translate2() {
    return Animator(
      tween: Tween<Offset>(begin: Offset(-1, 0), end: Offset(1, 0)),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => SlideTransition(
            position: anim,
            child: logo,
          ),
    );
  }

  // Transform Animation
  Widget transform1() {
    return Animator(
      tween: Tween<Offset>(begin: Offset(-50, 0), end: Offset(50, 0)),
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform(
            transform: Matrix4.translationValues(anim.value.dx, 0, 0),
            child: logo,
          ),
    );
  }

  Widget transform2() {
    return Animator(
      duration: Duration(seconds: 3),
      curve: Curves.bounceInOut,
      cycles: 0,
      builder: (anim) => Transform(
            transform: Matrix4.translationValues(anim.value * 100, 0, 0)
              ..rotateZ(anim.value * 4 * pi),
            child: logo,
          ),
    );
  }

  Widget transform3() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform(
            transform: Matrix4.translationValues(anim.value * 100, 0, 0)
              ..rotateZ(anim.value * 4 * pi),
            child: logo,
          ),
    );
  }

  Widget transform4() {
    return Animator(
      duration: Duration(seconds: 3),
      cycles: 0,
      builder: (anim) => Transform(
            transform: Matrix4.translationValues(anim.value * 100, 0, 0)
              ..rotateZ(anim.value * 4 * pi)
              ..scale(anim.value),
            child: logo,
          ),
    );
  }

  Widget opacityWithTranslation() {
    return Animator(
      tweenMap: {
        'opacity': Tween<double>(begin: 0, end: 1),
        'translation': Tween<Offset>(begin: Offset.zero, end: Offset(1, 0)),
      },
      duration: Duration(seconds: 3),
      cycles: 0,
      builderMap: (Map<String, Animation> anim) => FadeTransition(
            opacity: anim['opacity'],
            child: FractionalTranslation(
              translation: anim['translation'].value,
              child: logo,
            ),
          ),
    );
  }

  Widget opacityWithTranslationRotation() {
    return Animator(
      tweenMap: {
        'opacity': Tween<double>(begin: 0, end: 1),
        'translation': Tween<Offset>(begin: Offset.zero, end: Offset(1, 0)),
        'rotation': Tween<double>(begin: 0, end: 4 * pi),
      },
      duration: Duration(seconds: 3),
      cycles: 0,
      builderMap: (Map<String, Animation> anim) => FadeTransition(
            opacity: anim['opacity'],
            child: FractionalTranslation(
              translation: anim['translation'].value,
              child: Transform.rotate(
                angle: anim['rotation'].value,
                child: logo,
              ),
            ),
          ),
    );
  }

  Widget opacityWithTranslationRotationColor() {
    return Animator(
      tweenMap: {
        'opacity': Tween<double>(begin: 0, end: 1),
        'translation': Tween<Offset>(begin: Offset.zero, end: Offset(1, 0)),
        'rotation': Tween<double>(begin: 0, end: 4 * pi),
        'color': ColorTween(begin: Colors.blueAccent, end: Colors.redAccent)
      },
      duration: Duration(seconds: 3),
      cycles: 0,
      builderMap: (Map<String, Animation> anim) => FadeTransition(
            opacity: anim['opacity'],
            child: FractionalTranslation(
              translation: anim['translation'].value,
              child: Transform.rotate(
                angle: anim['rotation'].value * 2.0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: anim['color'].value,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: animatorOpacity(),
        ),
      ),
    );
  }
}
