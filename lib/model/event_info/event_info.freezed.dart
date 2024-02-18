// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) {
  return _EventInfo.fromJson(json);
}

/// @nodoc
mixin _$EventInfo {
  String get id => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get eventType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventInfoCopyWith<EventInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventInfoCopyWith<$Res> {
  factory $EventInfoCopyWith(EventInfo value, $Res Function(EventInfo) then) =
      _$EventInfoCopyWithImpl<$Res, EventInfo>;
  @useResult
  $Res call({String id, DateTime updatedAt, String eventType});
}

/// @nodoc
class _$EventInfoCopyWithImpl<$Res, $Val extends EventInfo>
    implements $EventInfoCopyWith<$Res> {
  _$EventInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? eventType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventInfoImplCopyWith<$Res>
    implements $EventInfoCopyWith<$Res> {
  factory _$$EventInfoImplCopyWith(
          _$EventInfoImpl value, $Res Function(_$EventInfoImpl) then) =
      __$$EventInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime updatedAt, String eventType});
}

/// @nodoc
class __$$EventInfoImplCopyWithImpl<$Res>
    extends _$EventInfoCopyWithImpl<$Res, _$EventInfoImpl>
    implements _$$EventInfoImplCopyWith<$Res> {
  __$$EventInfoImplCopyWithImpl(
      _$EventInfoImpl _value, $Res Function(_$EventInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? updatedAt = null,
    Object? eventType = null,
  }) {
    return _then(_$EventInfoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      eventType: null == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EventInfoImpl implements _EventInfo {
  const _$EventInfoImpl(
      {required this.id, required this.updatedAt, required this.eventType});

  factory _$EventInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventInfoImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime updatedAt;
  @override
  final String eventType;

  @override
  String toString() {
    return 'EventInfo(id: $id, updatedAt: $updatedAt, eventType: $eventType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventInfoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, updatedAt, eventType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      __$$EventInfoImplCopyWithImpl<_$EventInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventInfoImplToJson(
      this,
    );
  }
}

abstract class _EventInfo implements EventInfo {
  const factory _EventInfo(
      {required final String id,
      required final DateTime updatedAt,
      required final String eventType}) = _$EventInfoImpl;

  factory _EventInfo.fromJson(Map<String, dynamic> json) =
      _$EventInfoImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get updatedAt;
  @override
  String get eventType;
  @override
  @JsonKey(ignore: true)
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
