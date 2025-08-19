# Flutter Project Documentation

- Project Name: My Flynn
- Architecture: Layered MVVM with GetX
- State Management: GetX Reactive Pattern

# Table of Contents

- Project Structure
- State Management
- Dependency Management
- Key Flows
- Installation & Run Instructions
- Strength
- Critical Dependencies
- Version Compatibility
- Document Information

# Project Structure

## Feature-First Modular Architecture

lib/
├── presentation/ # UI Layer
│ ├── screen/ # Feature module
│ │ ├── controller/ # GetX controllers
│ │ ├── model/ # DTOs & ViewModels
│ │ ├── service/ # Business logic
│ │ ├── view/ # Screens
│ │ └── widget/ # Reusable components
│ └── utils/ # Helpers & extensions
├── core/ # Core abstractions
│ ├── permission_enum.dart  
│ └── route.dart # Navigation config
├── common_widgets/ # Shared UI components
└── generated/ # Code-gen assets

## Key Characteristics

- Separation of Concerns: Clear division between UI, business logic, and data
- Reactive UI: Obx() for automatic widget rebuilds
- Feature Isolation: Self-contained modules (campaign, profile, etc.)
- Dependency Injection: GetX bindings for controller initialization

# State Management

## GetX Reactive Pattern

```dart
// ViewModel with reactive properties
class CampaignViewModel {
  final appliedList = Case<List<CampaignResp>>().obs;
  final inProgressList = Case<List<CampaignResp>>().obs;
  final completedList = Case<List<CampaignResp>>().obs;
}

// Controller with state logic
class CampaignController extends GetxController {
  @override
  void onInit() {
    getAppliedList(); // Initial data fetch
    super.onInit();
  }

  Future<void> getAppliedList() async {
    viewModel.appliedList.value = LoadingCase();
    final result = await campaignService.getApplied();
    viewModel.appliedList.value = LoadedCase(result);
  }
}

// UI Binding
Obx(() {
  final state = controller.viewModel.appliedList.value;
  return state is LoadingCase ? LoadingWidget() : CampaignList(data: state.data);
})
```

## State Wrapper (Case<T>)

```dart
class Case<T> {
  final T? data;
  final String error;

  Case({
    this.data,
    String? error,
  }) : error = error ?? "";
}

class InitialCase<T> extends Case<T> {}

class LoadingCase<T> extends Case<T> {}

class ErrorCase<T> extends Case<T> {
  ErrorCase(String error) : super(error: error);
}

class LoadedCase<T> extends Case<T> {
  LoadedCase(T result) : super(data: result);
}

```

# Dependency Management

## pubspec.yaml Highlights

```yaml
dependencies:
  get: ^4.7.2 # State management + routing
  permission_handler: ^12.0.1 # Permission handling
  image_picker: ^1.2.0 # Media selection
  skeletonizer: ^2.1.0+1 # Loading skeletons
  flutter_svg: ^2.2.0 # SVG rendering

dev_dependencies:
  build_runner: ^2.4.0 # Code generation
  flutter_gen_runner: ^5.5.0 # Asset codegen
```

## Dependency graph

graph LR
A[Controller] -->|depends on| B[Service]
B -->|uses| C[Model/API]
D[View] -->|observes| A
E[Binding] -->|injects| A

## Service Abstraction

```dart
abstract class CampaignService {
  Future<List<CampaignResp>> getApplied();
}

class CampaignServiceImpl implements CampaignService {
  @override
  Future<List<CampaignResp>> getApplied() async {
    // API simulation
    await Future.delayed(Duration(milliseconds: 3000));
    return List.generate(5, (index) => CampaignResp(...));
  }
}
```

# Key Flows

## Campaign List Loading Sequence

- Initialization:

```dart
// Binding initializes controller
class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CampaignControllerInterface>(controller);
  }
}
```

- Data Fetching:

```dart
void onInit() {
  getAppliedList(); // Called automatically
  getInProgressList();
  getCompletedList();
}

```

- State Transition:

```dart
viewModel.appliedList.value = LoadingCase(); // Show loader
final result = await campaignService.getApplied(); // Fetch data
viewModel.appliedList.value = LoadedCase(result); // Update UI
```

- UI Update:

```dart
Obx(() {
  final state = controller.viewModel.appliedList.value;
  return state is LoadingCase ? LoadingWidget() : CampaignList(data: state.data);
})
```

# Installation and Run Instructions

## Prerequisites

- Flutter SDK: Install Flutter following the official guide
- IDE: Android Studio or VS Code with Flutter plugin
- Device: Physical device or emulator

## Setup Steps

- Clone repository:

```shell
git clone https://github.com/your-repo/my_flynn.git
cd my_flynn
```

- Install dependencies:

```shell
flutter pub get
```

- Generate assets and fonts:

```shell
flutter packages pub run build_runner build --delete-conflicting-outputs
```

- Generate launcher icons (optional):

```shell
flutter pub run flutter_launcher_icons:main
```

- Run the application:

```shell
flutter run
```

## Build Options

- Android APK:

```shell
flutter build apk --release
```

- iOS App:

```shell
flutter build ios --release
```

# Strength

- ✅ Clear feature encapsulation
- ✅ Effective reactive state updates
- ✅ Consistent widget composition
- ✅ Good separation of concerns

# Critical Dependencies

| Package            | Version  | Purpose                     | Criticality |
| ------------------ | -------- | --------------------------- | ----------- |
| get                | ^4.7.2   | State management + Routing  | Essential   |
| permission_handler | ^12.0.1  | Camera/gallery access       | High        |
| image_picker       | ^1.2.0   | Media selection             | High        |
| skeletonizer       | ^2.1.0+1 | Loading state visualization | Medium      |
| flutter_svg        | ^2.2.0   | Vector graphics rendering   | Medium      |

# Version Compatibility

- **Flutter**: 3.35.1+
- **Dart**: 3.9.0+

# Document Information

- **Documentation Written**: 2025-08-19
- **Project Version**: 1.0.0+1
- **Documentation Last Update**: ...
