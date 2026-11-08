
/// Kumpulan fungsi validasi dan sanitasi input.
class Validators {
  // Validasi email
  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  // Validasi input tidak kosong
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  // Validasi panjang teks
  static bool hasValidLength(
    String value, {
    int min = 1,
    int max = 100,
  }) {
    final length = value.trim().length;
    return length >= min && length <= max;
  }

  // Sanitasi input
  static String sanitize(String input) {
    return input
        .replaceAll('&', '&amp;')
        .replaceAll('<', '&lt;')
        .replaceAll('>', '&gt;')
        .replaceAll('"', '&quot;')
        .replaceAll("'", '&#39;')
        .trim();
  }

  // Validasi teks
  static String? validateText(
    String? value, {
    String fieldName = 'Field',
    int minLength = 1,
    int maxLength = 100,
  }) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName tidak boleh kosong';
    }

    if (!hasValidLength(
      value,
      min: minLength,
      max: maxLength,
    )) {
      return '$fieldName harus antara $minLength-$maxLength karakter';
    }

    return null;
  }

  // Validasi email
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email tidak boleh kosong';
    }

    if (!isValidEmail(value.trim())) {
      return 'Format email tidak valid';
    }

    return null;
  }

  // Validasi nomor telepon (10-13 digit)
  static String? validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return 'Nomor telepon tidak boleh kosong';
    }

    if (!RegExp(r'^\d{10,13}$').hasMatch(phone.trim())) {
      return 'Nomor telepon harus 10-13 digit';
    }

    return null;
  }

  // Validasi URL
  static String? validateUrl(String? url) {
    if (url == null || url.trim().isEmpty) {
      return 'URL tidak boleh kosong';
    }

    final uri = Uri.tryParse(url.trim());

    if (uri == null ||
        !uri.hasAuthority ||
        !['http', 'https'].contains(uri.scheme)) {
      return 'URL harus menggunakan http atau https';
    }

    return null;
  }

  // Validasi password
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password tidak boleh kosong';
    }

    if (password.length < 8) {
      return 'Password minimal 8 karakter';
    }

    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return 'Password harus memiliki huruf besar';
    }

    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return 'Password harus memiliki angka';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=/\\]').hasMatch(password)) {
      return 'Password harus memiliki simbol';
    }

    return null;
  }
}
