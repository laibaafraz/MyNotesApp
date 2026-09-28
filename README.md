# 📝 My Notes App

A simple, clean notes app built with **Flutter** as a beginner learning project. Create, view, edit, and delete notes in a minimal amber-themed interface. Your notes are **saved on the device**, so they are still there when you reopen the app.

## Features

- **Splash screen** that shows for 3 seconds before opening the app
- **Create notes** with a title and a description
- **View notes** on a dedicated read-only screen
- **Edit notes** from the view screen using the edit button
- **Delete notes** with the trash icon on each note
- **Persistent storage**: notes are saved locally with `shared_preferences`
- **Empty state message** when there are no notes yet

## Screens

| Screen | File | Purpose |
|---|---|---|
| Splash | `splashscreen.dart` | App intro, then opens Home |
| Home | `homescreen.dart` | Lists all notes, add and delete, saves and loads data |
| Create / Edit | `createnotesscreen.dart` | Form to write or update a note |
| View | `viewnotescreen.dart` | Read a note, with an edit button |

## Project Structure

```
lib/
 ├── main.dart                     # App entry point and theme
 ├── models/
 │    └── notes.dart               # Note model (title, content, toMap/fromMap)
 └── screens/
      ├── splashscreen.dart
      ├── homescreen.dart
      ├── createnotesscreen.dart
      └── viewnotescreen.dart
```

## How It Works

1. `main.dart` launches the app on the **Splash screen**.
2. After 3 seconds, the splash uses `Navigator.pushReplacement` to open **Home**, so Back doesn't return to it.
3. When Home opens, `loadNotes()` reads the saved notes from the device.
4. The **+** button opens the Create screen and waits for the result with `await Navigator.push(...)`.
5. Tapping **Save** sends the note back with `Navigator.pop(context, note)`. Home adds it to its list, refreshes with `setState`, and calls `saveNotes()`.
6. Tapping a note opens the **View screen**. Its edit button opens the Create screen pre-filled with that note, and the updated note is passed back through View to Home and saved.
7. Deleting a note removes it from the list and saves the updated list.

### How saving works

`shared_preferences` can only store simple values, so the whole notes list is converted to a JSON string:

- **Saving:** each `Note` becomes a map with `toMap()`, the list is encoded with `jsonEncode`, and stored under the key `notes`.
- **Loading:** the string is read back, decoded with `jsonDecode`, and each map becomes a `Note` again with `Note.fromMap()`.

## Concepts Practiced

- `StatelessWidget` vs `StatefulWidget`
- `setState` for updating the UI
- `TextEditingController` for reading text fields
- `ListView.builder` and `ListTile`
- Navigation with `push`, `pop`, and `pushReplacement`
- Passing data between screens and returning results
- Custom models with `toMap()` and `fromMap()`
- Local storage with `shared_preferences`
- JSON encoding and decoding
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
- [`shared_preferences`](https://pub.dev/packages/shared_preferences) for local storage

## Known Limitations

- `shared_preferences` is meant for small amounts of data. If the app grows to hundreds of notes, a database such as `sqflite` or `hive` would be a better fit.
- On the web, notes are stored in the browser, so clearing browser data will erase them.

## Future Improvements

- Search notes
- Confirmation dialog before deleting
- Dark mode
- Show the date and time on each note
- Scrolling support for very long notes on the View screen
- Move storage to `sqflite` or `hive`

## Author

Built by **<laibaafraz>** while learning Flutter.
