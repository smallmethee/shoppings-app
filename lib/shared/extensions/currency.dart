import 'package:intl/intl.dart';

extension CurrencyFormat on double {
  String get toThaiBaht {
    final currencyFormatter =
        NumberFormat.currency(locale: 'th_TH', symbol: '');
    return currencyFormatter.format(this);
  }
}
