import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/api/pokemon_api_service.dart';
import 'package:pokemon_api/utils/colors.dart';
import 'package:pokemon_api/widgets/detail_list_item_widget.dart';
import 'package:pokemon_api/widgets/detail_list_widget.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatelessWidget {
  final int id;

  DetailPage({
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        color: white,
        padding: EdgeInsets.all(
          _size.width * .05,
        ),
        child: FutureBuilder<Response>(
          future: Provider.of<PokemonApiService>(context).getPokemon(this.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final response = json.decode(snapshot.data.bodyString);
              final List abilities = response['abilities'];
              final List gameIndices = response['game_indices'];
              final List moves = response['moves'];
              final List types = response['types'];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        response['sprites']['back_default'],
                      ),
                      Image.network(
                        response['sprites']['front_default'],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: _size.height * .015,
                  ),
                  DetailListWidget(
                    type: 'ability',
                    data: abilities,
                  ),
                  SizedBox(
                    height: _size.height * .05,
                  ),
                  DetailListWidget(
                    type: 'version',
                    data: gameIndices,
                  ),
                  SizedBox(
                    height: _size.height * .05,
                  ),
                  DetailListWidget(
                    type: 'move',
                    data: moves,
                  ),
                  SizedBox(
                    height: _size.height * .05,
                  ),
                  DetailListWidget(
                    type: 'type',
                    data: types,
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
