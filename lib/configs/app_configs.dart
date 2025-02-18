import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfigs {
  static final apiUrl = dotenv.env['API_URL']!;
}
