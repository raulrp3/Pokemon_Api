import 'package:flutter/cupertino.dart';
import 'package:pokemon_api/utils/colors.dart';

class DetailListItemWidget extends StatelessWidget {
  final String text;

  DetailListItemWidget({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height * .01,
      margin: EdgeInsets.symmetric(
        horizontal: _size.width * .04,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            _size.width * .05,
          ),
        ),
        border: Border.all(
          width: _size.width * .001,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          _size.width * .03,
        ),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Arial',
              color: black,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
