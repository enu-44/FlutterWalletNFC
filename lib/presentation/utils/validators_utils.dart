class ValidatorUtil {
  static String? numericOnly(String? value) {
    if (requiredField(value) != null) {
      return requiredField(value);
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value!)) {
      return 'Este campo debe contener solo números';
    }
    return null;
  }

  static String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  static String? maxLength(String? value, int maxLength) {
    if (value != null && value.length > maxLength) {
      return 'El valor debe tener como máximo $maxLength caracteres';
    }
    return null;
  }

  static String? confirmEqual(String? currentValue, String? valueToCompare,
      {required String Function() message}) {
    if (valueToCompare != null && currentValue != valueToCompare) {
      return message();
    }
    return null;
  }

  static String? minLength(String? value, int minLength) {
    if (value != null && value.length < minLength) {
      return 'El valor debe tener al menos $minLength caracteres';
    }
    return null;
  }

  static String? maxValue(double? value, double maxValue) {
    if (value != null && value > maxValue) {
      return 'El valor debe ser como máximo $maxValue';
    }
    return null;
  }

  static String? minValue(double? value, double minValue) {
    if (value != null && value < minValue) {
      return 'El valor debe ser al menos $minValue';
    }
    return null;
  }

  static String? validEmail(String? value) {
    if (value != null &&
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Por favor, ingresa un correo electrónico válido';
    }
    return null;
  }

  static String? validate(List<String? Function(String?)> validators) {
    for (var validator in validators) {
      final error = validator('');
      if (error != null) {
        return error;
      }
    }
    return null;
  }
}
