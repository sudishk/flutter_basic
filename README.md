# flutter_basic

This project contains the code of a Flutter tutorial from basic to advanced, step by step.

This repository contains code for basic Flutter widgets and their usage, as well as code examples inspired by or adapted from YouTube video tutorials. It is designed to help beginners and those new to Flutter learn by example, progressing from basic to advanced concepts.

## Features

- Examples of basic and advanced Flutter widgets
- Reference code for YouTube tutorials
- Step-by-step progression from basics to advanced topics
- Cross-platform setup with files for Linux and Windows builds
- Organized project structure for easy navigation

## Getting Started

To run this project, ensure you have [Flutter](https://flutter.dev/docs/get-started/install) installed on your system.

### 1. Clone the repository

```sh
git clone https://github.com/sudishk/flutter_basic.git
cd flutter_basic
```

### 2. Install dependencies

```sh
flutter pub get
```

### 3. Run the app

- For mobile:  
  ```sh
  flutter run
  ```
- For desktop (Windows or Linux):  
  Ensure you have enabled desktop support for Flutter.  
  ```sh
  flutter config --enable-windows-desktop
  flutter config --enable-linux-desktop
  flutter run -d windows  # or -d linux
  ```

## Project Structure

- `lib/` – Main Dart source files for widgets and app logic
- `windows/`, `linux/` – Platform-specific build files
- `README.md` – Project documentation (this file)

## Contribution

Pull requests are welcome! You can feel free to contribute code examples, improvements, or additional tutorials.

## License

This project currently does not specify a license. Please get in touch with the repository owner for usage permissions.

## Author

- [sudishk](https://github.com/sudishk)

---

*Happy Fluttering!*
