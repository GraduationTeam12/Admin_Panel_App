import 'dart:async';
 

class RouteManager {
  static final _routeController = StreamController<String>.broadcast();

  static Stream<String> get routeStream => _routeController.stream;

  static void changeRoute(String newRoute) {
    _routeController.add(newRoute);
  }
}
