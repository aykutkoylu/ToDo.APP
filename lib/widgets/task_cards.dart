import 'package:challange_app/classes/tasks.dart';
import 'package:flutter/material.dart';

class TaskCards extends StatefulWidget {
  bool isDone;
  final Function checked;
  final Tasks tasks;
  TaskCards({
    Key? key,
    required this.isDone,
    required this.checked,
    required this.tasks,
  }) : super(key: key);

  @override
  State<TaskCards> createState() => _TaskCardsState();
}

class _TaskCardsState extends State<TaskCards> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            contentPadding: EdgeInsets.fromLTRB(0, 16, 0, 24),
            backgroundColor: Colors.grey[100],
            title: Column(
              children: [
                Image.asset(
                  widget.tasks.image,
                  height: 48,
                ),
                SizedBox(height: 16),
                Text(
                  widget.tasks.event,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.tasks.date,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            content: Container(
                height: 216,
                width: double.infinity,
                color: Colors.white,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    widget.tasks.info,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ))),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: Center(
                  child: Container(
                    height: 48,
                    width: 112,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        gradient: LinearGradient(colors: [
                          Color(0xff2147E2),
                          Color(0xff00DCFA),
                        ])),
                    alignment: Alignment.center,
                    child: Text(
                      'DONE',
                      style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            widget.tasks.event,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          leading: Image.asset(
            widget.tasks.image,
            height: 40,
          ),
          trailing: InkWell(
            onTap: () {
              widget.checked.call();
            },
            child: Material(
              shadowColor: Colors.purple,
              elevation: 1,
              child: Container(
                child: widget.isDone
                    ? Image.asset(
                        'images/tick.png',
                        scale: 12,
                      )
                    : SizedBox(),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade500),
                    borderRadius: BorderRadius.all(Radius.circular(4))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
