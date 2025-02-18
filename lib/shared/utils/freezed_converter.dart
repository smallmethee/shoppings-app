import 'package:freezed_annotation/freezed_annotation.dart';

class AnyToStringConverter implements JsonConverter<String?, dynamic> {
  const AnyToStringConverter();

  @override
  String? fromJson(dynamic json) {
    return json?.toString();
  }

  @override
  String? toJson(String? input) {
    return input?.toString();
  }
}

class AnyToDoubleConverter implements JsonConverter<double?, dynamic> {
  const AnyToDoubleConverter();

  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;

    if (json is double) return json;
    if (json is num) return json.toDouble();
    if (json is String) {
      return double.tryParse(json);
    }

    throw TypeError();
  }

  @override
  dynamic toJson(double? input) {
    return input;
  }
}

class StringToIntConverter implements JsonConverter<int?, String?> {
  const StringToIntConverter();

  @override
  int? fromJson(String? json) {
    if (json == null) return null;
    return int.tryParse(json);
  }

  @override
  String? toJson(int? input) {
    return input?.toString();
  }
}

class StringToDoubleConverter implements JsonConverter<double?, String?> {
  const StringToDoubleConverter();

  @override
  double? fromJson(String? json) {
    if (json == null) return null;
    return double.tryParse(json);
  }

  @override
  String? toJson(double? input) {
    return input?.toString();
  }
}

class IntToDoubleConverter implements JsonConverter<double?, dynamic> {
  const IntToDoubleConverter();

  // @override
  // double? fromJson(int? input) {
  //   return input?.toDouble();
  // }

  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is int) return json.toDouble();
    if (json is double) return json;
    throw ArgumentError('Expected int or double for conversion to double.');
  }

  @override
  int? toJson(double? input) {
    return input?.toInt();
  }
}
