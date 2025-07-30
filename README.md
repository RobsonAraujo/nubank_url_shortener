# URL Shortener App

A Flutter application that allows users to shorten URLs and view their history of shortened links.

## Features

- **URL Shortening**: Enter any valid URL and get a shortened version
- **History Management**: View all recently shortened URLs with their aliases
- **Copy to Clipboard**: Easily copy shortened URLs to clipboard
- **Modern UI**: Clean and intuitive Material Design interface
- **Offline Storage**: URLs are persisted locally using SharedPreferences
- **Error Handling**: Comprehensive error handling and user feedback
- **URL Validation**: Smart URL validation with protocol auto-detection
- **Loading States**: Visual feedback during API operations

## Architecture

The app follows a clean architecture pattern with proper separation of concerns:

### Models

- `ShortenedUrl`: Data model for shortened URLs with JSON serialization

### Services

- `UrlShortenerService`: Handles API communication with the URL shortening service
- `StorageService`: Manages local storage of shortened URLs using SharedPreferences

### Providers

- `UrlShortenerProvider`: State management using Provider pattern with comprehensive error handling

### Widgets

- `UrlInputWidget`: Input field and shorten button with validation
- `UrlListWidget`: Displays list of shortened URLs with copy/open functionality
- `HomePage`: Main page combining all components

## API Integration

The app integrates with the provided URL shortening API:

- **Base URL**: `https://url-shortener-server.onrender.com/api/alias`
- **Shorten URL**: POST `/api/alias` with JSON body `{"url":"<the url>"}`
- **Get Original URL**: GET `/api/alias/:id`

### API Response Handling

- Supports both HTTP 200 and 201 status codes for successful URL shortening
- Comprehensive error handling for network and API failures
- Automatic URL validation and protocol detection

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extension

### Installation

1. Extract the files

2. Install dependencies:

```bash
flutter pub get
```

3. Run the app:

```bash
flutter run
```

### Running Tests

Run all tests:

```bash
flutter test
```

Run specific test files:

```bash
flutter test test/models/shortened_url_test.dart
flutter test test/widgets/url_input_widget_test.dart
flutter test test/widgets/url_list_widget.dart
flutter test test/integration/app_test.dart
```

## Testing Strategy

### Unit Tests

- **Model Tests**: 100% coverage for data models and JSON serialization
- **Service Tests**: API service structure and error handling
- **Provider Tests**: State management logic and validation

### Widget Tests

- **Component Tests**: Individual widgets in isolation with user interactions
- **Integration Tests**: Complete app workflows and user journeys

### Test Coverage

- **31 tests passing**: Comprehensive test coverage
- **Models**: 100% coverage with JSON serialization tests
- **Widgets**: Key functionality covered with interaction tests
- **Integration**: Main user flows covered
- **Zero lint warnings**: Clean code quality

## Code Quality

The app follows Flutter best practices:

- **Zero Lint Warnings**: Clean code analysis with no issues
- **Clean Architecture**: Proper separation of concerns
- **State Management**: Provider pattern for reactive UI
- **Error Handling**: Comprehensive error handling with user-friendly messages
- **Modular Design**: Small, focused functions with clear responsibilities

### Code Organization

- **Naming Conventions**: Descriptive and consistent naming
- **File Organization**: Clear and logical structure
- **Separation of Concerns**: Each file has single responsibility
- **Error Handling**: Specific error messages and validation

## Dependencies

- `flutter`: Core Flutter framework
- `http`: HTTP requests for API communication
- `provider`: State management
- `shared_preferences`: Local storage
- `flutter_lints`: Code quality and linting

## Project Structure

```
lib/
├── models/
│   └── shortened_url.dart          # Data model with JSON serialization
├── services/
│   ├── url_shortener_service.dart  # API communication
│   └── storage_service.dart        # Local storage management
├── providers/
│   └── url_shortener_provider.dart # State management with validation
├── widgets/
│   ├── url_input_widget.dart       # Input field with validation
│   └── url_list_widget.dart        # URL list with copy/open functionality
├── pages/
│   └── home_page.dart              # Main page layout
└── main.dart                       # App entry point

test/
├── models/
│   └── shortened_url_test.dart     # Model tests (100% coverage)
├── services/
│   └── url_shortener_service_test.dart  # Service tests
├── widgets/
│   ├── url_input_widget_test.dart  # Widget interaction tests
│   └── url_list_widget_test.dart   # List widget tests
├── providers/
│   └── url_shortener_provider_test.dart # Provider tests
├── integration/
│   └── app_test.dart               # Integration tests
└── widget_test.dart                # Smoke test
```

## Usage

1. **Enter URL**: Type or paste a URL in the input field (protocol auto-detection)
2. **Shorten**: Tap the "Shorten URL" button
3. **View History**: See your shortened URLs in the list below
4. **Copy URL**: Tap the copy icon to copy the shortened URL
5. **Open URL**: Tap the open icon to launch the shortened URL

## Error Handling

The app handles various error scenarios:

- **Invalid URLs**: Shows validation error messages with examples
- **Network Errors**: Displays network error messages
- **API Errors**: Shows appropriate error messages for API failures
- **Empty Input**: Prevents submission of empty URLs
- **URL Validation**: Smart validation with protocol detection

## License

This project is created for the Nubank URL Shortener technical test.
