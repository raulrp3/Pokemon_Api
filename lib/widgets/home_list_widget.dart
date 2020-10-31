import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/api/pokemon_api_service.dart';
import 'package:pokemon_api/models/pokemon.dart';
import 'package:pokemon_api/widgets/home_list_item_widget.dart';
import 'package:provider/provider.dart';

class HomeListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Response>(
      future: Provider.of<PokemonApiService>(context).getPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final response = json.decode(snapshot.data.bodyString);
          final data = response['results'];

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              int id = index + 1;
              Pokemon _pokemon = Pokemon(
                name: data[index]['name'],
                url: data[index]['url'],
                image: 'https://pokeres.bastionbot.org/images/pokemon/$id.png',
                id: id,
              );

              return HomeListItemWidget(
                pokemon: _pokemon,
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
