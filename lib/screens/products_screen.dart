import 'package:flutter/material.dart';

import '../models/perfume.dart';
import '../data/fake_data.dart';
import '../services/pref_service.dart';

class PerfumesPage extends StatefulWidget {
  const PerfumesPage({super.key});

  @override
  State<PerfumesPage> createState() => _PerfumesPageState();
}

class _PerfumesPageState extends State<PerfumesPage> {

  final List<Perfume> _perfumes = perfumesFakeData;



  List<String> _favoriteIds = [];



  @override
  void initState() {
    super.initState();
    _loadFavorites();
  }

  Future<void> _loadFavorites() async {
    final favorites = await PrefService.getFavorites();

    setState(() {
      _favoriteIds = favorites;
    });
  }

  Future<void> _toggleFavorite(String perfumeId) async {

    setState(() {
      if (_favoriteIds.contains(perfumeId)) {
        _favoriteIds.remove(perfumeId);
      } else {
        _favoriteIds.add(perfumeId);
      }
    });




    await PrefService.setFavorites(_favoriteIds);
  }

  void _showDetails(Perfume perfume) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(perfume.name),
          content: Text(
            'الوصف: ${perfume.description}\nالسعر: ${perfume.price.toStringAsFixed(0)} ريال',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('إغلاق'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {



    return ListView.builder(
      itemCount: _perfumes.length,
      itemBuilder: (context, index) {
        final perfume = _perfumes[index];
        final isFavorite = _favoriteIds.contains(perfume.id); // هل هو مفضل؟

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          elevation: 3,
          child: ListTile(


            onTap: () {
              _showDetails(perfume);
            },

            leading: Image.network(
              perfume.image,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),

            title: Text(perfume.name),

            subtitle: Text('${perfume.price.toStringAsFixed(0)} ريال'),

            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                _toggleFavorite(perfume.id);
              },
            ),
          ),
        );
      },
    );
  }
}
