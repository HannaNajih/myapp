import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/src/auth_screens/signin.dart';
import 'package:myapp/src/models/user_model.dart';
import 'package:myapp/src/services/auth_service.dart';
import 'package:myapp/src/services/firestore_service.dart';
import 'package:myapp/src/tab_bar.dart';
import 'package:myapp/src/widgets/custom_button.dart';
import 'package:myapp/src/widgets/custom_tfield.dart';
import 'package:myapp/src/widgets/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  AuthService authService = AuthService();
  FireStoreService fireStoreService = FireStoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool isLoading = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          child: TextFormField(
            autofocus: false,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (value!.isEmpty) {
                return ("Please Enter Your Email");
              }
              // reg expression for email validation
              if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return ("Please Enter a valid email");
              }
              return null;
            },
            controller: emailController,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                labelStyle: TextStyle(
                  fontFamily: "english",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          child: TextFormField(
            autofocus: false,
            textInputAction: TextInputAction.next,
            validator: (value) {
              RegExp regex = new RegExp(r'^.{5,}$');
              if (value!.isEmpty) {
                return ("Name cannot be Empty");
              }
              if (!regex.hasMatch(value)) {
                return ("Enter Valid name(Min. 5 Character)");
              }
              return null;
            },
            controller: nameController,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.person),
                labelText: "Full name",
                labelStyle: TextStyle(
                  fontFamily: "english",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          child: TextFormField(
            autofocus: false,
            textInputAction: TextInputAction.next,
            validator: (value) {
              RegExp regex =
                  new RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
              if (value!.isEmpty) {
                return ("Password is required for login");
              }
              if (!regex.hasMatch(value)) {
                return ("Password should contain Capital, small letter & Number & Special");
              }
            },
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.vpn_key),
                labelText: "Password",
                labelStyle: TextStyle(
                  fontFamily: "english",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          child: TextFormField(
            autofocus: false,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (repasswordController.text != passwordController.text) {
                return "Password don't match";
              }
              return null;
            },
            obscureText: true,
            controller: repasswordController,
            decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.never,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Icon(Icons.vpn_key),
                labelText: "Re-Password",
                labelStyle: TextStyle(
                  fontFamily: "english",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 42,
          width: 210,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0),
              ),
            ),
            onPressed: () {
              _signUp(emailController.text.trim(), passwordController.text,
                  dynamic);
              postDetailForFireStore();
            },
            child: Text("Create",
                style: TextStyle(
                  fontFamily: "english",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Alredy have a account",
                style: TextStyle(
                  fontFamily: "english",
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                )),
            Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text(" Login",
                    style: TextStyle(
                      fontFamily: "english",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),
              );
            }),
          ],
        )
      ],
    )));
  }

  // ignore: non_constant_identifier_names
  void _signUp(String email, String password, Context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailForFireStore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
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
      }
    }
  }

  Future postDetailForFireStore() async {
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel usermodel = UserModel();
    if (user != null) {
      usermodel.email = user.email;
      usermodel.uID = user.uid;
      usermodel.name = nameController.text;
      usermodel.phone;
      usermodel.image;

      await firebasefirestore
          .collection("user")
          .doc(user.uid)
          .set(usermodel.toMap());
      Fluttertoast.showToast(msg: "Account created successfully");
      // Navigator.pushAndRemoveUntil(
      //     (context),
      //     MaterialPageRoute(builder: (context) => const TabBarr()),
      //     (route) => false);
      Get.to(TabBarr());
    } else {
      const Text("error");
    }
  }
  // Future _signUp() async {

  //   await authService
  //       .createUserWithEmailAndPassword(
  //           email: emailController.text.trim(),
  //           password: passwordController.text)
  //       .then((userCredential) async {
  //     //second step
  //     if (userCredential != null && userCredential.user != null) {
  //       await fireStoreService
  //           .addUserWithInitialInformationToDB(
  //               user: userCredential.user!,
  //               userName: userNameController.text,
  //               phoneNumber: phoneNumberController.text)
  //           .then((userModel) {
  //         Provider.of(context)<UserProvider>().setUserModel(userModel);
  //       });
  //     }
  //   });
  //   Get.to(() => const TabBarr());
  // }
}
