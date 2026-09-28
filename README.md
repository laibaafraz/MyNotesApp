# 📝 My Notes App

A simple, clean notes app built with **Flutter** as a beginner learning project. Create, view, edit, and delete notes in a minimal amber-themed interface.

## Features

- **Splash screen** that shows for 3 seconds before opening the app
- **Create notes** with a title and a description
- **View notes** on a dedicated read-only screen
- **Edit notes** from the view screen using the edit button
- **Delete notes** with the trash icon on each note
- **Empty state message** when there are no notes yet

## Screens

| Screen | File | Purpose |
|---|---|---|
| Splash | `splashscreen.dart` | App intro, then opens Home |
| Home | `homescreen.dart` | Lists all notes, add and delete |
| Create / Edit | `createnotesscreen.dart` | Form to write or update a note |
| View | `viewnotescreen.dart` | Read a note, with an edit button |

## Project Structure

```
lib/
 ├── main.dart                     # App entry point and theme
 ├── models/
 │    └── notes.dart               # Note model (title, content)
 └── screens/
      ├── splashscreen.dart
      ├── homescreen.dart
      ├── createnotesscreen.dart
      └── viewnotescreen.dart
```

## How It Works

1. `main.dart` launches the app on the **Splash screen**.
2. After 3 seconds, the splash uses `Navigator.pushReplacement` to open **Home**, so Back doesn't return to it.
3. On **Home**, the **+** button opens the Create screen and waits for the result with `await Navigator.push(...)`.
4. When you tap **Save**, `Navigator.pop(context, note)` sends the new note back to Home, which adds it to its list and refreshes with `setState`.
5. Tapping a note opens the **View screen**. Its edit button opens the Create screen pre-filled with that note, and the updated note is passed back through View to Home.

## Concepts Practiced

- `StatelessWidget` vs `StatefulWidget`
- `setState` for updating the UI
- `TextEditingController` for reading text fields
- `ListView.builder` and `ListTile`
- Navigation with `push`, `pop`, and `pushReplacement`
- Passing data between screens and returning results
- Custom models (the `Note` class)
- Styling with `TextStyle`, colors, and `ThemeData`

## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed
- An emulator, a physical device, or Chrome for web

### Run the app

```bash
git clone <your-repo-url>
cd notesapp
flutter pub get
flutter run
```

Run `flutter doctor` first if anything fails, to check your setup.

## Tech Stack

- **Flutter** (Material 3)
- **Dart**
- No external packages

## Known Limitations

- Notes are stored **in memory only**, so they disappear when the app is closed.

## Future Improvements

- Save notes permanently with `shared_preferences` or `sqflite`
- Search notes
- Confirmation dialog before deleting
- Dark mode
- Show the date and time on each note
- Scrolling support for very long notes on the View screen

## Author

Built by **<your laiba afraz>** while learning Flutter.
