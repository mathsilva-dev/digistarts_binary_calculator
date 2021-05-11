import 'package:flutter_triple/flutter_triple.dart';

class HomeStore extends NotifierStore<Exception, String> {
  HomeStore() : super('0');

  Future<void> addition(String? number1, String? number2) async {
    if (number1!.isNotEmpty && number2!.isNotEmpty) {
      int value = int.parse(number1, radix: 2) + int.parse(number2, radix: 2);

      update(value.toRadixString(2).padLeft(8, '0'));
    } else
      setError(Exception('Empty'));
  }

  Future<void> subtraction(String? number1, String? number2) async {
    if (number1!.isNotEmpty && number2!.isNotEmpty) {
      int value = int.parse(number1, radix: 2) - int.parse(number2, radix: 2);

      if (value < 0)
        setError(Exception('Result was negative.'));
      else
        update(value.toRadixString(2).padLeft(8, '0'));
    } else
      setError(Exception('Empty'));
  }

  Future<void> multiplication(String? number1, String? number2) async {
    if (number1!.isNotEmpty && number2!.isNotEmpty) {
      int value = int.parse(number1, radix: 2) * int.parse(number2, radix: 2);

      update(value.toRadixString(2).padLeft(8, '0'));
    } else
      setError(Exception('Empty'));
  }

  Future<void> division(String? number1, String? number2) async {
    if (number1!.isNotEmpty && number2!.isNotEmpty) {
      int value = int.parse(number1, radix: 2) ~/ int.parse(number2, radix: 2);

      if (value < 0)
        setError(Exception('Result was negative.'));
      else
        update(value.toRadixString(2).padLeft(8, '0'));
    } else
      setError(Exception('Empty'));
  }

  Future<void> percent(String? number1, String? number2) async {
    if (number1!.isNotEmpty && number2!.isNotEmpty) {
      int value = int.parse(number1, radix: 2) % int.parse(number2, radix: 2);

      update(value.toRadixString(2).padLeft(8, '0'));
    } else
      setError(Exception('Empty'));
  }
}
