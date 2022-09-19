import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:get/get.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/auth_screens/newpassword.dart';
import 'package:myapp/src/auth_screens/signup.dart';
import 'package:myapp/src/tab_bar.dart';
import 'package:myapp/src/widgets/custom_button.dart';
import 'package:myapp/src/widgets/theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? errorMessage;

  bool _isObscure = true;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 40),
                  child: Text(
                    'MyPlanner',
                    style: myplanner,
                  )),
              Container(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, bottom: 40),
                  child: Text('Sign In', style: titleTextStyle)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 5),
                      child: Text('Email',
                          textAlign: TextAlign.center, style: typingTextStyle)),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter Your Email',
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, bottom: 5),
                    child: Text('Password',
                        textAlign: TextAlign.center, style: typingTextStyle),
                  )
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 1),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, top: 0, bottom: 8),
                    child: Builder(
                      builder: (context) => TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewPassword()),
                            );
                          },
                          child: Text(
                            'Forget Pssword',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunitoSans(
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF424242),
                              fontSize: 10,
                            ),
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Builder(
                  builder: (context) => Center(
                          child: CustomButton(
                        myFunc: () async {
                          _signIn(
                              emailController.text, passwordController.text);
                        },
                        label: 'Sign in',
                      ))),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 5,
                      top: 5,
                    ),
                    padding: const EdgeInsets.only(
                        left: 115.0, right: 5.0, bottom: 5),
                    child: Text(
                      ' Don’t have an account?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.nunitoSans(
                        fontStyle: FontStyle.normal,
                        color: const Color(0xFF424242),
                        fontSize: 10,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: Text(
                      'SIGN UP',
                      style: GoogleFonts.nunitoSans(
                        fontStyle: FontStyle.normal,
                        color: Globgreen,
                        fontSize: 10,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim());
  // }

  void _signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
                  Fluttertoast.showToast(msg: "Login successful"),
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const TabBarr())),
                });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        // ignore: avoid_print
        print(error.code);
      }
    }
  }
}
