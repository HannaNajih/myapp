import 'package:flutter/material.dart';

import '../widgets/theme.dart';

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 50,
              ),
              CircleAvatar(
                radius: 80,
                backgroundColor: Color.fromARGB(71, 93, 255, 52),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Globgreen,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Hanna',
              style: typingTextStyle,
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: iconCLRCA,
                child: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'My Account',
                style: typingTextStyle,
              ),
              const SizedBox(
                width: 300,
              ),
              GestureDetector(
                  onTap: () {
                    // ignore: prefer_const_constructors
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Comming Soon!"),
                    ));
                  },
                  child: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: iconCLRCA,
                child: const Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Notifications',
                style: typingTextStyle,
              ),
              const SizedBox(
                width: 300,
              ),
              GestureDetector(
                  onTap: () {
                    // ignore: prefer_const_constructors
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Comming Soon!"),
                    ));
                  },
                  child: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: iconCLRCA,
                child: const Icon(
                  Icons.privacy_tip_outlined,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Privacy And Policy',
                style: typingTextStyle,
              ),
              const SizedBox(
                width: 260,
              ),
              GestureDetector(
                  onTap: () {
                    // ignore: prefer_const_constructors
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Comming Soon!"),
                    ));
                  },
                  child: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: iconCLRCA,
                child: const Icon(
                  Icons.favorite_border_rounded,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Terms Of Use',
                style: typingTextStyle,
              ),
              const SizedBox(
                width: 290,
              ),
              GestureDetector(
                  onTap: () {
                    // ignore: prefer_const_constructors
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Comming Soon!"),
                    ));
                  },
                  child: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: iconCLRCA,
                child: const Icon(
                  Icons.logout_outlined,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Log Out',
                style: typingTextStyle,
              ),
              const SizedBox(
                width: 320,
              ),
              GestureDetector(
                  onTap: () {
                    // ignore: prefer_const_constructors
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("Comming Soon!"),
                    ));
                  },
                  child: const Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ])));
  }
}
