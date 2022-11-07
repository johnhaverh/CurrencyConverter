import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'one_key.dart';

// en este widget mostramos el keypad y los valores de las monedas
class KeyPad extends StatefulWidget {
  const KeyPad(
      {Key? key,
      required this.textCurrency1,
      required this.textCurrency2,
      required this.rate})
      : super(key: key);

  // estos tres valores son recibidos de converter_page
  final String textCurrency1;
  final String textCurrency2;
  final double rate;

  @override
  State<KeyPad> createState() => _KeyPadState();
}

class _KeyPadState extends State<KeyPad> {
  final formatCurrency = NumberFormat("#,##0.00", "en_US");

  // valor de la moneda convertida
  double _currency2 = 0;
  // el valor de la moneda que es introducida en el keypad
  int _currency1 = 0;

  // función que cambia el estado del widget (_currency1, _currency2)
  void _onPressed(int k) {
    setState(() {
      if (k == 10) {
        _currency1=0;
        _currency2=0;
      } else {
        _currency1=int.parse(_currency1.toString()+k.toString());
        _currency2=_currency1 * widget.rate;
      }
    });
  }

  @override
  void didUpdateWidget(covariant oldWidget) {
    super.didUpdateWidget(oldWidget);
    // aquí garantizamos que cuando el widget refresca el estado va a cero
    _currency2 = 0;
    _currency1 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textCurrency1),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(formatCurrency.format(_currency1.toDouble()),
                    textAlign: TextAlign.right,
                    style: TextStyle( fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary, fontSize: 20), )),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.textCurrency2),
              ),
              Expanded(
                child: Container(),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerRight,
                  child: Text(formatCurrency.format(_currency2.toDouble()),
                    //num.parse(_currency2.toStringAsFixed(2)).toString(),
                    textAlign: TextAlign.right,
                    style: TextStyle( fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary, fontSize: 20), ))
            ],
          ),
          const Divider(),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number:7, callback: _onPressed,size:100),
                  OneKey(number:8, callback: _onPressed,size:100),
                  OneKey(number:9, callback: _onPressed,size:100),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number:4, callback: _onPressed,size:100),
                  OneKey(number:5, callback: _onPressed,size:100),
                  OneKey(number:6, callback: _onPressed,size:100),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  OneKey(number:1, callback: _onPressed,size:100),
                  OneKey(number:2, callback: _onPressed,size:100),
                  OneKey(number:3, callback: _onPressed,size:100),
                ]),
          ),
          Expanded(
            flex: 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[  
                  const SizedBox(width:120),
                  OneKey(number:0, callback: _onPressed,size:100),
                  IconButton(
                    onPressed: () => _onPressed(10),
                    icon: const Icon( Icons.backspace,  color: Colors.redAccent, ),
                    iconSize: 100,
                  ),
                ]),
          ),
        ]);
  }
}
