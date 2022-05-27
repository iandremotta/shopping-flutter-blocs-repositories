import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/themes/dark-yellow.theme.dart';

class AuthenticatedUserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<UserBloc>(context);
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(bloc.user.image),
                ),
                color: primaryColor,
                border: Border.all(
                  width: 4,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("Bem vindo ${bloc.user.name}"),
            SizedBox(
              height: 10,
            ),
            FlatButton(
              onPressed: () {
                bloc.logout();
              },
              child: Text("Sair"),
            ),
          ],
        ),
      ),
    );
  }
}
