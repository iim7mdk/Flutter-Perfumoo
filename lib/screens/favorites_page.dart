import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String> _favoriteIds = [];

  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _favoriteIds = prefs.getStringList('favorites') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_favoriteIds.isEmpty) {
      return const Center(
        child: Text('لا توجد عطور مفضلة حالياً'),
      );
    }

    return ListView.builder(
      itemCount: _favoriteIds.length,
      itemBuilder: (context, index) {
        final id = _favoriteIds[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: ListTile(
            leading: const Icon(Icons.favorite, color: Colors.red),
            title: Text('عطر رقم $id'),
            subtitle: const Text('هذا العطر ضمن قائمة المفضلة لديك'),
          ),
        );
      },
    );
  }
}
