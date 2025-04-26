// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {

 String get message;
/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventCopyWith<HomeEvent> get copyWith => _$HomeEventCopyWithImpl<HomeEvent>(this as HomeEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeEvent(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeEventCopyWith<$Res>  {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) _then) = _$HomeEventCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HomeEventCopyWithImpl<$Res>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._self, this._then);

  final HomeEvent _self;
  final $Res Function(HomeEvent) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class ShowSnackBar implements HomeEvent {
  const ShowSnackBar(this.message);
  

@override final  String message;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShowSnackBarCopyWith<ShowSnackBar> get copyWith => _$ShowSnackBarCopyWithImpl<ShowSnackBar>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShowSnackBar&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeEvent.showSnackBar(message: $message)';
}


}

/// @nodoc
abstract mixin class $ShowSnackBarCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $ShowSnackBarCopyWith(ShowSnackBar value, $Res Function(ShowSnackBar) _then) = _$ShowSnackBarCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class _$ShowSnackBarCopyWithImpl<$Res>
    implements $ShowSnackBarCopyWith<$Res> {
  _$ShowSnackBarCopyWithImpl(this._self, this._then);

  final ShowSnackBar _self;
  final $Res Function(ShowSnackBar) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(ShowSnackBar(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
