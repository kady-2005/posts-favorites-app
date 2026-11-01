Hive Local NoSQL Storage - Posts App
📝 Overview
This project is a Flutter application built to demonstrate local NoSQL storage using Hive. It converts a standard online-only API app into an offline-capable app. The app fetches posts from jsonplaceholder.typicode.com, caches them locally using Hive, and displays the cached data when the device is offline. Additionally, it includes a Favorites feature that persists across app restarts and works completely offline.

✨ Features
Online Data Fetching: Fetches a list of posts from a REST API.

Offline Caching: Saves the fetched posts to a Hive box (postsBox). If the network fails, it automatically falls back to displaying the cached data.

Favorites System: Users can tap a star icon to add/remove posts from their favorites.

Offline Favorites: Favorites are saved in a separate Hive box (favoritesBox), meaning they are never wiped out when the main posts list refreshes, and they persist even in airplane mode.

Empty State UI: Friendly message displayed when the Favorites screen is empty.

🛠️ Tech Stack
Framework: Flutter

Local Database: Hive & Hive Flutter

Network: HTTP package

State Management: ValueListenableBuilder (for reactive UI updates when favorites change)

📸 Screenshots
Below are screenshots demonstrating the app's features and offline capabilities.

1. Online Mode & Post List
The app fetches data from the API and displays it. The stars show which posts are currently favorited.

(Insert Screenshot here: App running with internet, showing the list of posts and some filled yellow stars)

2. Adding a Favorite
Tapping the outlined star turns it yellow and saves it to the Hive database instantly.

(Insert Screenshot here: Mid-action or showing a post that just had its star clicked to turn yellow)

3. Favorites Screen
Accessed via the star icon in the AppBar. Displays only the posts that were starred.

(Insert Screenshot here: The Favorites screen showing 2-3 saved posts)

4. Empty Favorites State
When no posts are favorited, the app shows a friendly message.

(Insert Screenshot here: The Favorites screen showing the "No favorites yet" text)

5. Offline Mode (Airplane Mode)
The app is closed, Airplane mode is turned on, and the app is reopened. It successfully loads the cached posts and favorites from Hive.

(Insert Screenshot here: An emulator/device with the Airplane mode icon visible in the status bar, showing the app loaded with data)

🚀 How to Run
Clone the repository:

bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
Install dependencies:

bash
flutter pub get
Generate Hive Adapters:
If you make any changes to the models, you need to regenerate the Hive adapters:

bash
dart run build_runner build --delete-conflicting-outputs
Run the app:

bash
flutter run
📂 Project Structure
text
lib/
│
├── main.dart                  # Initializes Hive, registers adapters, opens boxes
│
├── models/
│   ├── post_model.dart        # Post class with @HiveType annotations
│   └── post_model.g.dart      # Generated Hive adapter
│
├── services/
│   ├── post_service.dart      # Handles API fetching and Hive caching for posts
│   └── favorites_service.dart # Handles toggling and retrieving favorites
│
└── screens/
    ├── posts_screen.dart      # Main UI, displays posts and star buttons
    └── favorites_screen.dart  # UI for displaying saved favorites
🧠 Key Learnings
Hive vs. SharedPreferences: Hive is significantly faster for storing lists of complex Dart objects compared to storing JSON strings in SharedPreferences.

HiveObject Constraints: A single HiveObject cannot be saved in two different boxes at the same time. To save a post to the favoritesBox while it exists in the postsBox, a copy must be made.

Reactive UI: Using ValueListenableBuilder with Hive's .listenable() allows the UI to react instantly to database changes without needing complex state management solutions.

Created as part of the Mobile App Development Lab (Section 5).

