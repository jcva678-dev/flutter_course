
import 'package:intl/intl.dart';

class HumanFormats{
  // Convierte números grandes a una representación compacta para la interfaz,
  // por ejemplo 1500 a "2K" sin decimales.
  static String HumanReadableNumber(double number){

    // NumberFormat aplica reglas de abreviación propias del locale activo.
    final formatterNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
    ).format(number);
    return formatterNumber;
  }
}
