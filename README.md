# 🐦 Flutter — De Cero a Experto

Repositorio personal de aprendizaje y práctica basado en el curso **Flutter: De Cero a Experto** de **Fernando Herrera** en Udemy.

El objetivo de este repositorio es documentar mi proceso de aprendizaje de **Dart y Flutter**, aplicando buenas prácticas de desarrollo, Clean Code, principios SOLID y conceptos de arquitectura de software.

> 📌 Este repositorio contiene ejercicios, prácticas, experimentos y proyectos realizados durante mi proceso de aprendizaje.

---

## 🎯 Objetivo

Aprender y dominar progresivamente el desarrollo de aplicaciones móviles con **Flutter y Dart**, pasando desde los fundamentos del lenguaje hasta conceptos más avanzados de desarrollo y arquitectura.

Además del contenido del curso, este repositorio busca aplicar conceptos de desarrollo de software que permitan construir aplicaciones:

* Mantenibles
* Escalables
* Testeables
* Desacopladas
* Fáciles de entender
* Aplicando buenas prácticas de Clean Code

---

## 📚 Curso de referencia

**Flutter: De Cero a Experto**

👨‍🏫 Instructor: **Fernando Herrera**

🌐 Plataforma: **Udemy**

---

## 🛠️ Tecnologías

