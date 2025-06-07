import 'package:freezed_annotation/freezed_annotation.dart';

/// Base class for all models in the application
abstract class BaseModel {
  /// Validates the model data
  /// Returns a list of validation errors, empty if valid
  List<String> validate() => [];
}

/// Mixin for models that can be converted to/from JSON
mixin JsonSerializable {
  /// Converts the model to a JSON map
  Map<String, dynamic> toJson();

  /// Creates a model from a JSON map
  static T fromJson<T>(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson must be implemented by the model');
  }
} 