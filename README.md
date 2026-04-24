# Expense Tracker

A clean and intuitive Flutter application for tracking daily expenses and improving personal financial awareness.

The app allows users to quickly record spending with a title, amount, and date, and instantly view all expenses along with an automatically updated total.

## Features

* Add new expenses using a bottom sheet form
* Select dates with an integrated date picker
* View all expenses in a scrollable list
* Delete expenses and update totals instantly
* Real-time calculation of total spending
* Simple and beginner-friendly architecture

## Tech Stack

* Flutter (UI framework)
* Dart (programming language)
* Material Design (UI components)

## App Flow

1. Tap the `+` floating action button
2. Enter title and amount, then choose a date
3. Submit the form to add the expense
4. The expense appears instantly in the list and updates the total
5. Tap the delete icon to remove an expense

## Project Structure

```text
lib/
  main.dart                 # App entry point
  models/
    expense.dart            # Expense data model
  screens/
    home_screen.dart        # Main screen (total + list)
  widgets/
    add_expense.dart        # Bottom sheet form
    expense_item.dart       # Expense list item
```

## Getting Started

### Prerequisites

* Flutter SDK
* Dart SDK (included with Flutter)
* Android Studio / VS Code
* Emulator or physical device

### Installation

```bash
git clone https://github.com/<your-username>/<your-repo-name>.git
cd expense_tracker
flutter pub get
flutter run
```

## Notes

* Data is currently stored in memory (no persistence yet)
* Restarting the app will clear all expenses

## Future Improvements

* Local database integration (Hive / SQLite)
* Expense categories and filtering
* Analytics dashboard with charts
* Edit/update expense entries
* Budget planning features

## Contributing

Contributions, issues, and feature suggestions are welcome.

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Open a pull request

## License

This project is licensed under the MIT License.
