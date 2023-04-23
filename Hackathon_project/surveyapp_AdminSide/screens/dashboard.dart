import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Survey Analytics',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatistic('Responses', '500'),
                _buildStatistic('Completion Rate', '80%'),
                _buildStatistic('Avg. Response Time', '5m'),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Recent Surveys',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildSurveyTile('Survey 1', '2 hours ago', '80%'),
            _buildSurveyTile('Survey 2', '1 day ago', '70%'),
            _buildSurveyTile('Survey 3', '3 days ago', '90%'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatistic(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildSurveyTile(String name, String date, String completionRate) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text('Completed $completionRate | $date'),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
