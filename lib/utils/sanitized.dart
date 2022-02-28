class Sanitized {
  static String viewPhoneSanitized({required String phone}) {
    final regexp = RegExp(r'\D');
    var phoneSanitized = '';
    var phoneInitials = phone
        .replaceAll(regexp, '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('-', '')
        .replaceAll(' ', '');

    if (phoneInitials.length == 10) {
      var formattedPhoneNumber = '(' +
          phoneInitials.substring(0, 2) +
          ') ' +
          phoneInitials.substring(2, 6) +
          '-' +
          phoneInitials.substring(6, phoneInitials.length);
      phoneSanitized = formattedPhoneNumber;
    }
    if (phoneInitials.length == 11) {
      var formattedPhoneNumber2 = '(' +
          phoneInitials.substring(0, 2) +
          ') ' +
          phoneInitials.substring(2, 7) +
          '-' +
          phoneInitials.substring(7, phoneInitials.length);
      phoneSanitized = formattedPhoneNumber2;
    }
    if (phoneInitials.length < 10 || phoneInitials.length > 11) {
      phoneSanitized = phoneInitials;
    }
    return phoneSanitized;
  }

  static String viewCpfSanitized({required String document}) {
    String? documentSanitized;
    var documentInitial =
        document.replaceAll('.', '').replaceAll('-', '').replaceAll(' ', '');

    if (documentInitial.length == 11) {
      var formattedDocument = documentInitial.substring(0, 3) +
          '.' +
          documentInitial.substring(3, 6) +
          '.' +
          documentInitial.substring(6, 9) +
          '-' +
          documentInitial.substring(9, 11);
      documentSanitized = formattedDocument;
    }
    if (documentInitial.length < 11 || documentInitial.length > 11) {
      documentSanitized = documentInitial;
    }
    return documentSanitized!;
  }

  static double viewDoubleValue({required String value}) {
    var valueSanitized = value
        .replaceAll('R', '')
        .replaceAll('\$', '')
        .replaceAll(' ', '')
        .replaceAll('.', '')
        .replaceAll(',', '.');

    return double.tryParse(valueSanitized)!;
  }

  static String onlyNumberString({required String text}) {
    final regexp = RegExp(r'\D');
    var onlySanitized = text.replaceAll(regexp, '');
    return onlySanitized
        .replaceAll('.', '')
        .replaceAll('/', '')
        .replaceAll('-', '');
  }

  static String onlyText({required String text}) {
    final regexp = RegExp(r'\d');
    var onlyTextSanitized = text.replaceAll(regexp, '');
    return onlyTextSanitized;
  }

  static String onlyNumberFrom8Positions({required String text}) {
    final regexp = RegExp(r'\D');
    var onlyTextSanitized = text.replaceAll(regexp, '');
    switch (onlyTextSanitized.length) {
      case 1:
        onlyTextSanitized = '0000000$onlyTextSanitized';
        break;
      case 2:
        onlyTextSanitized = '000000$onlyTextSanitized';
        break;
      case 3:
        onlyTextSanitized = '00000$onlyTextSanitized';
        break;
      case 4:
        onlyTextSanitized = '0000$onlyTextSanitized';
        break;
      case 5:
        onlyTextSanitized = '000$onlyTextSanitized';
        break;
      case 6:
        onlyTextSanitized = '00$onlyTextSanitized';
        break;
      case 7:
        onlyTextSanitized = '0$onlyTextSanitized';
        break;
      case 8:
        onlyTextSanitized = onlyTextSanitized;
        break;
      default:
        onlyTextSanitized = '';
        break;
    }
    return onlyTextSanitized;
  }
}
