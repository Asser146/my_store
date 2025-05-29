# my_store

A cross-platform e-commerce Flutter application.

## Project Description

**my_store** is a sample e-commerce app built with Flutter, demonstrating modern state management, clean architecture, and integration with REST APIs and local storage. The app allows users to browse products, manage a shopping cart, mark favorites, and handle authentication. It supports Android, iOS, Web, Windows, Linux, and macOS platforms.

## Core Functionalities

- **User Authentication**
  - Login and registration screens
  - Secure token storage using `flutter_secure_storage`

- **Product Browsing**
  - Fetches product data from [Fake Store API](https://fakestoreapi.com/)
  - Displays product lists, categories, and product details

- **Cart Management**
  - Add, remove, and update product quantities in the cart
  - View cart summary and total price

- **Favorites**
  - Mark/unmark products as favorites
  - View favorite products

- **Profile Management**
  - View profile information
  - Logout and delete account options

- **State Management**
  - Uses `flutter_bloc` and Cubit for predictable state management

- **Persistence**
  - Local data storage with Hive for offline access to products, cart, and favorites

- **UI/UX**
  - Responsive design using `flutter_screenutil`
  - Custom theming and navigation with persistent bottom navigation bar

- **Notifications**
  - Firebase Cloud Messaging integration for push notifications
