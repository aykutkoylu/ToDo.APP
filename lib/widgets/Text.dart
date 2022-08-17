import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Textt extends StatelessWidget {
  final String name;
  const Textt({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name,
            style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 16, color: Colors.grey),
            )),
      ],
    );
  }
}
