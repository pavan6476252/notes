# Flutter Notes App

This is a simple Flutter app for managing notes. It allows users to create, update, and delete notes.

## Features

- Display a list of notes
- Add a new note
- Edit an existing note
- Delete a note

## Getting Started

To get started with the Flutter Notes App, follow these steps:

1. Install Flutter SDK on your machine. You can find detailed instructions in the [Flutter documentation](https://flutter.dev/docs/get-started/install).
2. Clone this repository: `git clone https://github.com/pavan6476252/notes`
3. Navigate to the project directory: `cd notes`
4. Install dependencies: `flutter pub get`
5. Run the app: `flutter run`

## Dependencies

The Flutter Notes App relies on the following dependencies:

- `flutter_bloc`: State management library for Flutter
- `cloud_firestore`: Firestore database integration for Flutter

## Project Structure

The project follows a modular structure and consists of the following files and directories:

- `lib/`: Contains the main Dart code for the app
  - `nnotes_model.dart`: Defines the `Note` model class
  - `note_event.dart`: Defines the events used by the `NotesBloc`
  - `note_state.dart`: Defines the states used by the `NotesBloc`
  - `note_bloc.dart`: Implements the `NotesBloc` for managing notes
  - `notes_screen.dart`: The main screen that displays the list of notes
  - `add_note_screen.dart`: Screen for adding a new note
  - `edit_note_screen.dart`: Screen for editing an existing note
- `pubspec.yaml`: Contains the project dependencies and other metadata

## How It Works

The app uses the BLoC (Business Logic Component) pattern for state management. It utilizes the `flutter_bloc` package to handle the communication between the UI and the data layer.

The `NotesBloc` class is responsible for managing the state of the notes. It handles events such as loading notes, adding a new note, updating a note, and deleting a note. The corresponding states are emitted to notify the UI about the current state of the notes.

The UI is built using Flutter's widget tree. The `NotesScreen` widget displays the list of notes using a `GridView.builder` and listens to the state changes from the `NotesBloc` using the `BlocBuilder` widget. It also provides options to add, edit, and delete notes.

The `AddNoteScreen` and `EditNoteScreen` widgets are used for adding a new note and editing an existing note, respectively. They contain forms for inputting the note details and use the `NotesBloc` to dispatch the corresponding events.

## Contribution

Contributions to the Flutter Notes App are welcome! If you find any issues or want to add new features, feel free to create a pull request.

## License

The Flutter Notes App is open-source software licensed under the [MIT license](LICENSE).
