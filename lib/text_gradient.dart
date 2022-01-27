library text_gradient;

import 'package:flutter/material.dart';

class TextGradient extends StatelessWidget {
  final String data;
  final Gradient gradient;
  final TextStyle style;
  final TextAlign textAlign;

  const TextGradient({
    Key? key,
    required this.data,
    required this.gradient,
    required this.style,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(Offset.zero & bounds.size);
      },
      child: Text(data,
          textAlign: textAlign, style: style.copyWith(color: Colors.white)),
    );
  }
}
