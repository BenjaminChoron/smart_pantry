class RecipeTime {
  RecipeTime({
    this.minutes,
    this.hours,
  });

  final int? minutes;
  final int? hours;

  String get formatted {
    final List<String> parts = [];
    if (hours != null) {
      parts.add('$hours h');
    }
    if (minutes != null) {
      parts.add('$minutes min');
    }
    return parts.join(' ');
  }
}
