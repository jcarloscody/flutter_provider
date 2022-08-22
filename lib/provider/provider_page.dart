import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/provider/produto_model.dart';
import 'package:providerproject/provider/produto_widget.dart';
import 'package:providerproject/provider/user_model.dart';

class ProviderPage extends StatelessWidget {
  const ProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    var user2 = context.read<
        UserModel>(); //equivalencia do provider.of. a diferença básica é que ele retorna uma instância sem ficar escutando alterações.
    var image = context.select<UserModel, String>(
        (value) => value.imgAvatar); //tras especificamente o valor do todo
    var user3 = context.watch<
        UserModel>(); //só faz sentido para change notifier. ele fica escutando alterações
    return Scaffold(
      appBar: AppBar(
        title: const Text('dd'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(user2.imgAvatar),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(user.name),
                Text("${user.birthDate} years old"),
                Provider(
                  create: (context) => ProdutoModel(name: "kkkkkkkkkkkkkkkk"),
                  child: const ProdutoWidget(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
