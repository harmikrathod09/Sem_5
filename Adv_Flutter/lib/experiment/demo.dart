import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(BloodGroupApp());
}

class BloodGroupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Groups',
      home: BloodGroupList(),
    );
  }
}

class BloodGroup {
  final String group;
  final String description;

  BloodGroup({required this.group, required this.description});

  factory BloodGroup.fromJson(Map<String, dynamic> json) {
    return BloodGroup(
      group: json['group'],
      description: json['description'] ?? '',
    );
  }
}

class BloodGroupList extends StatefulWidget {
  @override
  _BloodGroupListState createState() => _BloodGroupListState();
}

class _BloodGroupListState extends State<BloodGroupList> {
  late Future<List<BloodGroup>> _bloodGroups;

  @override
  void initState() {
    super.initState();
    _bloodGroups = fetchBloodGroups();
  }

  Future<List<BloodGroup>> fetchBloodGroups() async {
    final response = await http.get(
      Uri.parse('http://localhost:3000/api/blood-groups'), // 👈 Replace with your public URL if needed
    );

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);
      return jsonData.map((e) => BloodGroup.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load blood groups');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Blood Groups')),
      body: FutureBuilder<List<BloodGroup>>(
        future: _bloodGroups,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No blood groups found.'));
          }

          final groups = snapshot.data!;
          return ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              final group = groups[index];
              return ListTile(
                title: Text(group.group),
                subtitle: Text(group.description),
              );
            },
          );
        },
      ),
    );
  }
}
