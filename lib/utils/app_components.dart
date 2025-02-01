import 'package:testapp/utils/app_constants.dart';

import 'package:intl/intl.dart';

class AppComponents {
  static final DateTime defaultUnsetDateTime =
      DateTime(AppConstants.defaultUnsetDateTimeYear);
  static final apiDateTimeFormat =
      DateFormat(AppConstants.apiDateTimeFormatValue);
  static final apiOnlyDateFormat =
      DateFormat(AppConstants.apiOnlyDateFormatValue);

  static final apiOnlyTimeFormat =
      DateFormat(AppConstants.apiOnlyTimeFormatValue);
}
