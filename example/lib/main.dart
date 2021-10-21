import 'package:flutter/material.dart';
import 'package:text_switch/text_switch.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool isActive = false;
  bool isIconSwitchActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Switch Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              child: TextSwitch(
                activeText: 'ON',
                inactiveText: 'OFF',
                value: isActive,
                onChanged: (val) {
                  print('Value: $val');
                  setState(() => isActive = val);
                },
                activeColor: Colors.white,
                borderColor: Colors.black,
                // you can either pass inactiveColor or gradient for inactive text
                inactiveColor: Colors.green,
                // if both inactiveColor and gradient are passed then gradient will take precedence
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text('Value : $isActive', style: TextStyle(fontSize: 24.0)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              child: TextSwitch(
                activeText: 'ON',
                inactiveText: 'OFF',
                value: isIconSwitchActive,
                onChanged: (val) {
                  print('Value: $val');
                  setState(() => isIconSwitchActive = val);
                },
                leadingActiveWidget: Icon(Icons.lightbulb, color: Colors.black),
                leadingInactiveWidget: Icon(Icons.lightbulb_outline, color: Colors.black),
                height: 70,
                activeTextSubtitle: 'Active subtitle',
                inActiveTextSubtitle: 'Inactive subtitle',
                activeColor: Colors.white,
                borderColor: Colors.black,
                // you can either pass inactiveColor or gradient for inactive text
                inactiveColor: Colors.yellow,
              ),
            ),
            Text('Value : $isIconSwitchActive', style: TextStyle(fontSize: 24.0)),
          ],
        ),
      ),
    );
  }
}
