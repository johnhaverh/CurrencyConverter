import 'package:flutter/material.dart';

const Color myColor = Color.fromARGB(255, 64, 64, 69);

const currencies = [
  "COP",
  "USD",
  "EUR",
  "GBP"
];

// estructura de datos con la tasa de cambio
// en cada lista se tiene el valor de la tasa de cambio de la moneda correspondiente
// contra las otras dos
final List<List<double>> rates = [
  // COP        USD      EUR       GBP
  [    1.0, 0.000197, 0.000198, 0.000173], // COP
  [5083.22,      1.0,     0.98,     0.88], // USD
  [5062.33,     1.02,      1.0,     0.90], // EUR
  [5781.40,     1.12,     1.14,      1.0], // GBP
];
