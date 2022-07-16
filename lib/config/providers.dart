import 'package:hooks_riverpod/hooks_riverpod.dart';

final bookmarksProvider = StateProvider<List>((ref) => []);
final colorProvider = StateProvider<String>((ref) => 'light');
