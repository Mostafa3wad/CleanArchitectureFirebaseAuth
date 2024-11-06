# 🎬 Cineb - Login Application

Cineb is a Flutter application built with **Clean Architecture** and Firebase for user authentication. This app offers a simple and intuitive UI with screens for **Login**, **Sign Up**, **Forget Password**, **Verify Code**, and **Sign Out**.

---

## 📱 Screenshots

| Login Screen                           | Sign Up Screen                            | Forget Password                                            | Verify Code Screen                                 |
| -------------------------------------- | ----------------------------------------- | ---------------------------------------------------------- | -------------------------------------------------- |
| ![Login Screen]([screenshots/login.png](https://github.com/Mostafa3wad/CleanArchitectureFirebaseAuth/blob/main/assets/app/login.png?raw=true)) | ![Sign Up Screen]([screenshots/signup.png](https://github.com/Mostafa3wad/CleanArchitectureFirebaseAuth/blob/main/assets/app/sign%20up.png?raw=true)) | ![Forget Password Screen]([screenshots/forget_password.png](https://github.com/Mostafa3wad/CleanArchitectureFirebaseAuth/blob/main/assets/app/forget%20password.png?raw=true)) | ![Verify Code Screen]([screenshots/verify_code.png](https://github.com/Mostafa3wad/CleanArchitectureFirebaseAuth/blob/main/assets/app/verify%20code.png?raw=true)) |



---

## 🚀 Features

- **Login**: Log in with email and password.
- **Sign Up**: Register a new account with email and password.
- **Forget Password**: Reset your password if forgotten.
- **Verify Code**: Confirm your account using a verification code.
- **Sign Out**: Log out from the application.

## 🛠️ Technologies Used

- **Flutter**: For cross-platform mobile development.
- **Firebase Authentication**: Manages user authentication.
- **Dartz**: Functional programming support for more reliable and expressive code handling.
- **Clean Architecture**: Structured code with clear separation of concerns, ensuring scalability and maintainability.

---

## 📂 Project Structure

The project follows **Clean Architecture** principles, organizing the codebase into distinct layers:

```plaintext
lib/
├── core/                  # Core utilities and constants
├── features/              # Main features of the app
│   ├── forget_password/   # forget password feature
│   │   ├── data/          # Data sources and repositories
│   │   ├── domain/        # Entities, use cases, and repository interfaces
│   │   └── presentation/  # UI screens and state management
│   ├── login/             # Log in feature
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── sign up/           # Sign up feature
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── verify code/       # verify code feature
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   ├── sign out/          # sign out feature
│   │   ├── data/
│   │   ├── domain/
│       └── presentation/
└── main.dart              # Main entry point
```
