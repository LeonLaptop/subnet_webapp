import 'package:flutter/material.dart';
import 'package:subnet_webapp/assets/styles.dart';

class OnHoverWidget extends StatefulWidget {
  final Widget child;

  const OnHoverWidget({Key? key, required this.child}) : super(key: key);

  @override
  _OnHoverWidgetState createState() => _OnHoverWidgetState();
}

class _OnHoverWidgetState extends State<OnHoverWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => onEntered(true),
      onExit: (event) => onEntered(false),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          color: isHovered ? darkGold : buttonColor,
        ),
        duration: Duration(milliseconds: 100),
        child: widget.child,
      ),
    );
  }

  void onEntered(bool isHovered) => setState(() {
        this.isHovered = isHovered;
      });
}
