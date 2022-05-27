import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart-item.model.dart';
import 'package:shopping/themes/dark-yellow.theme.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;

  CartItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    final price = new NumberFormat("#,##0.00", "pt_BR");
    return Container(
      height: 120,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
            child: Image.network(
              item.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title),
                Text(
                  "R\$ ${price.format(item.price)}",
                  style: TextStyle(color: primaryColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "R\$ ${price.format(item.price * item.quantity)}",
                ),
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          width: 40,
                          child: FlatButton(
                            onPressed: () {
                              bloc.decrease(item);
                            },
                            child: Text("-"),
                          )),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(
                          item.quantity.toString(),
                        ),
                      ),
                      Container(
                        width: 40,
                        alignment: Alignment.center,
                        child: FlatButton(
                          onPressed: () {
                            bloc.increase(item);
                          },
                          child: Text("+"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
