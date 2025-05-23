# Pokedex

Flutter application that uses the PokeAPI to fetch and display information about Pokémon. This app leverages Riverpod for efficient state management, Dio for RESTful API requests, and Shared Preferences for local storage of favorite Pokémon. Users can browse through an extensive list of Pokémon with infinite scrolling, view detailed information about each creature, and save their favorites for quick access.

## Demo Preview   
[![Pokedex Demo](https://img.youtube.com/vi/r-7Yymp0Ii4/1.jpg)](https://youtu.be/r-7Yymp0Ii4)  

## Hosted URL
Download the latest APK and start playing! 🎮  
<a href="https://bit.ly/4i12pFx" target="_blank">
  <img src="https://github.com/user-attachments/assets/61a2bce1-a6a0-4b44-a835-d31e60dfbf4f" alt="Download APK" width="100" height ="100"/>
</a>  
🔽 **Click Below to Download** 🔽  
[📥 Download APK](https://bit.ly/4i12pFx)


## Features

- **Browse All Pokémon**: Scroll through the complete list of Pokémon with infinite scrolling
- **View Pokémon Details**: See moves, stats, and other information about each Pokémon
- **Favorites System**: Save your favorite Pokémon for quick access
- **Clean UI**: Modern, responsive interface with skeleton loading indicators

## Screenshots
<div align="center">
  <img src="https://github.com/user-attachments/assets/82e90fea-6809-466b-ae53-4a4cfa775095" height="400" alt="Pokemon List"/>
  <img src="https://github.com/user-attachments/assets/0b0b2a0a-7264-4820-8304-22e1ebd2f9a9" height="400" alt="Pokemon Stats"/>
  <img src="https://github.com/user-attachments/assets/ac9b9c06-ca5c-4f60-93f1-7ed5688f3ce6" height="400" alt="Favorites Screen"/>
</div>

## Tech Stack

### State Management
- **Flutter Riverpod** (`flutter_riverpod: ^2.6.1`): Reactive state management
- **Provider Architecture**: Clean separation of UI, business logic, and data layer

### Networking
- **Dio** (`dio: ^5.8.0+1`): HTTP client for API requests
- **PokeAPI**: Public API for Pokémon data

### Dependency Injection
- **GetIt** (`get_it: ^8.0.3`): Service locator for dependency injection

### Local Storage
- **Shared Preferences** (`shared_preferences: ^2.5.3`): Persistent storage for favorite Pokémon

### UI Components
- **Skeletonizer** (`skeletonizer: ^1.4.3`): Loading skeleton UI for better user experience
- **Google Fonts**: Custom typography

## Project Structure

- `lib/controllers/`: State management and business logic
- `lib/models/`: Data models for API responses
- `lib/pages/`: Screen definitions
- `lib/providers/`: Riverpod providers
- `lib/services/`: API and database services
- `lib/widgets/`: Reusable UI components

## Architecture

This app follows a clean architecture pattern with:

1. **UI Layer**: Widgets and pages
2. **Business Logic Layer**: Controllers and providers
3. **Data Layer**: Services for API and local storage
4. **Domain Layer**: Models representing the data

