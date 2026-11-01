import '../models/post_model.dart';

class PostService {
  Future<List<Post>> getPosts() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return [
      Post(
        id: 1,
        title: 'Morning Coffee Routine',
        body:
            'I start every day with a quiet cup of coffee and a short walk before opening my laptop. It helps me feel calm and ready to focus on the day ahead.',
        userId: 1,
      ),
      Post(
        id: 2,
        title: 'A Weekend in the City',
        body:
            'This weekend I spent time exploring the city center, visiting a small café, and enjoying the fresh air. It was a simple but refreshing break from routine.',
        userId: 2,
      ),
      Post(
        id: 3,
        title: 'Planning a Better Week',
        body:
            'I wrote down my priorities for the week and set aside time for the most important tasks first. A clear plan makes the workload feel much more manageable.',
        userId: 3,
      ),
      Post(
        id: 4,
        title: 'Learning Something New',
        body:
            'I dedicated an hour to a new skill and realized that small, consistent effort leads to real progress over time. It is encouraging to see how much can improve with patience.',
        userId: 4,
      ),
      Post(
        id: 5,
        title: 'Evening Reading Habit',
        body:
            'Before bed, I read a few pages of a book instead of scrolling on my phone. It helps me unwind and sleep more deeply after a busy day.',
        userId: 5,
      ),
    ];
  }
}
