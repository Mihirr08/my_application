import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ClickAbleCard extends StatefulWidget {
  ClickAbleCard(
      {required this.onTap,
      required this.changeColor,
      required this.child,
      required this.initialColor,
      Key? key})
      : super(key: key);
  Color initialColor;
  Color changeColor;
  Widget child;
  Function onTap;

  @override
  State<ClickAbleCard> createState() => _ClickAbleCardState();
}

class _ClickAbleCardState extends State<ClickAbleCard> {
  bool selected = false;
  late Color currentColor;

  @override
  void initState() {
    currentColor = widget.initialColor;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('Clickable build called');
    return GestureDetector(
      onTap: () {
        print('Tapped');
        setState(() {
          selected = !selected;
          if (selected) {
            currentColor = widget.changeColor;
          } else {
            currentColor = widget.initialColor;
          }
        });
        widget.onTap;
      },
      child: Card(
        color: currentColor,
        child: widget.child,
      ),
    );
  }
}
