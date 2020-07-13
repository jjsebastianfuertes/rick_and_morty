enum Environment { DEV, PROD }

class Flavor {
  static String _baseUrl;

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _baseUrl = "https://rickandmortyapi.staging.com/api/";
        break;
      case Environment.PROD:
        _baseUrl = "https://rickandmortyapi.com/api/";
        break;
    }
  }

  static get server {
    return _baseUrl;
  }
}
