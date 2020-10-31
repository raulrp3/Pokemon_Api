// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$PokemonApiService extends PokemonApiService {
  _$PokemonApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = PokemonApiService;

  Future<Response> getPokemons() {
    final $url = '/pokemon/?limit=151';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getPokemon(int id) {
    final $url = '/pokemon/${id}';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
