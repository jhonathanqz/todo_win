abstract class SettingsExceptions implements Exception {
  final String message;

  SettingsExceptions(this.message);
}

class SettingsNotFound extends SettingsExceptions {
  SettingsNotFound(String message) : super(message);
}

class UnableToSetSettings extends SettingsExceptions {
  UnableToSetSettings(String message) : super(message);
}

class UpdateErrorSettings extends SettingsExceptions {
  UpdateErrorSettings(String message) : super(message);
}

class DeleteErrorSettings extends SettingsExceptions {
  DeleteErrorSettings(String message) : super(message);
}
