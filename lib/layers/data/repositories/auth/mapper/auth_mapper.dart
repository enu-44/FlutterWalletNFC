import 'dart:math';

import 'package:pago_facil_app/layers/layers.dart';

extension CreateAccountMapper on CreateAccountRequest {
  String _genRandomEmail() {
    // Lista de caracteres válidos para el correo electrónico
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    // Genera una combinación aleatoria de 10 caracteres
    final randomChars =
        List.generate(10, (index) => chars[random.nextInt(chars.length)]);
    // Concatena los caracteres aleatorios para formar el nombre de usuario
    final username = randomChars.join('');
    // Dominio de correo electrónico común
    const domain = 'example.com';
    // Combina el nombre de usuario y el dominio para formar el correo electrónico completo
    return '$username@$domain';
  }

  CreateAccountRequestDto toDto() => CreateAccountRequestDto(
      fullName: fullName,
      phone: phoneNumber,
      email: _genRandomEmail(),
      identification: idNumber,
      identificationType: idType,
      password: password);
}
