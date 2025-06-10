import 'package:flutter/material.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({super.key});

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  List<Map<String, dynamic>> users = [
    {"Name": "Harmik", "isFav": false},
    {"Name": "Abc", "isFav": false},
    {"Name": "Xyz", "isFav": false},
  ];

  void updateFavorite(int index, bool isFav) {
    setState(() {
      users[index]["isFav"] = isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Users')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]["Name"]),
            trailing: Icon(
              users[index]["isFav"] ? Icons.favorite : Icons.favorite_border,
              color: users[index]["isFav"] ? Colors.red : null,
            ),
            onTap: () {
              updateFavorite(index, !users[index]["isFav"]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (_) => FavView(
                    favUsers: users.where((user) => user["isFav"]).toList(),
                    onFavoriteChanged: (name, isFav) {
                      // find index in original list and update
                      final idx = users.indexWhere(
                        (user) => user["Name"] == name,
                      );
                      if (idx != -1) {
                        updateFavorite(idx, isFav);
                      }
                    },
                  ),
            ),
          );
        },
      ),
    );
  }
}

class FavView extends StatefulWidget {
  final List<Map<String, dynamic>> favUsers;
  final Function(String name, bool isFav) onFavoriteChanged;

  const FavView({
    super.key,
    required this.favUsers,
    required this.onFavoriteChanged,
  });

  @override
  State<FavView> createState() => _FavViewState();
}

class _FavViewState extends State<FavView> {
  late List<Map<String, dynamic>> favUsers;

  @override
  void initState() {
    super.initState();
    favUsers = List.from(widget.favUsers);
  }

  void toggleFavorite(int index) {
    setState(() {
      favUsers[index]["isFav"] = !favUsers[index]["isFav"];
      widget.onFavoriteChanged(
        favUsers[index]["Name"],
        favUsers[index]["isFav"],
      );
      if (!favUsers[index]["isFav"]) {
        favUsers.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ListView.builder(
        itemCount: favUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favUsers[index]["Name"]),
            trailing: Icon(Icons.favorite, color: Colors.red),
            onTap: () => toggleFavorite(index),
          );
        },
      ),
    );
  }
}
