import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerproject/change_notifier/provider_controller.dart';
import 'package:providerproject/provider/produto_widget.dart';
import 'package:tuple/tuple.dart';

class ChangeNotifierPage extends StatefulWidget {
  const ChangeNotifierPage({Key? key}) : super(key: key);

  @override
  State<ChangeNotifierPage> createState() => _ChangeNotifierPageState();
}

class _ChangeNotifierPageState extends State<ChangeNotifierPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(seconds: 20), () {
        context.read<ProviderController>().alterarDados();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<ProviderController>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<ProviderController, String>(
              selector: (_, controller) => controller.imgAvatar,
              builder: (__, imgAvatar, _) => CircleAvatar(
                backgroundImage: NetworkImage(imgAvatar),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<ProviderController>(
                  builder: (context, value, child) => Text(controller.name),
                ),
                Consumer<ProviderController>(
                  builder: (context, value, child) =>
                      Text("${controller.birthDate} years old"),
                ),
                Selector<ProviderController, Tuple2<String, String>>(
                    selector: (_, controller) =>
                        Tuple2(controller.name, controller.name),
                    builder: (_, data, __) {
                      return Text('${data.item1}  ${data.item2}');
                    })
              ],
            ),
            ElevatedButton(
              onPressed: () {
                controller.alterarDados();
              },
              child: Text("alterar"),
            )
          ],
        ),
      ),
    );
  }
}
