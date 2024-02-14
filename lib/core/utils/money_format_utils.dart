import 'package:money2/money2.dart';

class MoneyFormatUtils {
  const MoneyFormatUtils._();
  static getMoneyFormat(
      {required double? value, fractionDigits = 0, minus = false}) {
    final jpy = Currency.create('COP', 0,
        invertSeparators: true, symbol: r"$", pattern: 'S###.###');
    final jpyMoney = Money.fromNumWithCurrency(value ?? 0, jpy);
    return minus ? '-$jpyMoney' : jpyMoney.toString();
  }
}
