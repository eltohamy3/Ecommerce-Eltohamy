String convertTimeUnits(int minutes) {
  if (minutes < 0) {
    return "Invalid input: time cannot be negative.";
  }

  const int minutesPerHour = 60;
  const int hoursPerDay = 24;
  const int daysPerWeek = 7;
  const int daysPerYear = 365;
  const int weeksPerYear = 52;
  const int minutesPerDay = minutesPerHour * hoursPerDay;
  const int minutesPerWeek = minutesPerDay * daysPerWeek;
  const int minutesPerYear = minutesPerDay * daysPerYear;

  int years = minutes ~/ minutesPerYear;
  int remainingMinutes = minutes % minutesPerYear;

  int weeks = remainingMinutes ~/ minutesPerWeek;
  remainingMinutes %= minutesPerWeek;

  int days = remainingMinutes ~/ minutesPerDay;
  remainingMinutes %= minutesPerDay;

  int hours = remainingMinutes ~/ minutesPerHour;
  remainingMinutes %= minutesPerHour;

  // Create a list to store each part of the time
  List<String> timeParts = [];

  if (years > 0) timeParts.add("$years year${years > 1 ? 's' : ''}");
  if (weeks > 0) timeParts.add("$weeks week${weeks > 1 ? 's' : ''}");
  if (days > 0) timeParts.add("$days day${days > 1 ? 's' : ''}");
  if (hours > 0) timeParts.add("$hours hour${hours > 1 ? 's' : ''}");
  if (remainingMinutes > 0) timeParts.add("$remainingMinutes minute${remainingMinutes > 1 ? 's' : ''}");

  if (timeParts.isEmpty) {
    return "0 minutes";
  }
  return timeParts.join(" and ");
}
