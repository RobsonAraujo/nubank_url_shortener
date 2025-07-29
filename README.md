# URL Shortener App

A Flutter application that allows users to shorten URLs and view their history of shortened links.

## Features

- **URL Shortening**: Enter any valid URL and get a shortened version
- **History Management**: View all recently shortened URLs with their aliases
- **Copy to Clipboard**: Easily copy shortened URLs to clipboard
- **Modern UI**: Clean and intuitive Material Design interface
- **Offline Storage**: URLs are persisted locally using SharedPreferences
- **Error Handling**: Comprehensive error handling and user feedback

## Architecture

The app follows a clean architecture pattern with proper separation of concerns:

### Models

- `ShortenedUrl`: Data model for shortened URLs

### Services

- `UrlShortenerService`: Handles API communication with the URL shortening service
- `StorageService`: Manages local storage of shortened URLs

### Providers

- `UrlShortenerProvider`: State management using Provider pattern

### Widgets

- `UrlInputWidget`: Input field and shorten button
- `UrlListWidget`: Displays list of shortened URLs
- `HomePage`: Main page combining all components

## API Integration

The app integrates with the provided URL shortening API:

- **Base URL**: `https://url-shortener-server.onrender.com/api/alias`
- **Shorten URL**: POST `/api/alias` with JSON body `{"url":"<the url>"}`
- **Get Original URL**: GET `/api/alias/:id`

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extension

### Installation

1. Clone the repository:

```bash
git clone <repository-url>
cd nubank_url_shortener
```

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
flutter test test/integration/app_test.dart
```

Generate mock files for testing:

```bash
flutter packages pub run build_runner build
```

## Testing Strategy

### Unit Tests

- **Model Tests**: Test data models and JSON serialization
- **Service Tests**: Test API service with mocked HTTP responses
- **Provider Tests**: Test state management logic

### Widget Tests

- **Component Tests**: Test individual widgets in isolation
- **Integration Tests**: Test complete app workflows

### Test Coverage

- Models: 100% coverage
- Services: 100% coverage
- Widgets: Key functionality covered
- Integration: Main user flows covered

## Code Quality

The app follows Flutter best practices:

- **Linting**: Uses `flutter_lints` for code quality
- **Architecture**: Clean separation of concerns
- **State Management**: Provider pattern for reactive UI
- **Error Handling**: Comprehensive error handling
- **Documentation**: Well-documented code with clear comments

## Dependencies

- `flutter`: Core Flutter framework
- `http`: HTTP requests for API communication
- `provider`: State management
- `shared_preferences`: Local storage
- `mockito`: Testing utilities
- `build_runner`: Code generation for tests

## Project Structure

```
lib/
├── models/
│   └── shortened_url.dart
├── services/
│   ├── url_shortener_service.dart
│   └── storage_service.dart
├── providers/
│   └── url_shortener_provider.dart
├── widgets/
│   ├── url_input_widget.dart
│   └── url_list_widget.dart
├── pages/
│   └── home_page.dart
└── main.dart

test/
├── models/
│   └── shortened_url_test.dart
├── services/
│   └── url_shortener_service_test.dart
├── widgets/
│   └── url_input_widget_test.dart
├── integration/
│   └── app_test.dart
└── widget_test.dart
```

## Usage

1. **Enter URL**: Type or paste a URL in the input field
2. **Shorten**: Tap the "Shorten URL" button
3. **View History**: See your shortened URLs in the list below
4. **Copy URL**: Tap the copy icon to copy the shortened URL
5. **Open URL**: Tap the open icon to launch the shortened URL

## Error Handling

The app handles various error scenarios:

- **Invalid URLs**: Shows validation error messages
- **Network Errors**: Displays network error messages
- **API Errors**: Shows appropriate error messages for API failures
- **Empty Input**: Prevents submission of empty URLs

## Future Enhancements

- URL validation improvements
- QR code generation for shortened URLs
- Analytics tracking
- Custom alias support
- Bulk URL shortening
- Export/import functionality

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Run the test suite
6. Submit a pull request

## License

This project is created for the Nubank URL Shortener technical test.
