# 📚 Clean Architecture Flutter Practice

A Flutter project built while studying **Clean Architecture** principles.  
The application uses the **Google Books API** to search and browse books while focusing on building a scalable and maintainable architecture.

---

## 🎯 Learning Objectives

This project was created to practice:

- Clean Architecture
- Feature-based project structure
- Separation of Concerns
- Repository Pattern
- Dependency Injection
- Pagination with REST APIs
- State Management using Cubit (Bloc)
- API Integration with Dio
- Error Handling
- Functional Programming using Either

---

## 🏛️ Architecture

The project follows **Clean Architecture** by separating the application into three independent layers.

```
lib/
└── features/
    └── home/
        ├── data/
        │   ├── data_sources/
        │   ├── models/
        │   ├── repositories/
        │   └── implementations/
        │
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── use_cases/
        │
        └── presentation/
            ├── views/
            ├── view_models/
            │   └── cubits/
            └── widgets/
```

---

## 📂 Layers

### Data Layer

Responsible for retrieving data from external sources.

Includes:

- Models
- Remote Data Sources
- Repository Implementations
- API Requests

---

### Domain Layer

Contains the business logic of the application.

Includes:

- Entities
- Repository Contracts
- Use Cases

---

### Presentation Layer

Responsible for the UI and state management.

Includes:

- Views
- Widgets
- Cubits (Bloc)
- States

---

## ✨ Features

- 🔍 Search books
- 📖 Display book details
- 🌐 Fetch data from Google Books API
- ♻️ Infinite Pagination
- ⚡ Error Handling
- 📱 Responsive UI
- 🧹 Clean Architecture

---

## 🛠️ Tech Stack

- Flutter
- Dart
- Bloc / Cubit
- Dio
- Google Books API
- Equatable
- Dartz
- GetIt (Dependency Injection)

---

## 📖 What I Learned

During this project I practiced:

- Building scalable Flutter applications
- Applying Clean Architecture principles
- Organizing projects using Feature First Architecture
- Implementing Repository Pattern
- Creating reusable Use Cases
- Working with Entities and Models
- Connecting REST APIs using Dio
- Implementing Pagination
- Managing state with Cubit
- Handling failures using Either (Dartz)
- Writing clean and maintainable code

---

## 🚀 API

This project uses the **Google Books API** to retrieve books and support pagination.

---

## 📷 Preview

> Add screenshots here.

| Home | Search | Details |
|------|---------|---------|
| Image | Image | Image |

---

## 👨‍💻 Purpose

This project was built as part of my Flutter learning journey to gain hands-on experience with **Clean Architecture**, project organization, and API integration following best practices.
