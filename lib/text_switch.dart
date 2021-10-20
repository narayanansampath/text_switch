library text_switch;

import 'package:flutter/material.dart';

class TextSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color textColor;
  final Gradient? gradient;
  final Color borderColor;
  final String? activeTextSubtitle;
  final String? inActiveTextSubtitle;
  final Widget? leadingActiveWidget;
  final Widget? leadingInactiveWidget;
  final double? height;

  const TextSwitch(
      {Key? key,
      required this.value,
      this.onChanged,
      this.activeColor = Colors.white,
      this.inactiveColor = Colors.grey,
      this.activeText = 'On',
      this.inactiveText = 'Off',
      this.gradient,
      this.activeTextSubtitle,
      this.inActiveTextSubtitle,
      this.leadingActiveWidget,
      this.leadingInactiveWidget,
      this.borderColor = Colors.white,
      this.height = 20,
      this.textColor = Colors.black})
      : super(key: key);

  @override
  _TextSwitchState createState() => _TextSwitchState();
}

class _TextSwitchState extends State<TextSwitch>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late bool value;

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
          onTap: performAnimation,
          onHorizontalDragEnd: (update) {
            performAnimation();
          },
          child: Container(
            width: double.infinity,
            height: widget.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: widget.inactiveColor,
                gradient: widget.gradient,
                border: Border.all(color: widget.borderColor)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                    ),
                    child: Container(
                      height: widget.height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: value ? widget.activeColor : Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(widget.leadingActiveWidget != null)
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: widget.leadingActiveWidget!
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.activeText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: widget.textColor,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 12.0),
                              ),
                              if(widget.activeTextSubtitle != null)
                                Text(widget.activeTextSubtitle!,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                      color: Colors.grey.shade600,
                                    )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      height: widget.height,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: value ? Colors.transparent : widget.activeColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if(widget.leadingActiveWidget != null)
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey.shade500),
                            ),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: widget.leadingInactiveWidget!
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(widget.inactiveText,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: widget.textColor,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 12.0)),
                    if(widget.inActiveTextSubtitle != null)
                Text(widget.inActiveTextSubtitle!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(
                      color: Colors.grey.shade600,
                    )),

                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
    final ValueChanged<bool>? onChanged = widget.onChanged;
    if (onChanged != null) {
      widget.value == false ? onChanged(true) : onChanged(false);
    }
  }
}
