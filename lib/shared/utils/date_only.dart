class DateOnly {
  final int year;
  final int month;
  final int day;

  DateOnly(this.year, this.month, this.day);

  // Crear desde un DateTime
  factory DateOnly.fromDateTime(DateTime dateTime) {
    return DateOnly(dateTime.year, dateTime.month, dateTime.day);
  }

  // Convertir a DateTime
  DateTime toDateTime() {
    return DateTime(year, month, day);
  }

  @override
  String toString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }
}
