import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/models/pokemon.dart';
import 'package:pokemon_api/pages/detail_page.dart';
import 'package:pokemon_api/utils/colors.dart';

class HomeListItemWidget extends StatelessWidget {
  final Pokemon pokemon;

  HomeListItemWidget({
    @required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        height: _size.height * .2,
        margin: EdgeInsets.all(
          _size.width * .025,
        ),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              _size.width * .025,
            ),
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 5,
              color: black.withOpacity(0.25),
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              width: _size.width * .4,
              height: _size.height * .2,
              padding: EdgeInsets.all(
                _size.width * .025,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    _size.width * .025,
                  ),
                  topLeft: Radius.circular(
                    _size.width * .025,
                  ),
                ),
                child: FadeInImage(
                  height: _size.height * .2,
                  width: _size.width * .4,
                  image: NetworkImage(pokemon.image),
                  placeholder: AssetImage(
                    '',
                  ),
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(
              width: _size.width * .05,
            ),
            Container(
                width: _size.width * .4,
                child: Center(
                  child: Text(
                    pokemon.name.toUpperCase(),
                    style: TextStyle(
                      color: black,
                      fontSize: 15,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              id: pokemon.id,
            ),
          ),
        );
      },
    );
  }
}
