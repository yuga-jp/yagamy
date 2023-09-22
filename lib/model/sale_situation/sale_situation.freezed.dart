// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sale_situation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SaleSituation _$SaleSituationFromJson(Map<String, dynamic> json) {
  return _SaleSituation.fromJson(json);
}

/// @nodoc
mixin _$SaleSituation {
  String get id => throw _privateConstructorUsedError;
  String get saleSituation => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleSituationCopyWith<SaleSituation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleSituationCopyWith<$Res> {
  factory $SaleSituationCopyWith(
          SaleSituation value, $Res Function(SaleSituation) then) =
      _$SaleSituationCopyWithImpl<$Res, SaleSituation>;
  @useResult
  $Res call({String id, String saleSituation, DateTime updatedAt});
}

/// @nodoc
class _$SaleSituationCopyWithImpl<$Res, $Val extends SaleSituation>
    implements $SaleSituationCopyWith<$Res> {
  _$SaleSituationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleSituation = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saleSituation: null == saleSituation
          ? _value.saleSituation
          : saleSituation // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SaleSituationCopyWith<$Res>
    implements $SaleSituationCopyWith<$Res> {
  factory _$$_SaleSituationCopyWith(
          _$_SaleSituation value, $Res Function(_$_SaleSituation) then) =
      __$$_SaleSituationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String saleSituation, DateTime updatedAt});
}

/// @nodoc
class __$$_SaleSituationCopyWithImpl<$Res>
    extends _$SaleSituationCopyWithImpl<$Res, _$_SaleSituation>
    implements _$$_SaleSituationCopyWith<$Res> {
  __$$_SaleSituationCopyWithImpl(
      _$_SaleSituation _value, $Res Function(_$_SaleSituation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? saleSituation = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_SaleSituation(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      saleSituation: null == saleSituation
          ? _value.saleSituation
          : saleSituation // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SaleSituation implements _SaleSituation {
  const _$_SaleSituation(
      {required this.id, required this.saleSituation, required this.updatedAt});

  factory _$_SaleSituation.fromJson(Map<String, dynamic> json) =>
      _$$_SaleSituationFromJson(json);

  @override
  final String id;
  @override
  final String saleSituation;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'SaleSituation(id: $id, saleSituation: $saleSituation, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SaleSituation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.saleSituation, saleSituation) ||
                other.saleSituation == saleSituation) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, saleSituation, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SaleSituationCopyWith<_$_SaleSituation> get copyWith =>
      __$$_SaleSituationCopyWithImpl<_$_SaleSituation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SaleSituationToJson(
      this,
    );
  }
}

abstract class _SaleSituation implements SaleSituation {
  const factory _SaleSituation(
      {required final String id,
      required final String saleSituation,
      required final DateTime updatedAt}) = _$_SaleSituation;

  factory _SaleSituation.fromJson(Map<String, dynamic> json) =
      _$_SaleSituation.fromJson;

  @override
  String get id;
  @override
  String get saleSituation;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_SaleSituationCopyWith<_$_SaleSituation> get copyWith =>
      throw _privateConstructorUsedError;
}
