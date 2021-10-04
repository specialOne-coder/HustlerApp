import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hustler/ui/pages/principal/activity/agents/agentPage.dart';
import 'package:hustler/ui/pages/principal/activity/missions/missionPage.dart';
import 'package:hustler/ui/pages/principal/activity/nothing.dart';

class Activity extends StatefulWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  int sharedValue = 0;
  static const activity = true;
  final Map<int, Widget> options = const <int, Widget>{
    0: Text(
      'Missions',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    1: Text(
      'Agents',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
    ),
  };

  final Map<int, Widget> contains = const <int, Widget>{
    0: (activity == true)
        ? Nothing()
        : SingleChildScrollView(child: MissionPage()),
    1: SingleChildScrollView(
      child: AgentPage(),
    ),
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        title: Container(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Activités',
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[100],
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            SizedBox(
              width: size.width,
              child: CupertinoSegmentedControl<int>(
                unselectedColor: Colors.grey[300],
                selectedColor: Colors.white,
                borderColor: Colors.grey[400],
                children: options,
                onValueChanged: (int val) {
                  setState(() {
                    sharedValue = val;
                  });
                },
                groupValue: sharedValue,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0.0,
                  horizontal: 0.0,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25.0,
                    //horizontal: 16.0,
                  ),
                  child: contains[sharedValue],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
