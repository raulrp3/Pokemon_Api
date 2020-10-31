import 'package:flutter/cupertino.dart';
import 'package:pokemon_api/widgets/detail_list_item_widget.dart';

class DetailListWidget extends StatelessWidget {
  final String type;
  final List data;

  DetailListWidget({@required this.type, @required this.data});

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Container(
      height: _size.height * 0.075,
      width: _size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return DetailListItemWidget(
            text: data[index][type]['name'],
          );
        },
      ),
    );
  }
}
