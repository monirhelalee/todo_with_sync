import 'package:flutter/material.dart';

class CommonButton extends StatefulWidget {
  final String? buttonTitle;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;
  final Color? buttonColor;
  const CommonButton({
    Key? key,
    this.buttonTitle,
    this.onTap,
    this.height = 50,
    this.width = 400,
    this.buttonColor = Colors.teal,
  }) : super(key: key);

  @override
  _CommonButtonState createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.teal.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 5), // changes position of shadow
            ),
          ],
          color: widget.buttonColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            widget.buttonTitle ?? '',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
