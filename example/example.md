import 'package:flutter/material.dart';
import 'package:text_gradient/text_gradient.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(title: 'Gradient Text Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gradient gradient = const LinearGradient(
      colors: [Colors.deepPurple, Colors.deepOrange, Colors.pink]);
  bool shadow = false;
  bool small = false;
  bool bold = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextGradient(
                      data: 'Linear Gradient',
                      gradient: gradient,
                      style: TextStyle(
                          fontSize: (small) ? 14 : 42,
                          shadows: (shadow)
                              ? [
                                  const Shadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 3),
                                      blurRadius: 3)
                                ]
                              : null,
                          fontWeight:
                              (bold) ? FontWeight.bold : FontWeight.normal),
                    ),
                  )),
              CheckboxListTile(
                  title: const Text("Shadow"),
                  value: shadow,
                  onChanged: (isOn) {
                    debugPrint("OnChanged");
                    setState(() {
                      shadow = isOn!;
                    });
                  }),
              CheckboxListTile(
                  title: const Text("Bold"),
                  value: bold,
                  onChanged: (isOn) {
                    debugPrint("OnChanged");
                    setState(() {
                      bold = isOn!;
                    });
                  }),
              CheckboxListTile(
                  title: const Text("Small"),
                  value: small,
                  onChanged: (isOn) {
                    debugPrint("OnChanged");
                    setState(() {
                      small = isOn!;
                    });
                  }),
              Wrap(
                spacing: 10,
                alignment: WrapAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: const Text("Linear Gradient",
                        style: const TextStyle(color: Colors.white)),
                    color: Colors.purple,
                    onPressed: () {
                      setState(() {
                        gradient = const LinearGradient(colors: [
                          Colors.deepPurple,
                          Colors.deepOrange,
                          Colors.pink
                        ]);
                      });
                    },
                  ),
                  RaisedButton(
                    child: const Text("Radial Gradient",
                        style: const TextStyle(color: Colors.white)),
                    color: Colors.pink,
                    onPressed: () {
                      setState(() {
                        gradient = const RadialGradient(colors: [
                          Colors.deepPurple,
                          Colors.deepOrange,
                          Colors.pink
                        ]);
                      });
                    },
                  ),
                  RaisedButton(
                    child: const Text("Sweep Gradient",
                        style: const TextStyle(color: Colors.white)),
                    color: Colors.deepOrange,
                    onPressed: () {
                      setState(() {
                        gradient = const SweepGradient(colors: [
                          Colors.deepPurple,
                          Colors.deepOrange,
                          Colors.pink
                        ]);
                      });
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
