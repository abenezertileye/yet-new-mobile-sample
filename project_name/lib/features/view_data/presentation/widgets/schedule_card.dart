import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final schedule; // This should be the schedule object passed to the widget

  ScheduleCard({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 5.0,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(
          schedule.scheduleName,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          schedule.date.toString(),
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.blueAccent),
        onTap: () {
          // Show the dialog when the ListTile is tapped
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Schedule Details"),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: <Widget>[
                      Text("Schedule Name: ${schedule.scheduleName}"),
                      Text("Date: ${schedule.date}"),
                      Text("Bus plate#: ${schedule.bus['plateNumber']}"),
                      Text("Driver: ${schedule.driver['first_name'] } ${schedule.driver['last_name'] }"),
                      Text("Helper: ${schedule.helper['first_name'] } ${schedule.helper['last_name'] }"),
                      Text("Route: ${schedule.route['route']}"),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
