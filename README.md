## Flutter Counter with Login

This project demonstrates a simple Flutter application that integrates Firebase for user authentication and data storage. The app allows users to:

- Sign in using Google authentication.
- Store and retrieve data to a Firebase Realtime Database.
- Track the number of times a user interacts with a button.

### Functionality Breakdown

**1. Authentication:**

- The app utilizes Google Sign-In to authenticate users.
- Upon successful sign-in, the user's data (like display name) is stored in the Firebase Realtime Database.

**2. Data Storage:**

- The app uses Firebase Realtime Database for storing and retrieving user data.
- The counter value is associated with the user's UID in the database.

**3. User Interface:**

- The `MyHomePage` displays the current counter value and the user's name.
- The app utilizes Flutter's Material Design components for a visually appealing interface.

### Running the App

1. **Setup:**
   - Install Firebase CLI (if not already installed): `npm install -g firebase-tools`
   - Create a Firebase project and enable Google Sign-In.
   - Set up your Firebase project in the Flutter app by adding the Firebase configuration file `firebase_options.dart`.
2. **Install Dependencies:**
   - `flutter pub get`
3. **Run the App:**
   - `flutter run`

### Conclusion

This project provides a basic framework for building Flutter apps that utilize Firebase authentication and database functionalities. By extending this codebase, you can create more sophisticated applications with richer user experiences.
