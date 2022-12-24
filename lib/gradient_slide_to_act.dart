library gradient_slide_to_act;

import 'package:flutter/material.dart';

class GradientSlideToAct extends StatefulWidget {
  ///  the width of the SlidableButton
  final double width;

  ///  the height of the SlidableButton
  final double height;

  ///  the size of the draggable icon
  final double iconSize;

  /// the borderRAdius of the SlidableButton
  final double borderRadius;

  /// the text shown in the SlidableButton
  final String text;

  /// the style of the text shown in the SlidableButton
  final TextStyle? textStyle;

  /// the icon of the sliderButtonIcon [ wich the user drag]
  final IconData? sliderButtonIcon;

  /// the duration of the animation when the user slide the button
  final Duration animationDuration;

  /// this function will called when the user slide the button
  final VoidCallback onSubmit;

  /// the gradient of the submitted par of the container
  final Gradient? gradient;

  /// the background color of the button
  final Color backgroundColor;

  /// the icon when the user submit
  final IconData? submittedIcon;

  /// the  draggable icon of the SlidableButton
  final IconData dragableIcon;

  /// the background of the  draggable icon of the SlidableButton
  final Color? dragableIconBackgroundColor;

  /// you can also add your costom  draggable widget
  final Widget? draggableWidget;

  GradientSlideToAct(
      {Key? key,
        required this.onSubmit,
        this.width = 300,
        this.height = 52,
        this.iconSize = 22,
        this.borderRadius = 52,
        this.text = "Slide to Confirm",
        this.textStyle,
        this.dragableIconBackgroundColor,
        this.submittedIcon,
        this.draggableWidget,
        this.dragableIcon = Icons.arrow_forward_ios,
        this.sliderButtonIcon,
        this.animationDuration = const Duration(milliseconds: 300),
        this.gradient,
        required this.backgroundColor})
      : assert(width != double.infinity, "width should not be equal infinity"),
        assert(iconSize <= height,
        "the size of the icon {iconSize} should be < height"),
        super(key: key);

  @override
  State<GradientSlideToAct> createState() =>
      _GradientSlideToActState();
}

class _GradientSlideToActState extends State<GradientSlideToAct>
    with SingleTickerProviderStateMixin {
  /// default Values

  double _position = 0;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    double position_percent = _position / (widget.width - 2 * widget.height);
    return AnimatedContainer(
      duration: widget.animationDuration,
      height: widget.height,
      width: _submitted ? widget.height : widget.width,
      decoration: BoxDecoration(
          color: widget.backgroundColor, // 0Xff172663
          borderRadius: BorderRadius.circular(widget.borderRadius),
          gradient: !_submitted ? null : widget.gradient),
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(52),
        child: _submitted
            ? Icon(widget.submittedIcon ?? Icons.done)
            : Stack(
          children: [
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 70),
                      height: widget.height,
                      width: _position + widget.height,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(52),
                          gradient: widget.gradient),
                    ),
                  ],
                )),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Opacity(
                  opacity:
                  1 - (position_percent > 1 ? 1 : position_percent),
                  child: Center(
                    child: Text(widget.text,
                        style: widget.textStyle ??
                            const TextStyle(
                                color: Colors.white, fontSize: 15)),
                  ),
                )),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: Row(
                children: [
                  GestureDetector(
                    onPanUpdate: (details) async {
                      _position += details.delta.dx;
                      if (_position < 0) {
                        _position = 0;
                        setState(() {});
                      } else if (_position >=
                          (widget.width - widget.height - 20)) {
                        _position = widget.width - widget.height;
                        if (!_submitted) {
                          _submitted = true;
                          setState(() {});
                          Duration _dur =
                              const Duration(milliseconds: 200) +
                                  (widget.animationDuration);
                          await Future.delayed(_dur);
                          if (mounted) widget.onSubmit();
                          return;
                        }
                        _submitted = true;
                        setState(() {});
                      }
                      setState(() {});
                    },
                    onPanEnd: (_) {
                      position_percent = 0;
                      _position = 0;
                      setState(() {});
                    },
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 70),
                      padding: EdgeInsets.only(left: _position),
                      child: widget.draggableWidget ??
                          _draggableWidget(
                            iconSize: widget.height,
                            gradient: widget.gradient,
                            dragableIconBackground:
                            widget.dragableIconBackgroundColor,
                            dragableIcon: widget.dragableIcon,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _draggableWidget extends StatelessWidget {
  final double iconSize;
  final Gradient? gradient;
  final Color? dragableIconBackground;
  final IconData dragableIcon;

  const _draggableWidget(
      {Key? key,
        required this.iconSize,
        this.gradient,
        this.dragableIconBackground,
        required this.dragableIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: iconSize,
      width: iconSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(52),
          color: dragableIconBackground,
          gradient: dragableIconBackground != null ? null : gradient),
      alignment: Alignment.center,
      child:  Icon(dragableIcon),
    );
  }
}
