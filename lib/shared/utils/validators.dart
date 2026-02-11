class Validators {
  static String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
      return 'Invalid email';
    }
    return null;
  }

  static String? Function(String?) min(int length) {
    return (String? value) {
      if (value == null || value.length < length) {
        return 'Minimum $length characters required';
      }
      return null;
    };
  }

  static String? Function(String?) max(int length) {
    return (String? value) {
      if (value == null || value.length > length) {
        return 'Maximum $length characters allowed';
      }
      return null;
    };
  }
}
