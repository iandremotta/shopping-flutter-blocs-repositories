import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Settings.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/models/category-list-item.model.dart';
import 'package:shopping/themes/dark-yellow.theme.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;
  CategoryCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);
    return Container(
      width: 70,
      height: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.selectedCategory
            ? primaryColor.withOpacity(0.3)
            : primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: FlatButton(
        child:
            Image.asset("assets/categories/${Settings.theme}/${item.tag}.png"),
        onPressed: () {
          bloc.changeCategory(item.tag);
        },
      ),
    );
  }
}
