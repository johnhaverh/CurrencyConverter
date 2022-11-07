import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../widgets/key_pad.dart';
import '../widgets/selection_item.dart';

// un widget con estado en el cual mantenemos los dos indices
// de las monedas que vamos a convertir
class ConverterPage extends StatefulWidget {
  const ConverterPage({Key? key}) : super(key: key);

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  // el estado del widget
  int currency1 = 1;
  int currency2 = 0;

  // función para construir el selector de monedas
  List<Widget> _buildItems() {
    return currencies
        .map((val) => SelectionItem( title: val,  )).toList();
  }

  void _onPressed() {
    setState(() {
        int currency3 = currency1;
        currency1 = currency2;
        currency2 = currency3;
    });
  }

  @override
  Widget build(BuildContext context) {
    // El siguiente widget en el arbol es el Scaffold
    return Scaffold(
        appBar: AppBar(
          title: const Text('Currency converter - Grupo 12'),
        ),
        body: Column(children: [
          Row(
            children: [
              Expanded(
                // selector para la primera moneda
                child: DirectSelect(
                    itemExtent: 45.0,
                    selectedIndex: currency1,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        currency1 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency1],
                      //"assets/" + currencies[currency1] + ".png" + 
                    )),
              ),
              Image(width: 20, height: 20, image: AssetImage("assets/flags/${currencies[currency1]}.png"),),
              IconButton(
                onPressed: () => _onPressed(),
                icon: const Icon( Icons.autorenew, color: Colors.black,),
                iconSize: 20,
              ),
              Image(width: 20, height: 20, image: AssetImage("assets/flags/${currencies[currency2]}.png"),),
              Expanded(
                // selector para la segunda moneda
                child: DirectSelect(
                    itemExtent: 45.0,
                    selectedIndex: currency2,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        currency2 = index ?? 0;
                      });
                    },
                    items: _buildItems(),
                    child: SelectionItem(
                      isForList: false,
                      title: currencies[currency2],
                    )),
              ),
            ],
          ),
          Expanded(
              child: Center(              
                child: KeyPad(textCurrency1:currencies[currency1],textCurrency2:currencies[currency2],rate:rates[currency1][currency2]),
          ))
        ]));
  }
}
