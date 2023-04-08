import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FifeTheme {
  FifeTheme._constructor();
  static final FifeTheme _instance = FifeTheme._constructor();

  factory FifeTheme() => _instance;

  FifeColorScheme get colorScheme => FifeColorScheme();
  FifeTextStyleScheme get textScheme => FifeTextStyleScheme();
}

class FifeColorScheme {
  Color get background => const Color(0xFF171519);
  Color get white => Colors.white;
  Color get grey => Colors.grey;
  Color get gold => Colors.yellow;
  Color get blue => Colors.blue;
}

class FifeTextStyleScheme {
  FifeTextStyle get small => const FifeTextStyle(size: 12);
  FifeTextStyle get normal => const FifeTextStyle(size: 16);
  FifeTextStyle get medium => const FifeTextStyle(size: 20);
  FifeTextStyle get large => const FifeTextStyle(size: 36);
  FifeTextStyle get xlarge => const FifeTextStyle(size: 48);
}

enum TextStyleWeight {
  light,
  semiLight,
  normal,
  semiBold,
  bold,
}

class FifeTextStyle extends Equatable {
  const FifeTextStyle({
    this.color,
    this.weight,
    this.size,
    this.font = 'Good Sans',
    this.italic = false,
    this.underlined = false,
  });

  final Color? color;
  final bool italic;
  final bool underlined;
  final TextStyleWeight? weight;
  final double? size;
  final String font;

  FifeTextStyle copyWith({
    Color? newColor,
    bool? isItalic,
    bool? isUnderlined,
    TextStyleWeight? newWeight,
    double? newSize,
    String? newFont,
  }) {
    return FifeTextStyle(
      font: newFont ?? font,
      italic: isItalic ?? italic,
      weight: newWeight ?? weight,
      size: newSize ?? size,
      color: newColor ?? color,
      underlined: isUnderlined ?? underlined,
    );
  }

  @override
  List<Object?> get props => [
        color,
        weight,
        size,
        font,
        italic,
        underlined,
      ];

  TextStyle toTextStyle() {
    return TextStyle(
      fontFamily: font,
      fontSize: size,
      color: color ?? GetIt.I.get<FifeTheme>().colorScheme.white,
      fontStyle: italic ? FontStyle.italic : null,
      fontWeight: weight == null ? null : mapWeight(weight!),
      decoration: underlined ? TextDecoration.underline : null,
    );
  }

  FontWeight mapWeight(TextStyleWeight from) {
    switch (from) {
      case TextStyleWeight.light:
        return FontWeight.w200;
      case TextStyleWeight.semiLight:
        return FontWeight.w300;
      case TextStyleWeight.normal:
        return FontWeight.normal;
      case TextStyleWeight.semiBold:
        return FontWeight.w600;
      case TextStyleWeight.bold:
        return FontWeight.bold;
      default:
        throw UnimplementedError();
    }
  }
}
