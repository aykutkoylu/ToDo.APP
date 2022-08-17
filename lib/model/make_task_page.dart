import 'package:challange_app/classes/tasks.dart';
import 'package:challange_app/model/home_page.dart';
import 'package:challange_app/tasks_properties.dart';
import 'package:challange_app/tasks_properties_spare.dart';
import 'package:challange_app/widgets/Icons.widget.dart';
import 'package:challange_app/widgets/Text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:date_time_picker/date_time_picker.dart';

class MakeTaskPage extends StatefulWidget {
  const MakeTaskPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MakeTaskPage> createState() => _MakeTaskPageState();
}

class _MakeTaskPageState extends State<MakeTaskPage> {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  bool containerColor = false;
  int selectedIndex = -1;
  String? dateTime;

  @override
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
            padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16, right: 24),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  InkWell(
                    child: Image.asset(
                      'images/arrow.png',
                      height: 20,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 16),
                  Text('NEW TASK',
                      style: GoogleFonts.baloo2(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      )),
                ],
              ),
              SizedBox(height: 24),
              Textt(
                name: 'Icon',
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  for (int i = 1; i < 7; i++)
                    IconsWidget(
                        image: 'images/icon${i}.png',
                        onPressed: () {
                          selectedIndex = i;
                          setState(() {});
                        },
                        pressedColor:
                            selectedIndex == i ? Color.fromRGBO(255, 255, 255, 0.4) : Color.fromRGBO(255, 255, 255, 1)),
                ],
              ),
              SizedBox(height: 24),
              Textt(
                name: 'Name',
              ),
              TextField(
                controller: name,
                maxLength: 40,
                cursorColor: Colors.purpleAccent,
                decoration: InputDecoration(
                  counterText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.solid, color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.purpleAccent),
                  ),
                ),
              ),
              SizedBox(height: 32),
              Textt(
                name: 'Description',
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 154,
                decoration: BoxDecoration(
                    border: Border.all(color: containerColor ? Colors.blue : Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Focus(
                      child: TextFormField(
                        cursorColor: Colors.purpleAccent,
                        expands: true,
                        maxLength: 240,
                        maxLines: null,
                        minLines: null,
                        controller: description,
                        decoration: InputDecoration.collapsed(
                          hintText: '',
                        ),
                      ),
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          containerColor = true;
                          setState(() {});
                        } else {
                          containerColor = false;

                          setState(() {});
                        }
                      }),
                ),
              ),
              SizedBox(height: 24),
              Textt(name: 'Date'),
              DateTimePicker(
                type: DateTimePickerType.dateTimeSeparate,
                dateMask: 'd MMM, yyyy',
                initialValue: DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                icon: Icon(
                  Icons.event,
                ),
                dateLabelText: 'Date',
                timeLabelText: "Hour",
                selectableDayPredicate: (date) {
                  // Disable weekend days to select from the calendar
                  if (date.weekday == 6 || date.weekday == 7) {
                    return false;
                  }

                  return true;
                },
                onChanged: (val) {
                  print('$val');
                  dateTime = val;
                  print('4 $dateTime');
                },
                validator: (val) {
                  print(val);

                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 22),
              InkWell(
                  child: Container(
                    height: 48,
                    width: 104,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        gradient: LinearGradient(colors: [
                          Color(0xff2147E2),
                          Color(0xff00DCFA),
                        ])),
                    alignment: Alignment.center,
                    child: Text(
                      'ADD',
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                  onTap: () {
                    print(dateTime);
                    if (name.text.isNotEmpty && selectedIndex != -1 && dateTime!.isNotEmpty) {
                      tasksProperties
                          .add(Tasks('images/icon${selectedIndex}.png', description.text, name.text, '$dateTime'));

                      selectedIndex = -1;
                      Navigator.pop(context);
                    }
                  }),
            ]),
          ),
        ),
      ),
    );
  }
}
