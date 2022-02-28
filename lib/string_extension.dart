extension StringExtension on String {
  String get capitalize =>
      '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  String get capitalizeFirstOfEach =>
      split(' ').map((str) => str.trim() == '' ? '' : str.capitalize).join(' ');

  String get capitalizeSpace => split(' ')
      .map((str) => str.trim() == '' ? ' ' : str.capitalize)
      .join('\n');
}
