import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Icon(
                Icons.lock,
                size: 80.0,
                color: Colors.deepOrange,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25.0),
              child: Text(
                'กรุณาใส่รหัสผ่าน',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Column(
              children: [
                for (var i = 1; i <= 3; i++) _buildRowButton(i * 3),
                _buildLastRowButton(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () {}, child: const Text('ลืมรหัสผ่าน')),
                )
              ],
            )
          ],
        ));
  }

  Row _buildRowButton(int num) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = num - 2; i <= num; i++) _buildButton(num: i),
      ],
    );
  }

  Row _buildLastRowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(),
        _buildButton(num: 0),
        _buildButton(num: -1),
      ],
    );
  }

  Padding _buildButton({int? num}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: 75.0,
        height: 75.0,
        decoration: (num != null && num >= 0)
            ? BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.red, width: 2.0),
        )
            : null,
        child: (num == null)
            ? null
            : (num >= 0)
            ? Text(
          num.toString(),
          style: const TextStyle(fontSize: 20.0),
        )
            : const Icon(Icons.backspace_outlined),
      ),
    );
  }
}