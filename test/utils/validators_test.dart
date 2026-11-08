import 'package:flutter_test/flutter_test.dart';
import '../../lib/utils/validators.dart';

void main() {
  group('Validators Test', () {
    test('Email valid', () {
      expect(Validators.isValidEmail('niswa@gmail.com'), true);
    });

    test('Email tidak valid', () {
      expect(Validators.isValidEmail('niswa123'), false);
    });

    test('Sanitize input berbahaya', () {
      final result = Validators.sanitize('<script>alert("test")</script>');

      expect(result, '&lt;script&gt;alert(&quot;test&quot;)&lt;/script&gt;');
    });

    test('Text tidak boleh kosong', () {
      expect(Validators.validateText(''), 'Field tidak boleh kosong');
    });

    test('Text dengan panjang valid', () {
      expect(Validators.validateText('Niswa'), null);
    });

    test('Text terlalu panjang', () {
      expect(
        Validators.validateText(
          'Ini adalah teks yang terlalu panjang',
          maxLength: 10,
        ),
        'Field harus antara 1-10 karakter',
      );
    });
  });
}