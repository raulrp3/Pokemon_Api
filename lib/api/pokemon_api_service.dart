import 'package:chopper/chopper.dart';

part 'pokemon_api_service.chopper.dart';

@ChopperApi(baseUrl: '/pokemon')
abstract class PokemonApiService extends ChopperService {
  @Get(path: '?limit=151')
  Future<Response> getPokemons();

  @Get(path: '/{id}')
  Future<Response> getPokemon(@Path('id') int id);

  static PokemonApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://pokeapi.co/api/v2',
      services: [
        _$PokemonApiService(),
      ],
      converter: JsonConverter(),
    );

    return _$PokemonApiService(client);
  }
}
