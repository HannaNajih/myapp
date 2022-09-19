import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:myapp/src/controllers/task_controller.dart';
import 'package:myapp/src/models/task.dart';
// import 'package:myapp/src/services/notification_sevices.dart';
// import 'package:myapp/src/services/theme_service.dart';
import 'package:myapp/src/widgets/task_tile.dart';
import 'package:myapp/src/widgets/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // final NotifyHelper notifyHelper = NotifyHelper();
  // ignore: prefer_final_fields
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  TaskController _taskController = TaskController();
  @override
  void initState() {
    super.initState();

    // notifyHelper.requestIOSPermission();
    // //android pewesty ba dawakrdne permission nia boia hich configurationy nawet
    // notifyHelper.initializeNotifications();
  }

  DateTime _selectedDate = DateTime.now();
  //final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    //  NotifyHelper().initializeNotifications();
    return GetMaterialApp(
      home: Scaffold(
        // appBar: _appbar(),
        body: Column(
          children: [
            //lera butoni add krdny taskaka w barwar w rozhakai tedaya
            Row(
              children: [
                _addTaskBar(),
                const SizedBox(
                  width: 10,
                ),

                // Container(
                //   padding: EdgeInsets.all(9),
                //   child: Builder(
                //     builder: (context) => Center(
                //       child: TextButton(
                //         child: const Icon(Icons.add),
                //         onPressed: () => Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => const AddTaskPage()),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),

            //lam widgetashyanda barwakai halldabzheren
            _addDateBar(),
            //lerash taskakanman pshan adat agar habn,agar nabn
            ////containereky batal lagal nusenek ka pet ale task drwst bka
            _showTasks(),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
  AppBar _appbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          //  ThemeService().switchTheme();
          Get.back();
        },
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
          //backgroundImage: AssetImage('assets/comment.png'),
          backgroundColor: Globgreen,
        ),
      ],
    );
  }

  _addTaskBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat.yMMMMd().format(DateTime.now()),
                  style: typingTextStyle,
                ),
                Text(
                  'Today',
                  style: typingTextStyle,
                )
              ]),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
              bottom: 10,
            ),
            child: Text('Add Task'),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            child: TextButton(
              onPressed: () async {
                //       // await Get.to(const AddTaskPage());
                //       // _taskController.getTasks();
                // NotifyHelper().displayNotification(
                //     title: 'task added',
                //     body: 'this is body for your notification');
                //       // NotifyHelper().scheduleNotification();
                //       // debugPrint('hello');
              },
              child: const Icon(
                Icons.add,
                color: grayIconClr,
              ),
            ),
          )
        ],
      ),
    );
  }

  _addDateBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 6),
      child: DatePicker(
        _selectedDate,
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        dayTextStyle: GoogleFonts.nunitoSans(
          fontSize: 10,
          color: grayHintTxt,
        ),
        monthTextStyle: GoogleFonts.nunitoSans(
          fontSize: 10,
          color: grayHintTxt,
        ),
        dateTextStyle: GoogleFonts.nunitoSans(
          fontSize: 20,
          color: grayHintTxt,
        ),
        selectionColor: dateSlctGreen,
        selectedTextColor: selectionWhiteColor,
        onDateChange: (newDate) {
          setState(() {
            _selectedDate = newDate;
          });
        },
      ),
    );
  }

  _showTasks() {
    // return Expanded(
    //   child: ListView.builder(
    //     itemBuilder: ((context, index) {
    //       var task = _taskController.taskList[index];
    //       return GestureDetector(
    //         onTap: () {
    //           showBottomSheet(context, task);
    //         },
    //         child: Container(
    //           margin: const EdgeInsets.all(10),
    //           child: TaskTile(task),
    //         ),
    //       );
    //     }),
    //     itemCount: _taskController.taskList.length,
    //   ),
    // );
    return Container(
      padding: const EdgeInsets.all(2),
      child: FutureBuilder<DocumentSnapshot>(
          future: readTheSingleDocument(),
          builder: (envan, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.data == null || !snapshot.hasData) {
              return const Text('empty');
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            Map<String, dynamic> name =
                snapshot.data!.data() as Map<String, dynamic>;

            return Text(name.values.first);
          }),
    );
    // Expanded(
    //     child: GestureDetector(
    //   onTap: () {
    //     showBottomSheet(
    //         context,
    //         Task(
    //             title: 'Title 1',
    //             note: 'this is note',
    //             color: 0,
    //             isComplete: 0,
    //             startTime: '01:13',
    //             endTime: '01:30'));
    //   },
    //   child: Container(
    //     margin: EdgeInsets.all(10),
    //     child: TaskTile(Task(
    //         title: 'Title 1',
    //         note: 'this is note',
    //         color: 2,
    //         isComplete: 0,
    //         startTime: '01:13',
    //         endTime: '01:30')),
    //   ),
    // ));
    // Obx(() {
    //ama hi naw if akaia
    //_taskController.taskList.isEmpty
    // if (true) {
    //   return _noTaskMsg();
    // }
    // else {
    //   return Container(
    //     height: 0,
    //   );
    // }
    // }));
  }

  Future<DocumentSnapshot> readTheSingleDocument() async {
    // ignore: no_leading_underscores_for_local_identifiers
    DocumentSnapshot _doc =
        await _firebaseFirestore.doc("tasks/z9pRGxqWbW5GLKVHrNf0").get();
    return _doc;
  }

  /////////////////////////////////
  Future<QuerySnapshot<Map<String, dynamic>>> getDataOnceUsingFuture() async {
    return await _firebaseFirestore.collection('tasks').get();
  }

  // ignore: unused_element
  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          child: SingleChildScrollView(
              child: Wrap(
            alignment: WrapAlignment.center,
            // crossAxisAlignment: WrapCrossAlignment.center,
            // direction: SizeConfig.orientation == Orientation.landscape
            //     ? Axis.horizontal
            //     : Axis.vertical,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //pewesta hsabe boshayakan bkain la katekda
              //appakaman ba bary pany w drezhe bakar yatbam shewaya
              // SizeConfig.orientation == Orientation.landscape
              //     ? const SizedBox(
              //         height: 6,
              //       )
              //     : const SizedBox(
              //         height: 220,
              //       ),
              const SizedBox(
                height: 20,
              ),
              // SvgPicture.asset(
              //   'assets/task.svg',
              //   color: Globgreen.withOpacity(0.5),
              //   height: 80,
              //   semanticsLabel: 'Task',
              // ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text(
                  'You Don\'t have any tasks yet!\n  to make your day more productive try to add some important tasks! ',
                  style: typingTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
        )
      ],
    );
  }

  showBottomSheet(BuildContext context, Task task) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 4),
        width: 200,
        height: 300,
        color: Colors.white,
        child: Column(
          children: [
            Flexible(
                child: Container(
              padding: const EdgeInsets.only(top: 4),
              height: 6,
              width: 120,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.black),
                  borderRadius: BorderRadius.circular(10)),
            )),
            const SizedBox(
              height: 20,
            ),
            task.isComplete == 1
                ? Container()
                : _builtBottomSheet(
                    label: 'task completed',
                    onTapP: () {
                      Get.back();
                    },
                    clr: Globgreen),
            _builtBottomSheet(
                label: 'Cancel Task',
                onTapP: () {
                  Get.back();
                },
                clr: Globgreen),
            const Divider(
              color: Colors.grey,
            ),
            _builtBottomSheet(
                label: 'Delete Task',
                onTapP: () {
                  Get.back();
                },
                clr: Globgreen),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  _builtBottomSheet(
      {required String label,
      required Function() onTapP,
      required Color clr,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTapP,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4,
        ),
        height: 65,
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: isClose
                ? typingTextStyle
                :
                //kate ka tyleki dyary krawman haya amanawe yakek la propertyakani bgoryn
                //copyWith bakar ahenen
                typingTextStyle.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
