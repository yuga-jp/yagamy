// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'raw_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RawNotification _$RawNotificationFromJson(Map<String, dynamic> json) {
  return _RawNotification.fromJson(json);
}

/// @nodoc
mixin _$RawNotification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get sentTime => throw _privateConstructorUsedError;
  String get priority => throw _privateConstructorUsedError;
  String get relatedProjectId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RawNotificationCopyWith<RawNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RawNotificationCopyWith<$Res> {
  factory $RawNotificationCopyWith(
          RawNotification value, $Res Function(RawNotification) then) =
      _$RawNotificationCopyWithImpl<$Res, RawNotification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      DateTime sentTime,
      String priority,
      String relatedProjectId});
}

/// @nodoc
class _$RawNotificationCopyWithImpl<$Res, $Val extends RawNotification>
    implements $RawNotificationCopyWith<$Res> {
  _$RawNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? sentTime = null,
    Object? priority = null,
    Object? relatedProjectId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      relatedProjectId: null == relatedProjectId
          ? _value.relatedProjectId
          : relatedProjectId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RawNotificationCopyWith<$Res>
    implements $RawNotificationCopyWith<$Res> {
  factory _$$_RawNotificationCopyWith(
          _$_RawNotification value, $Res Function(_$_RawNotification) then) =
      __$$_RawNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      DateTime sentTime,
      String priority,
      String relatedProjectId});
}

/// @nodoc
class __$$_RawNotificationCopyWithImpl<$Res>
    extends _$RawNotificationCopyWithImpl<$Res, _$_RawNotification>
    implements _$$_RawNotificationCopyWith<$Res> {
  __$$_RawNotificationCopyWithImpl(
      _$_RawNotification _value, $Res Function(_$_RawNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? sentTime = null,
    Object? priority = null,
    Object? relatedProjectId = null,
  }) {
    return _then(_$_RawNotification(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      sentTime: null == sentTime
          ? _value.sentTime
          : sentTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priority: null == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String,
      relatedProjectId: null == relatedProjectId
          ? _value.relatedProjectId
          : relatedProjectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RawNotification implements _RawNotification {
  const _$_RawNotification(
      {required this.id,
      required this.title,
      required this.body,
      required this.sentTime,
      required this.priority,
      required this.relatedProjectId});

  factory _$_RawNotification.fromJson(Map<String, dynamic> json) =>
      _$$_RawNotificationFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime sentTime;
  @override
  final String priority;
  @override
  final String relatedProjectId;

  @override
  String toString() {
    return 'RawNotification(id: $id, title: $title, body: $body, sentTime: $sentTime, priority: $priority, relatedProjectId: $relatedProjectId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RawNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.sentTime, sentTime) ||
                other.sentTime == sentTime) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.relatedProjectId, relatedProjectId) ||
                other.relatedProjectId == relatedProjectId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, body, sentTime, priority, relatedProjectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RawNotificationCopyWith<_$_RawNotification> get copyWith =>
      __$$_RawNotificationCopyWithImpl<_$_RawNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RawNotificationToJson(
      this,
    );
  }
}

abstract class _RawNotification implements RawNotification {
  const factory _RawNotification(
      {required final String id,
      required final String title,
      required final String body,
      required final DateTime sentTime,
      required final String priority,
      required final String relatedProjectId}) = _$_RawNotification;

  factory _RawNotification.fromJson(Map<String, dynamic> json) =
      _$_RawNotification.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get sentTime;
  @override
  String get priority;
  @override
  String get relatedProjectId;
  @override
  @JsonKey(ignore: true)
  _$$_RawNotificationCopyWith<_$_RawNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
