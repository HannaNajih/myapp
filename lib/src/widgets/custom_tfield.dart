import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:myplanner/widgets/size_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.title,
      required this.hint,
      this.controller,
      this.widget,
      this.validatore})
      : super(key: key);
  final String title;
  final String hint;
  // ignore: prefer_typing_uninitialized_variables
  final validatore;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        // ignore: sized_box_for_whitespace
        child: Container(
      height: 50,
      child: TextFormField(
        autofocus: false,
        textInputAction: TextInputAction.next,
        validator: validatore,
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.never,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            labelText: hint,
            // ignore: prefer_const_constructors
            labelStyle: TextStyle(
              fontFamily: "english",
              fontSize: 20,
              fontWeight: FontWeight.normal,
            )),
      ),
    ));

    //   Container(
    //       height: 100,
    //       width: 500,
    //       padding: const EdgeInsets.only(top: 8),
    //       margin: const EdgeInsets.only(left: 14),
    //       child: Expanded(
    //         child:
    //             Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    //           Text(
    //             title,
    //             style: typingTextStyle,
    //           ),
    //           Container(
    //               // height: 48,
    //               // width: 328,
    //               padding: const EdgeInsets.only(left: 14),
    //               margin: const EdgeInsets.only(top: 8),
    //               decoration: BoxDecoration(
    //                 color: selectionWhiteColor,
    //                 borderRadius: BorderRadius.circular(5),
    //                 border: Border.all(
    //                     color: selectionGrayClor,
    //                     width: 0.0,
    //                     style: BorderStyle.solid),
    //               ),
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                     child: TextField(
    //                       controller: controller,
    //                       maxLines: 1,
    //                       autofocus: false,
    //                       decoration: InputDecoration(
    //                         //prefixIcon: const Icon(Icons.done),
    //                         fillColor: selectionWhiteColor,
    //                         hintStyle: hintTextStyle,
    //                         // labelText: title,
    //                         hintText: hint,
    //                         enabledBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(
    //                                 // ignore: deprecated_member_use
    //                                 color: context.theme.backgroundColor)),
    //                         //am propertia bo awa bakar yat kate clickman la textfieldaka krd
    //                         //am gorankaryana rw bdat la borderakaida
    //                         focusedBorder: UnderlineInputBorder(
    //                             borderSide: BorderSide(
    //                                 // ignore: deprecated_member_use
    //                                 color: context.theme.backgroundColor)),
    //                       ),
    //                     ),
    //                   ),
    //                   widget ?? Container(),
    //                 ],
    //               ))
    //         ]),
    //       )),
    // );
  }
}
