# 🛍️ Shopping App (Flutter)

### **2️⃣ Install Dependencies**
```sh
flutter pub get
```
 
### ** Run the Flutter App**
```sh
flutter run
```
or for specific devices:
```sh
flutter run -d ios    # For iOS
flutter run -d android  # For Android
```

---

## 🛠 **Code Generation (build_runner.sh)**

This project uses **`build_runner`** for generating necessary code files (e.g., Freezed, JsonSerializable, etc.).

To automatically generate code while developing, run:
```sh
sh build_runner.sh
```

or manually run:
```sh
flutter pub run build_runner watch --delete-conflicting-outputs
```

If you only need to generate the code once:
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📂 **Project Structure**
```plaintext
lib/
│── configs/           # Configuration files
│── data/              # Data layer (Repositories, Models, Datasources)
│   ├── datasource/    # API & Local Storage sources
│   ├── models/        # Data models
│   ├── repositories/  # Repository layer
│── domain/            # Business logic layer
│   ├── entities/      # Core domain models
│   ├── usecases/      # UseCases for business rules
│── hooks/             # Custom hooks
│── presentation/      # UI layer (Screens, Notifiers, Widgets)
│   ├── screens/       # App Screens
│   ├── notifiers/     # State management (Riverpod, Provider, etc.)
│   ├── providers/     # Dependency Injection providers
│   ├── widgets/       # Reusable widgets
│── shared/            # Shared utilities and extensions
│── routers/           # App navigation setup
│── main.dart          # Main entry point of the app
```

---

## 🧪 **Running Tests**
To run the unit tests:
```sh
flutter test
```

---