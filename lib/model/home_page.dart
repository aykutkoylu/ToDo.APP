import 'package:challange_app/model/make_task_page.dart';
import 'package:challange_app/tasks_properties.dart';
import 'package:challange_app/tasks_properties_spare.dart';
import 'package:challange_app/widgets/task_cards.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  bool showTasks = false;
  bool showDoneTasks = false;
  List<int> doneTasks = [];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 20),
            child: Column(
              children: [
                Row(children: [
                  SizedBox(width: 134),
                  Text('TODO',
                      style: GoogleFonts.baloo2(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      )),
                  Spacer(),
                  Image.asset(
                    'images/Group 13.png',
                    height: 15,
                    width: 23,
                  ),
                ]),
                Container(
                  height: 500,
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: showDoneTasks ? tasksPropertiesSpare.length : tasksProperties.length,
                    itemBuilder: (context, i) {
                      return showTasks == true
                          ? showDoneTasks
                              ? doneTasks.contains(i)
                                  ? TaskCards(isDone: true, checked: () {}, tasks: tasksProperties[i])
                                  : SizedBox()
                              : TaskCards(
                                  checked: () {
                                    if (doneTasks.contains(i)) {
                                      doneTasks.remove(i);
                                    } else
                                      doneTasks.add(i);

                                    setState(() {});
                                  },
                                  isDone: doneTasks.contains(i) ? true : false,
                                  tasks: tasksProperties[i],
                                )
                          : SizedBox();
                    },
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [Color(0xff5A3AD0), Color(0xffF80F9E)]),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        showDoneTasks = true;
                        setState(() {});
                        for (int i = 0; i < tasksProperties.length; i++) {
                          doneTasks.contains(i) && !tasksPropertiesSpare.contains(tasksProperties[i])
                              ? tasksPropertiesSpare.add(tasksProperties[0])
                              : SizedBox();
                        }
                        setState(() {});
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                            child: Image.asset(
                          'images/buttonIcon.png',
                          height: 28,
                        )),
                      ),
                      onTap: () {
                        !showDoneTasks
                            ? showTasks
                                ? showTasks = false
                                : showTasks = true
                            : showTasks = true;
                        showDoneTasks = false;
                        setState(() {});
                      },
                    ),
                    InkWell(
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [Color(0xff1765E6), Color(0xff00DCFA)]),
                            shape: BoxShape.circle),
                        child: Center(
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MakeTaskPage()))
                            .then((value) => setState(() {}));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
