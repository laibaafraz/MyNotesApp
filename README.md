# 📝 My Notes App

A clean and simple notes app built with **Flutter**. You can create, view, edit, and delete notes in an amber-themed interface. Notes are saved on your device with `shared_preferences`, so they are still there when you reopen the app.

## Features

- **Splash screen** with an animated loader before the app opens
- **Add notes** with a title and a description
- **View notes** on a separate, easy-to-read screen
- **Edit notes** using the edit button on the view screen
- **Delete notes** with the trash icon on each note
- **Saved storage**: notes stay after the app is closed
- **Empty state message** when there are no notes yet

## Screens

| Screen | File | What it does |
|---|---|---|
| Splash | `splashscreen.dart` | Shows the intro, then opens Home |
| Home | `homescreen.dart` | Lists notes, adds and deletes them, saves and loads data |
| Create / Edit | `createnotesscreen.dart` | Form for writing or updating a note |
| View | `viewnotescreen.dart` | Shows a full note with an edit button |

## Project Structure

```
lib/
 ├── main.dart
 ├── models/
 │    └── notes.dart
 └── screens/
      ├── splashscreen.dart
      ├── homescreen.dart
      ├── createnotesscreen.dart
      └── viewnotescreen.dart
```

## How It Works

1. The app starts on the splash screen, then moves to Home after 3 seconds.
2. Home loads the saved notes from the device.
3. The **+** button opens the Create screen. When you tap **Save**, the note is sent back to Home and added to the list.
4. Tapping a note opens the View screen. Its edit button opens the Create screen with the note already filled in.
5. Every time a note is added, edited, or deleted, the list is saved again.

**Saving:** each note is turned into a map with `toMap()`, the whole list is stored as a JSON string, and on startup it is read back into notes with `fromMap()`.

## What I Learned

- Stateless and stateful widgets
- `setState` to update the screen
- `ListView.builder` and `ListTile`
- Navigation: `push`, `pop`, and `pushReplacement`
- Passing data between screens
- Saving data locally with `shared_preferences`

## Getting Started

Make sure [Flutter](https://docs.flutter.dev/get-started/install) is installed, then:

```bash
git clone <your-repo-url>
cd notesapp
flutter pub get
flutter run
```

## Built With

- Flutter
- Dart
- shared_preferences

## Future Ideas

- Search notes
- Dark mode
- Confirm before deleting
- Show the date on each note

## Author
Built by  laiba afraz while learning flutter 
