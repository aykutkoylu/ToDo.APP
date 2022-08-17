import 'package:flutter/material.dart';

class IconsWidget extends StatelessWidget {
  final String image;
  final Function onPressed;
  final Color pressedColor;
  const IconsWidget({
    Key? key,
    required this.image,
    required this.onPressed,
    required this.pressedColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Image.asset(image, width: 42, height: 42, color: pressedColor, colorBlendMode: BlendMode.modulate),
          onTap: () {
            onPressed.call();
          },
        ),
        SizedBox(width: 12),
      ],
    );
  }
}
