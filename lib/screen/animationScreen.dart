import 'package:flutter/material.dart';

import '../widgets/mainDrawer.dart';

class AnimationScreen extends StatefulWidget {
  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    _sizeAnimation =
        Tween(begin: 100.00, end: 200.00).animate(_animationController);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
        print('go reverse');
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
        print('go forward');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: const MainDrawer(),
      body: Center(
        child: AnimatedBuilder(
          animation: _sizeAnimation,
          builder: (context, child) {
            return Container(
                width: _sizeAnimation.value,
                height: _sizeAnimation.value,
                color: Colors.red,
              child: Text(_sizeAnimation.value.toString()),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_animationController.status == AnimationStatus.completed) {
            _animationController.reverse();
            print('go reverse');
          } else if (_animationController.status == AnimationStatus.dismissed) {
            _animationController.forward();
            print('go forward');
          }
        },
      ),
    );
  }
}
