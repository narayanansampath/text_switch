library text_switch;

import 'package:flutter/material.dart';

class TextSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color textColor;
  final Gradient gradient;
  final Color borderColor;

  const TextSwitch(
      {Key key,
      this.value,
      this.onChanged,
      this.activeColor = Colors.white,
      this.inactiveColor = Colors.grey,
      this.activeText = 'On',
      this.inactiveText = 'Off',
      this.gradient,
      this.borderColor = Colors.white,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  _TextSwitchState createState() => _TextSwitchState();
}

class _TextSwitchState extends State<TextSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool value;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            performAnimation();
          },
          onHorizontalDragEnd: (update) {
            performAnimation();
          },
          child: Container(
            width: 72.0,
            height: 20.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: widget.inactiveColor,
                gradient: widget.gradient,
                border: Border.all(color: widget.borderColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 35.0,
                  height: 20.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: value ? widget.activeColor : Colors.transparent),
                  child: Text(
                    widget.activeText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: widget.textColor,
                        fontWeight: FontWeight.w900,
                        fontSize: 12.0),
                  ),
                ),
                Container(
                  width: 35.0,
                  height: 20.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: value ? Colors.transparent : widget.activeColor),
                  child: Text(widget.inactiveText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: widget.textColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 12.0)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void performAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() => value = !value);
    widget.value == false ? widget.onChanged(true) : widget.onChanged(false);
  }
}
