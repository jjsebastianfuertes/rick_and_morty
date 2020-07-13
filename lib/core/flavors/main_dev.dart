import '../../main.dart';
import '../flavors/flavor_config.dart';

void main() {
  Flavor.setEnvironment(Environment.DEV);
  mainDelegate();
}
