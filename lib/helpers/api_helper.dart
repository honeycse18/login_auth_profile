import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:testapp/utils/app_components.dart';

class APIHelper {
  static String toServerDateTimeFormattedStringFromDateTime(DateTime dateTime) {
    return AppComponents.apiDateTimeFormat.format(dateTime.toUtc());
  }

  static bool isAPIResponseObjectSafe<T>(Object? unsafeValue) {
    if (unsafeValue is Map<String, dynamic>) {
      // Now it is safe
      return true;
    }
    return false;
  }

  static String getSafeStringValue(Object? unsafeResponseStringValue) {
    const String defaultStringValue = '';
    if (unsafeResponseStringValue == null) {
      return defaultStringValue;
    } else if (unsafeResponseStringValue is String) {
      // Now it is safe
      return unsafeResponseStringValue;
    }
    return defaultStringValue;
  }

  static List<T> getSafeListValue<T>(Object? unsafeResponseListValue) {
    const List<T> defaultListValue = [];
    if (unsafeResponseListValue == null) {
      return defaultListValue;
    } else if (unsafeResponseListValue is List<T>) {
      // Now it is safe
      return unsafeResponseListValue;
    }
    return defaultListValue;
  }

  static DateTime getSafeDateTimeValue(
    Object? unsafeResponseDateTimeStringValue, {
    DateFormat? dateTimeFormat,
    bool isUTCTime = true,
  }) {
    final DateTime defaultDateTime = AppComponents.defaultUnsetDateTime;
    final String safeDateTimeStringValue =
        getSafeStringValue(unsafeResponseDateTimeStringValue);
    return getDateTimeFromServerDateTimeString(safeDateTimeStringValue,
            dateTimeFormat: dateTimeFormat, isUTCTime: isUTCTime) ??
        defaultDateTime;
  }

  static int getSafeIntValue(Object? unsafeResponseIntValue,
      [int defaultIntValue = -1]) {
    if (unsafeResponseIntValue == null) {
      return defaultIntValue;
    } else if (unsafeResponseIntValue is String) {
      return (num.tryParse(unsafeResponseIntValue) ?? defaultIntValue).toInt();
    } else if (unsafeResponseIntValue is num) {
      // Now it is safe
      return unsafeResponseIntValue.toInt();
    }
    return defaultIntValue;
  }

  static double getSafeDoubleValue(Object? unsafeResponseDoubleValue,
      [double defaultDoubleValue = -1]) {
    if (unsafeResponseDoubleValue == null) {
      return defaultDoubleValue;
    } else if (unsafeResponseDoubleValue is String) {
      return (num.tryParse(unsafeResponseDoubleValue) ?? defaultDoubleValue)
          .toDouble();
    } else if (unsafeResponseDoubleValue is num) {
      // Now it is safe
      return unsafeResponseDoubleValue.toDouble();
    }
    return defaultDoubleValue;
  }

  static bool? getBoolFromString(String boolAsString) {
    if (boolAsString == 'true') {
      return true;
    } else if (boolAsString == 'false') {
      return false;
    }
    return null;
  }

  static bool getSafeBoolValue(Object? unsafeResponseBoolValue,
      [bool defaultBoolValue = false]) {
    if (unsafeResponseBoolValue == null) {
      return defaultBoolValue;
    } else if (unsafeResponseBoolValue is String) {
      if (GetUtils.isBool(unsafeResponseBoolValue)) {
        return getBoolFromString(unsafeResponseBoolValue) ?? defaultBoolValue;
      }
      return defaultBoolValue;
    } else if (unsafeResponseBoolValue is bool) {
      // Now it is safe
      return unsafeResponseBoolValue;
    }
    return defaultBoolValue;
  }

  static DateTime? getDateTimeFromServerDateTimeString(
    String dateTimeString, {
    DateFormat? dateTimeFormat,
    bool isUTCTime = true,
  }) {
    try {
      return (dateTimeFormat ?? AppComponents.apiDateTimeFormat)
          .parse(dateTimeString, isUTCTime)
          .toLocal();
    } catch (e) {
      return null;
    }
  }
}
