import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/provider/produto_model.dart';

class ProdutoWidget extends StatelessWidget {
  const ProdutoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(Provider.of<ProdutoModel>(context).name),
      ),
    );
  }
}
