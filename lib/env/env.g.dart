// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env.dart';

// **************************************************************************
// EnviedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _AppEnv {
  static const List<int> _enviedkeybaseUrlStaging = <int>[
    2478245485,
    1876200349,
    3714100960,
    3950193891,
  ];

  static const List<int> _envieddatabaseUrlStaging = <int>[
    2478245401,
    1876200440,
    3714100883,
    3950193815,
  ];

  static final String baseUrlStaging = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrlStaging.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrlStaging[i] ^ _enviedkeybaseUrlStaging[i]));

  static const List<int> _enviedkeybaseUrlProd = <int>[
    2972840509,
    1483694803,
    767525240,
    2378465345,
  ];

  static const List<int> _envieddatabaseUrlProd = <int>[
    2972840521,
    1483694774,
    767525131,
    2378465333,
  ];

  static final String baseUrlProd = String.fromCharCodes(List<int>.generate(
    _envieddatabaseUrlProd.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatabaseUrlProd[i] ^ _enviedkeybaseUrlProd[i]));

  static const List<int> _enviedkeysentryDsn = <int>[
    1113913018,
    3297107593,
    3766897394,
    1734689686,
  ];

  static const List<int> _envieddatasentryDsn = <int>[
    1113913038,
    3297107692,
    3766897281,
    1734689762,
  ];

  static final String sentryDsn = String.fromCharCodes(List<int>.generate(
    _envieddatasentryDsn.length,
    (int i) => i,
    growable: false,
  ).map((int i) => _envieddatasentryDsn[i] ^ _enviedkeysentryDsn[i]));
}
