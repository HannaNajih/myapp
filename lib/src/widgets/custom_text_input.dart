import 'package:flutter/material.dart';
import 'package:myapp/src/widgets/theme.dart';

class CustomTextInput extends StatelessWidget {
  const CustomTextInput(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget})
      : super(key: key);
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 163,
      width: 343,
      child: TextFormField(
        controller: controller,
        style: typingTextStyle,
      ),
    );
    // Container(
    //   width: 200,
    //   height: 50,
    //   padding: const EdgeInsets.all(15),
    //   margin: const EdgeInsets.all(0.1),
    //   decoration: BoxDecoration(
    //     color: selectionWhiteColor,
    //     // color: Colors.red,
    //     borderRadius: BorderRadius.circular(5),
    //     border: Border.all(
    //         color: selectionGrayClor,
    //         // color: Colors.red,
    //         width: 0.0,
    //         style: BorderStyle.solid),
    //   ),
    //   child: TextFormField(),
    // );
  }
}
