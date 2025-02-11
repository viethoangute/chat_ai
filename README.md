# chat_ai
An AI chat with flutter and Claude API.
This project was using:
- flutter_bloc: State management
- get_it: Dependency injection
- http: Networking

API key was configed at *service_locator.dart* file. Please go to [Anthropic API](https://www.anthropic.com/api)   for more detail.
```dart
String apiKey = 'YOUR_API_KEY';
getIt.registerLazySingleton<ClaudeApiService>(
    () => ClaudeApiService(apiKey: apiKey));
```

### Screens:
<img src="https://github.com/user-attachments/assets/c13c11b9-fcbc-4046-95d8-1e1d8be64b04" width="300" />

<img src="https://github.com/user-attachments/assets/fbdc548c-d4b1-48c6-bb2e-e370aa09f429" width="300" />
