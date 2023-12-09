import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print(
      _mybox.get(1),
    );

    super.initState();
  }

  String text = '';

  // refrence our box
  final _mybox = Hive.box('mybox');

  // write data
  void writeData() {
    _mybox.put(1, 'MMDREZA');

    text = _mybox.get(1).toString();
    setState(() {});
  }

  // read data
  void readData() {
    print(
      _mybox.get(1),
    );

    if (_mybox.get(1) == null) {
      text = "didn't find anything";
      print("didn't find anything");
    } else {
      text = _mybox.get(1).toString();
      print(
        _mybox.get(1),
      );
    }
    setState(() {});
  }

  // delete data
  void deleteData() {
    _mybox.delete(1);

    if (_mybox.get(1) == null) {
      text = "didn't find anything";
      print("didn't find anything");
    } else {
      text = _mybox.get(1).toString();
      print(
        _mybox.get(1),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 48),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: writeData,
                  color: Colors.blue[300],
                  child: const Text('Write'),
                ),
                MaterialButton(
                  onPressed: readData,
                  color: Colors.green[300],
                  child: const Text('Read'),
                ),
                MaterialButton(
                  onPressed: deleteData,
                  color: Colors.red[300],
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    text = 'MMDREZA';
    super.dispose();
  }
}
