import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/user.bloc.dart';
import 'package:shopping/models/create-user.model.dart';
import 'package:shopping/ui/shared/validators/custom.validators.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffolKey = GlobalKey<ScaffoldState>();
  var user = new CreateuserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nome inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  user.name = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  return CustomValidators.isEmail(value);
                },
                onSaved: (val) {
                  user.email = val;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Usuário",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Usuário Inválido';
                  }
                  return null;
                },
                onSaved: (val) {
                  user.username = val;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Senha Inválida';
                  }
                  return null;
                },
                onSaved: (val) {
                  user.password = val;
                },
              ),
              FlatButton(
                child: Text("Entrar"),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    create(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  create(BuildContext context) async {
    var bloc = Provider.of<UserBloc>(context, listen: false);
    var res = await bloc.create(user);
    if (res == null) {
      final snackBar =
          SnackBar(content: Text("Não foi possível realizar o cadastro"));
      _scaffolKey.currentState.showSnackBar(snackBar);
    } else {
      Navigator.pop(context);
      final snackBar = SnackBar(content: Text("Por favor! Autentique-se!"));
      _scaffolKey.currentState.showSnackBar(snackBar);
    }
  }
}