* [Flutter](https://flutter.dev/)
* [Dart](https://dart.dev/)
* Android Studio
* Visual Studio Code
* Git
* GitHub

---

## 📖 Contenido

### 🟢 Dart

Fundamentos del lenguaje Dart y conceptos de programación orientada a objetos.

* [x] Variables y tipos de datos
* [x] `final` y `const`
* [x] Null Safety
* [x] Funciones
* [x] Parámetros opcionales y requeridos
* [x] Clases y objetos
* [x] Constructores
* [x] Constructores nombrados
* [x] Lista de inicialización
* [x] `extends`
* [x] `implements`
* [x] Clases abstractas
* [x] Getters y setters
* [x] Encapsulamiento
* [x] Enumeraciones (`enum`)
* [ ] Mixins
* [ ] Futures
* [ ] Async / Await
* [ ] Streams
* [ ] Manejo de errores
* [ ] Generics
* [ ] Extensions
* [ ] Functional programming

---

### 🟡 Programación Orientada a Objetos

Conceptos fundamentales de POO utilizando Dart.

* [x] Clases
* [x] Objetos
* [x] Atributos
* [x] Métodos
* [x] Encapsulamiento
* [x] Herencia
* [x] Abstracción
* [x] Polimorfismo
* [x] Interfaces
* [x] `extends` vs `implements`
* [x] Constructores
* [x] Getters y setters

---

### 🟠 Flutter

Fundamentos del framework Flutter.

* [ ] Estructura de un proyecto Flutter
* [ ] Widgets
* [ ] StatelessWidget
* [ ] StatefulWidget
* [ ] Material Design
* [ ] Layouts
* [ ] Row / Column
* [ ] Container
* [ ] Stack
* [ ] ListView
* [ ] Listas dinámicas
* [ ] Formularios
* [ ] Navegación
* [ ] Rutas
* [ ] Manejo de estado
* [ ] Consumo de APIs
* [ ] Persistencia de datos
* [ ] Animaciones
* [ ] Testing

---

## 🧠 Arquitectura y buenas prácticas

Uno de los objetivos de este repositorio es complementar el aprendizaje de Flutter con conceptos de arquitectura y diseño de software.

### SOLID

* [x] Single Responsibility Principle — SRP
* [x] Open/Closed Principle — OCP
* [x] Liskov Substitution Principle — LSP
* [x] Interface Segregation Principle — ISP
* [x] Dependency Inversion Principle — DIP

### Conceptos

* [x] Dependency Inversion
* [ ] Dependency Injection
* [ ] Clean Code
* [ ] Clean Architecture
* [ ] Repository Pattern
* [ ] Use Cases
* [ ] Data Sources
* [ ] DTOs / Models
* [ ] Entities
* [ ] Separación de responsabilidades
* [ ] Inyección de dependencias
* [ ] Testing y mocks

---

## 📂 Estructura del repositorio

La estructura irá evolucionando a medida que avance en el curso.

```text
flutter-course/
│
├── README.md
│
├── dart/
│   ├── 01-basics/
│   ├── 02-functions/
│   ├── 03-poo/
│   ├── 04-constructors/
│   ├── 05-abstract-classes/
│   └── ...
│
├── flutter/
│   ├── 01-widgets/
│   ├── 02-layouts/
│   ├── 03-navigation/
│   ├── 04-forms/
│   ├── 05-state-management/
│   └── ...
│
└── projects/
    ├── project-01/
    ├── project-02/
    └── ...
```

La estructura puede cambiar dependiendo de cómo se organicen los ejercicios y proyectos durante el curso.

---

## 📈 Progreso

El progreso se irá actualizando conforme avance en el curso.

| Área               | Progreso       |
| ------------------ | -------------- |
| Dart               | 🟢 En progreso |
| POO                | 🟢 En progreso |
| Flutter            | ⚪ Pendiente    |
| Widgets            | ⚪ Pendiente    |
| Navegación         | ⚪ Pendiente    |
| Manejo de estado   | ⚪ Pendiente    |
| APIs               | ⚪ Pendiente    |
| Testing            | ⚪ Pendiente    |
| SOLID              | 🟢 En progreso |
| Clean Code         | 🟢 En progreso |
| Clean Architecture | ⚪ Pendiente    |

---

## 💡 Conceptos importantes

Algunos conceptos que estoy reforzando durante el aprendizaje:

### `extends`

Utilizado para heredar comportamiento de una clase.

```dart
class WindPlant extends EnergyPlant {
  // ...
}
```

### `implements`

Utilizado para cumplir el contrato definido por otra clase o interfaz.

```dart
class NuclearPlant implements EnergyPlant {
  // ...
}
```

### Dependency Inversion

El código de alto nivel debe depender de abstracciones y no directamente de implementaciones concretas.

```text
Alto nivel
    ↓
Abstracción
    ↑
Implementación
```

### Encapsulamiento

Proteger el estado interno de un objeto y controlar cómo puede ser modificado.

```dart
class Square {
  double _side;

  double get area => _side * _side;

  set side(double value) {
    if (value < 0) {
      throw 'Value must be >= 0';
    }

    _side = value;
  }
}
```

---

## 🚀 Ejecutar los proyectos

### Requisitos

Tener instalado:

* Flutter SDK
* Dart SDK
* Android Studio o Visual Studio Code
* Android Emulator o un dispositivo físico

Verificar la instalación:

```bash
flutter doctor
```

Crear o ejecutar un proyecto:

```bash
flutter run
```

---

## 🔧 Herramientas de desarrollo

### Visual Studio Code

Editor principal utilizado durante el desarrollo.

Extensiones recomendadas:

* Flutter
* Dart
* Error Lens
* GitLens

### Android Studio

Utilizado principalmente para:

* Android SDK
* Android Emulator
* Herramientas de desarrollo Android

---

## 📝 Notas de aprendizaje

Este repositorio también funciona como una bitácora técnica.

Algunos de los conceptos que voy documentando:

* Diferencias entre `extends` e `implements`
* Constructores normales y nombrados
* Lista de inicialización (`:`)
* `final` vs variables mutables
* Null Safety
* `late`
* Getters y setters
* Clases abstractas
* Polimorfismo
* Dependency Inversion
* Principios SOLID
* Clean Code
* Clean Architecture

La idea es no limitarme a memorizar sintaxis, sino entender **por qué** se utilizan determinados patrones y decisiones de diseño.

---

## 🎯 Objetivos a largo plazo

Al finalizar el curso, el objetivo es poder:

* Desarrollar aplicaciones móviles con Flutter.
* Escribir código Dart limpio y mantenible.
* Aplicar principios SOLID.
* Utilizar patrones de diseño cuando sean necesarios.
* Diseñar aplicaciones utilizando Clean Architecture.
* Consumir APIs REST.
* Manejar diferentes fuentes de datos.
* Implementar manejo de estado.
* Escribir pruebas automatizadas.
* Crear aplicaciones escalables y mantenibles.

---

## 📌 Filosofía del repositorio

> **No busco únicamente aprender a hacer que una aplicación funcione.**
>
> Busco aprender a construir software que sea fácil de entender, mantener, probar y evolucionar.

---

## 📚 Referencias

* Flutter — https://flutter.dev/
* Dart — https://dart.dev/
* Flutter Documentation — https://docs.flutter.dev/
* Dart Language Tour — https://dart.dev/language
* Curso **Flutter: De Cero a Experto** — Fernando Herrera / Udemy

---

## 👨‍💻 Autor

**Camilo Arango**

Repositorio creado como parte de mi proceso personal de aprendizaje de Flutter, Dart y arquitectura de software.

---

⭐ Este repositorio irá evolucionando junto con mi aprendizaje.
