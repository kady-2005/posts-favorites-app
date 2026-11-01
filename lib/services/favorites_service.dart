import 'package:hive/hive.dart';

import '../models/post_model.dart';

class FavoritesService {
  final Box<Post> _favoritesBox = Hive.box<Post>('favoritesBox');

  Future<void> toggleFavorite(Post post) async {
    if (isFavorite(post.id)) {
      await _favoritesBox.delete(post.id);
    } else {
      final Post favoriteCopy = Post(
        id: post.id,
        title: post.title,
        body: post.body,
        userId: post.userId,
      );

      await _favoritesBox.put(post.id, favoriteCopy);
    }
  }

  bool isFavorite(int id) {
    return _favoritesBox.containsKey(id);
  }

  List<Post> getFavorites() {
    return _favoritesBox.values.toList();
  }
}
