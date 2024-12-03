# Reminders App

Design Task: [Figma](https://www.figma.com/proto/YCX4NqsSChe7M72dVvG9qY/Sabya-Tech---Task?node-id=0-1&node-type=canvas&t=s5jPx7OlyD9gJscR-0&scaling=min-zoom&content-scaling=fixed&page-id=0:1)

This is a simple Flutter application that allows users to manage reminders. The app includes features to add new reminders, view a list of reminders, and mark them as completed.

## Features

- Add a new reminder with a custom date and time.
- View a list of existing reminders with the ability to mark them as completed.
- The app uses `Checkbox` to toggle the completion status of a reminder.
- The date and time of reminders are displayed in a user-friendly format.

## Prerequisites

Before running the application, make sure you have the following tools installed on your machine:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)
- [Xcode](https://developer.apple.com/xcode/) (for iOS development)
  
## Installation Steps

Follow these steps to set up the project on your local machine.

### 1. Clone the repository

Clone the project repository to your local machine using the following command:

```bash
git clone https://github.com/tuhinaww/reminders_app.git
```
### 2. Navigate to the project directory

Go into the project folder:

```bash
cd reminders_app
```
### 3. Install dependencies

Run the following command to fetch the required packages for the project:

```bash
flutter pub get
```
### 4. Run the app

Once the dependencies are installed, you can run the app using either of the following methods:

```bash
flutter run
```

## Usage

Once the app is running, you will be able to:

- **Add Reminders**: Tap on the floating action button (+) to add a new reminder with a custom date and time.
- **Mark Reminders as Completed**: You can mark a reminder as completed by ticking the checkbox next to the reminder.
- **View Reminder Details**: Each reminder displays the reminder text, date, and time.

## Dependencies

The app uses the following packages:

- `flutter/material.dart`: For building the UI.
- `intl`: For formatting dates.

You can find these dependencies in the `pubspec.yaml` file.