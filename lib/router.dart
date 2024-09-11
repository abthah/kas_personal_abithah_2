import 'package:go_router/go_router.dart';
import 'package:kas_personal/screens/home_screen.dart';
import 'package:kas_personal/screens/kas_keluar_screen.dart';
import 'package:kas_personal/screens/kas_masuk_screen.dart';
import 'package:kas_personal/screens/kas_summary_screen.dart'; // Perhatikan nama file ini jika sudah berubah

final router = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'root',
    builder: (context, state) => const HomeScreen(),
    routes: [
      GoRoute(
        path: 'kas_masuk',
        name: 'kas_masuk',
        builder: (context, state) => const KasMasukScreen(),
      ),
      GoRoute(
        path: 'kas_keluar',
        name: 'kas_keluar',
        builder: (context, state) => const KasKeluarScreen(),
      ),
      GoRoute(
        path: 'kas_summary', // Ubah di sini
        name: 'kas_summary', // Ubah di sini
        builder: (context, state) => const KasSummaryScreen(), // Perhatikan nama file ini jika sudah berubah
      ),
    ],
  ),
]);
