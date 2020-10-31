import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/api/pokemon_api_service.dart';
import 'package:pokemon_api/pages/home_page.dart';
import 'package:pokemon_api/utils/routes.dart';
import 'package:provider/provider.dart';

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      dispose: (context, PokemonApiService service) => service.client.dispose(),
      create: (_) => PokemonApiService.create(),
      child: MaterialApp(
        title: 'POKEMON API',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
        routes: routes,
      ),
    );
  }
}
