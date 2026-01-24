import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_basic/post_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:http/http.dart' as http;
import 'counter_notifier.dart';
import 'counter_state.dart';

final postsProvider = FutureProvider<List<PostModel>>((ref) async {
  return fetchPosts();
});
final counterProvider = StateProvider<int>((ref) => 0);
final counterNotifierProvider = StateNotifierProvider<CounterNotifier, CounterState>((ref) => CounterNotifier(),);
void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsync = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("JSONPlaceholder API")),
      body: postsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text(error.toString())),
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, index) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          );
        },
      ),
    );
  }
}
Future<List<PostModel>> fetchPosts() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );

  if (response.statusCode == 200) {
    final List data = jsonDecode(response.body);
    return data.map((e) => PostModel.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load posts');
  }
}