import 'package:fancy_containers/src/utils/fancy_containers_typedef.dart';
import 'package:flutter/material.dart';

class FancyContainer extends StatefulWidget {
  FancyContainer({
    Key? key,
    this.height = 120.0,
    this.width,
    this.color1,
    this.color2,
    required this.title,
    this.textColor,
    this.subtitle,
    this.subtitleColor,
    this.onTap,
    this.padding,
    this.titleStyle,
    this.subtitleStyle,
  }) : super(key: key);

  double? width;
  double height = 120;
  Color? color1;
  Color? color2;
  String title;
  Color? textColor;
  String? subtitle;
  Color? subtitleColor;
  FancyContainersCallback? onTap;
  EdgeInsetsGeometry? padding;
  TextStyle? titleStyle;
  TextStyle? subtitleStyle;

  @override
  _FancyContainerState createState() => _FancyContainerState();
}

class _FancyContainerState extends State<FancyContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ?? () {},
      child: Container(
        width: widget.width ?? MediaQuery.of(context).size.width * 0.90,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors: [
            widget.color1 ?? const Color(0xFFCB1841),
            widget.color2 ?? const Color(0xFF2604DE)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 12,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                widget.title,
                style: widget.titleStyle ??
                    TextStyle(
                      color: widget.textColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            widget.subtitle != null
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.subtitle ?? "",
                      style: widget.subtitleStyle ??
                          TextStyle(
                            color: widget.subtitleColor,
                            fontSize: 15.0,
                          ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
