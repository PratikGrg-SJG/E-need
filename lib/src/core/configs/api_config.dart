class ApiConfig {
  //prod,dev,stage
  // static const Environment env = Environment.localhost;
  static const String localhost = "http://192.168.1.79:8000";
  // static const String localhost = "http://192.168.100.156:8080";
  static const String stagingServerUrl =
      'https://stingray-app-9kaw7.ondigitalocean.app';
  // static const String stagingServerUrl =
  //     'stingray-app-9kaw7.ondigitalocean.app';
  static String prodServerUrl = 'https://api.krishilabs.com';
  static const String apiUrl = "/api";
  static const String apiVersion1 = "/v1";
  // static String baseUrl = prodServerUrl + apiUrl;
  // static String baseUrl = (env == Environment.production
  //         ? prodServerUrl
  //         : env == Environment.staging
  //             ? stagingServerUrl
  //             : localhost) +
  //     apiUrl +
  //     apiVersion1;
  static const String authUrl = "/auth";
  static const String loginUrl = "/login";
  static const String ssoUrl = "/sso";
}
