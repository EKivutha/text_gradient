// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:text_gradient/text_gradient.dart';

void main() {
  test('font size is carried to text widget', () {
    const gradientText = TextGradient(
      gradient: LinearGradient(colors: [Colors.red, Colors.black]),
      style: TextStyle(fontSize: 42),
      data: 'this is a test',
    );
    expect(gradientText.style.fontSize, 42);
  });
}
