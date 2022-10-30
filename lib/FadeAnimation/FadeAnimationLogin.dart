import 'package:flutter/material.dart';
import 'Button.dart';

class FadeAnimationLogin extends StatefulWidget {
  const FadeAnimationLogin({Key? key}) : super(key: key);

  @override
  _FadeAnimationLoginState createState() => _FadeAnimationLoginState();
}

class _FadeAnimationLoginState extends State<FadeAnimationLogin>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _FadeAnimationState extends State<FadeAnimationLogin> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.orangeAccent,
            ),
          ),
          SizedBox(height: 40),
          BorderedButton(
              text: "Show/Hide",
              onPress: () {
                setState(() {
                  _visible = !_visible;
                });
              })
        ],
      ),
    );
  }
}
