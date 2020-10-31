import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/utils/colors.dart';
import 'package:pokemon_api/widgets/home_list_widget.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        color: white,
        padding: EdgeInsets.all(
          _size.width * .05,
        ),
        child: HomeListWidget(),
      ),
    );
  }
}
