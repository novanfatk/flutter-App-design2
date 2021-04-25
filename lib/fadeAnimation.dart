import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations/controlled_animation.dart';
import 'package:simple_animations/simple_animations/multi_track_tween.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  const FadeAnimation(this.delay, this.child) : super();

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track('opacity')
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track('transleterY').add(
          Duration(milliseconds: 500), Tween(begin: 120.0, end: 0.0),
          curve: Curves.easeOut)
    ]);
    return ControlledAnimation(
        delay: Duration(milliseconds: (500 * delay.round())),
        duration: tween.duration,
        tween: tween,
        child: child,
        builderWithChild: (context, child, animation) => Opacity(
              opacity: animation['opacity'],
              child: Transform.translate(
                offset: Offset(0, animation['transleterY']),
              ),
            ));
  }
}