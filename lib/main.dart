import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/app_config.dart';
import 'config/dependency_injector.dart';
import 'screens/home_screen.dart';
import 'utils/app_logger.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  if (!AppConfig.isConfigured()) {
    AppLogger.warning(
      'Konfigurasi .env tidak lengkap. Periksa file .env Anda.',
    );
  }

  DependencyInjector.apiService;

  AppLogger.debug('Pesan debug');
  AppLogger.info('Aplikasi dijalankan');
  AppLogger.warning('Peringatan aplikasi');
  AppLogger.error('Terjadi kesalahan');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RPL & Keamanan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}