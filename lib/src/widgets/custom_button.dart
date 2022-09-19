import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

//import 'theme.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.myFunc,
  }) : super(key: key);
  final String label;
  final Function() myFunc;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: 210,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        onPressed: () {
          myFunc();
        },
        // ignore: prefer_const_constructors
        child: Text("Create",
            style: const TextStyle(
              fontFamily: "english",
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ),
    );
    //  GestureDetector(
    //   onTap: myFunc,
    //   child: Container(
    //     width: 326,
    //     height: 48,
    //     //color: Globgreen,
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(4), color: Globgreen),
    //     child: Center(
    //       child: Text(
    //         label,
    //         textAlign: TextAlign.center,
    //         textDirection: TextDirection.ltr,
    //         softWrap: true,
    //         style: GoogleFonts.nunitoSans(
    //           fontStyle: FontStyle.normal,
    //           color: selectionWhiteColor,
    //           fontSize: 23,
    //           fontWeight: FontWeight.normal,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
