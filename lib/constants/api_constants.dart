// ignore_for_file: constant_identifier_names

class ApiConstants {
  static const BASED_URL = 'https://api.trace.moe';

    static const DEFAULT_NETWORK_CONNECT_TIMEOUT = Duration.millisecondsPerMinute;
  static const DEFAULT_NETWORK_RECEIVE_TIMEOUT = Duration.microsecondsPerMinute;

  static const STATUS_CODE_CONNECT_TIMEOUT = 408;
  static const STATUS_CODE_RECEIVE_TIMEOUT = 406;

  static const String app_error_msg_connection_timeout =
      "အင်တာနက်လိုင်းအားနည်းနေပါသည်။";
  static const String app_error_msg_no_connection =
      "အင်တာနက်လိုင်းချိပ်ဆက်ထားခြင်းမရှိပါ။";
}
