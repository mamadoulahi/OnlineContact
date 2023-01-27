import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final double? width_container;
  final double? height_container;
  final Color? foreground_color;
  final Color? background_color;
  final String? text_button;
  final double? text_size;
  final VoidCallback? onpressed;

  const Button({Key? key,
    this.width_container,
    this.height_container,
    this.foreground_color,
    this.background_color,
    this.text_button,
    this.text_size,
    this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width_container,
      height: height_container,
      child: ElevatedButton(
          style:ElevatedButton.styleFrom(
            foregroundColor: foreground_color,
            backgroundColor: background_color,
          ) ,
          onPressed:onpressed,
          child: Text("$text_button",style: TextStyle(fontSize: text_size),)),
    );
  }
}
