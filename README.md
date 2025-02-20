ToDo List App with Firebase Authentication

Overview
This is a simple Flutter-based ToDo List application with Firebase Authentication. Users can register, log in, and manage their tasks efficiently. The app allows adding, marking, and deleting tasks while ensuring a smooth user experience.

Features
- **User Authentication** (Firebase Authentication: Register, Login, Logout)
- **Task Management**
  - Add new tasks
  - Mark tasks as completed
  - Delete tasks
- **Real-time Updates**
- **User-friendly UI**

Technologies Used
- **Flutter** (Dart)
- **Firebase Authentication**
- **Firebase Core**
- **Material Design UI**

Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/todolist.git
   ```
2. Navigate to the project directory:
   ```sh
   cd todolist
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Connect Firebase to your Flutter app:
   - Set up Firebase in your Firebase console.
   - Download the `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) and place them in the respective directories.

5. Run the app:
   ```sh
   flutter run
   ```

## Project Structure
```
📂 lib
 ├── 📂 Model
 │   ├── todo.dart
 ├── 📂 Screens
 │   ├── home_page.dart
 │   ├── auth_page.dart
 ├── 📂 Widgets
 │   ├── todo_items.dart
 ├── 📂 Firebase
 │   ├── firebase_options.dart
 ├── main.dart
```

Usage
1. **Sign In/Register** to access the ToDo List.
2. **Add New Task** using the input field at the bottom.
3. **Mark Tasks** as complete by tapping on them.
4. **Delete Tasks** using the delete icon.
5. **Logout** using the logout button on the top right.

Future Enhancements
- Cloud Firestore integration for persistent data storage.
- Dark mode support.
- Push notifications for reminders.
