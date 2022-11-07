import 'package:flutter/material.dart';

class OneKey extends StatelessWidget {
  const OneKey({Key? key, required this.number, required this.callback,required this.size})
      : super(key: key);

  final int number;
  final Function(int) callback;
  final double? size;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: size!,
      height: size!,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100 / 2),
          ),
        ),
        onPressed: () {
          callback(number);
        },
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle( fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),),
        ),
      ),
    );
  }
}
