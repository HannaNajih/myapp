// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/controllers/task_controller.dart';
import 'package:myapp/src/models/user_model.dart';
import 'package:myapp/src/tab_bar.dart';
import 'package:myapp/src/widgets/custom_button.dart';
import 'package:myapp/src/widgets/custom_tfield.dart';
import 'package:myapp/src/widgets/theme.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddTaskPageState();
}

// ignore: duplicate_ignore
class _AddTaskPageState extends State<AddTaskPage> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  // ignore: prefer_final_fields
  DateTime _selectedDate = DateTime.now();
  //shewazy danany kataka hh watay sa3atakaia w m  watay daqakaia w a yakash ba waatay am yan pm yat
  final String _startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString();
  final _endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 15)))
      .toString();
  int _selectedRemaind = 5;
  List<int> remaindList = [5, 10, 15, 20];
  String _selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: _appbar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Add Task',
                style: titleTextStyle,
              ),
              //title
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: CustomTextField(
                  hint: 'Enter the title of your task',
                  title: 'title',
                  //widget: const Icon(Icons.access_alarm),
                  controller: _titleController,
                ),
              ),
              //nots
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: CustomTextField(
                  hint: 'Enter notes for your task',
                  title: 'Note',
                  // widget: const Icon(Icons.access_alarm),
                  controller: _noteController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: CustomTextField(
                  hint: DateFormat.yMd().format(_selectedDate),
                  title: 'Date',
                  widget: IconButton(
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: grayIconClr,
                    ),
                    onPressed: () {},
                  ),
                  controller: _dateController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hint: _startTime,
                        title: 'Start Time',
                        widget: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: grayIconClr,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextField(
                        hint: _endTime,
                        title: 'End Time',
                        widget: IconButton(
                          icon: const Icon(
                            Icons.access_time_rounded,
                            color: grayIconClr,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  CustomTextField(
                      hint: '$_selectedRemaind minuts early',
                      title: 'Remainder',
                      widget: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        items: remaindList
                            .map<DropdownMenuItem<String>>(
                                (int value) => DropdownMenuItem(
                                    value: value.toString(),
                                    child: Text(
                                      '$value',
                                      style: typingTextStyle,
                                    )))
                            .toList(),
                        onChanged: (String? newValue) {
                          //lera hatakw nrxaka la regay drop downakawa update bkainawa
                          //pewestman bam functiona abet
                          _selectedRemaind = int.parse(newValue!);
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: grayIconClr,
                        ),
                        iconSize: 30,
                        elevation: 4,
                        underline: Container(
                          height: 0,
                        ),
                        style: typingTextStyle,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomTextField(
                      hint: '$_selectedRemaind minuts early',
                      title: 'Remainder',
                      widget: DropdownButton(
                        borderRadius: BorderRadius.circular(5),
                        items: repeatList
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: typingTextStyle,
                                    )))
                            .toList(),
                        onChanged: (String? newValue) {
                          //lera hatakw nrxaka la regay drop downakawa update bkainawa
                          //pewestman bam functiona abet
                          _selectedRepeat = newValue!;
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: grayIconClr,
                        ),
                        iconSize: 30,
                        elevation: 4,
                        underline: Container(
                          height: 0,
                        ),
                        style: typingTextStyle,
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _colorPalette(),
                  const SizedBox(
                    height: 10,
                  ),
                  //    _colorPalette(),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: CustomButton(
                      label: 'Create task',
                      myFunc: () {
                        addTaskstoDB();
                        postDetailForFireStore();
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _colorPalette() {
    return Column(
      children: [
        Text(
          'Choose Color for your task: ',
          style: typingTextStyle,
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List<Widget>.generate(
                5,
                ((index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = index;
                        });
                      },

                      //behavior: HitTestBehavior.translucent,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: index == 0
                                ? Globgreen
                                : index == 1
                                    ? selectionGrayClor
                                    : index == 2
                                        ? Colors.red
                                        : index == 3
                                            ? Colors.pinkAccent
                                            : Colors.blueGrey,
                            child: _selectedColor == index
                                ? const Icon(
                                    Icons.done,
                                    color: backgroundpagecolor,
                                    size: 25,
                                  )
                                : null),
                      ),
                    )))),
      ],
    );
  } // ignore: dead_code, unused_element

  // ignore: unused_element
  AppBar _appbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: grayIconClr,
          size: 24,
        ),
      ),
      //am elevationa bo darkawtne appbarakaya wak away toze barz bwbetawa
      //dropshadoweke la bashe xwarwa adate

      elevation: 1,
      backgroundColor: selectionWhiteColor,
      // context.theme.backgroundColor,
      title: Text(
        'MyPlanner',
        style: myplannerAppbar,
      ),
      actions: const [
        SizedBox(
          width: 20,
        ),
        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/comment.png'),
          backgroundColor: Globgreen,
        ),
      ],
    );
  }

  Future postDetailForFireStore() async {
    FirebaseFirestore firebasefirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel usermodel = UserModel();
    if (user != null) {
      usermodel.uID = user.uid;

      await firebasefirestore
          .collection("tasks")
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

  Future<DocumentReference> addTaskstoDB() async {
    var a = await firebaseFirestore.collection('tasks').add({
      'title': _titleController,
      'nots': _noteController,
      'date': _dateController,
      'startTime': _startTime,
      'endTime': _endTime,
      'remaind': _selectedRemaind,
      'repeate': _selectedRepeat,
    });
    return a;
  }
}
