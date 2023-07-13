import 'package:brew_app/models/brew.dart';
import 'package:brew_app/screens/home/brew_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({super.key});

  @override
  State<BrewList> createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<BrewModel>>(context);

    for (var brew in brews) {
      if (kDebugMode) {
        print('brew : $brew');
        print('brew name : ${brew.name}');
        print('brew sugars : ${brew.sugars}');
        print('brew strength : ${brew.strength}');
      }
    }

    return ListView.builder(
      itemCount: brews.length,
      itemBuilder: (context, index) {
        return BrewTile(brew: brews[index]);
      },
    );
  }
}
