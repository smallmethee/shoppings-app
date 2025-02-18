import 'package:freezed_annotation/freezed_annotation.dart';
part 'enums.g.dart';

@JsonEnum(alwaysCreate: true)
enum InOutMode {
  @JsonValue("in")
  inMode,
  @JsonValue("out")
  out,
}

@JsonEnum(alwaysCreate: true)
enum RecordType {
  @JsonValue("GPS")
  gps,
  @JsonValue("Face")
  face,
  @JsonValue("Fingerprint")
  fingerprint,
}
