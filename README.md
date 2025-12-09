# Gilded Rose Refactoring Kata - DDD, CQRS & Hexagonal Architecture (PHP)

![Build Status](https://img.shields.io/badge/build-passing-brightgreen) ![PHP Version](https://img.shields.io/badge/php-8.3-blue) ![Architecture](https://img.shields.io/badge/architecture-DDD%20%2F%20Hexagonal-orange)

[🇪🇸 Versión en Español](#-español) | [🇬🇧 English Version](#-english-version)

---

## 🇪🇸 Español

Esta es una implementación profesional de la famosa **Gilded Rose Refactoring Kata** utilizando **PHP 8.3**.

El objetivo de este proyecto no es simplemente resolver la lógica del negocio, sino utilizar el ejercicio como un "sandbox" para demostrar cómo estructurar una aplicación empresarial compleja, escalable y testearle, desacoplando completamente el dominio de la infraestructura y del código legado.

### 🏗️ Arquitectura y Patrones

El código ha sido refactorizado desde una única clase monolítica hacia una **Arquitectura Hexagonal (Puertos y Adaptadores)**:

1.  **Domain-Driven Design (DDD):**
    * **Entidades Ricas:** `DomainItem` actúa como un *Decorator* sobre la clase `Item` heredada, encapsulando la lógica y protegiendo invariantes (ej: la calidad nunca es negativa).
    * **Value Objects:** `Quality` asegura la integridad de los datos numéricos.
    * **Strategy Pattern:** La lógica de actualización de cada ítem (`Aged Brie`, `Backstage Passes`, etc.) se ha extraído a clases `Updater` independientes, cumpliendo el principio *Open/Closed*.

2.  **CQRS (Command Query Responsibility Segregation):**
    * Las intenciones de modificación del usuario se manejan a través de **Comandos** (`CreateItemCommand`, `UpdateItemCommand`) y sus respectivos **Handlers**, separando la escritura de la lectura.

3.  **Testing Avanzado:**
    * **Approval Tests (Golden Master):** Se utilizan para asegurar que el refactor no rompe la compatibilidad con el sistema legado.
    * **Unit Tests:** Tests aislados para la lógica de dominio.

### 📂 Estructura del Proyecto

```text
src/
├── GildedRose.php          # Punto de entrada Legacy (Mantiene compatibilidad)
├── Item.php                # Clase Legacy (Intacta por reglas de la Kata)
└── Item/
    ├── Application/        # Casos de uso (Orquestación)
    │   ├── Command/        # Comandos y Handlers (CQRS)
    │   └── Service/        # Servicios de Aplicación (SyncItemQuality)
    ├── Domain/             # Reglas de Negocio Puras (Núcleo)
    │   ├── Entity/         # DomainItem (Wrapper/Decorator)
    │   ├── Updater/        # Estrategias (Brie, Sulfuras, etc.)
    │   ├── ValueObject/    # Quality
    │   └── Repository/     # Interfaces del repositorio
    └── Infrastructure/     # Implementaciones técnicas
        └── Persistence/    # InMemoryItemRepository
```
### 🚀 Ejecución con Docker (Recomendado)

```
docker build -t gilded-rose-php .
docker run --rm gilded-rose-php
docker run --rm gilded-rose-php vendor/bin/phpunit
```

### 🛠️ Ejecución Local

Si prefieres ejecutarlo en tu máquina, necesitas PHP 8.3+ y Composer.

```
composer install
php index.php
./vendor/bin/phpunit
```

---

## 🇬🇧 English Version

This is a professional implementation of the famous **Gilded Rose Refactoring Kata** written in **PHP 8.3**.

The goal of this project extends beyond solving the business logic; it serves as a sandbox to demonstrate how to structure a complex, scalable, and testable enterprise application by decoupling the domain from infrastructure and legacy code.

### 🏗️ Architecture & Patterns

The code has been refactored from a monolithic class into a **Hexagonal Architecture (Ports and Adapters)**:

1.  **Domain-Driven Design (DDD):**
    * **Rich Entities:** `DomainItem` acts as a *Decorator* around the legacy `Item` class, encapsulating logic and protecting invariants (e.g., quality is never negative).
    * **Value Objects:** `Quality` ensures data integrity.
    * **Strategy Pattern:** Update logic for each item type (`Aged Brie`, `Backstage Passes`, etc.) is extracted into separate `Updater` classes, adhering to the *Open/Closed* principle.

2.  **CQRS (Command Query Responsibility Segregation):**
    * User intents are handled via **Commands** (`CreateItemCommand`, `UpdateItemCommand`) and their respective **Handlers**, separating write operations from read operations.

3.  **Advanced Testing:**
    * **Approval Tests (Golden Master):** Used to ensure refactoring does not break legacy compatibility.
    * **Unit Tests:** Isolated tests for domain logic.

### 📂 Project Structure

```text
src/
├── GildedRose.php          # Legacy Entry Point (Maintains compatibility)
├── Item.php                # Legacy Class (Untouched per Kata rules)
└── Item/
    ├── Application/        # Use Cases (Orchestration)
    │   ├── Command/        # Commands & Handlers (CQRS)
    │   └── Service/        # Application Services (SyncItemQuality)
    ├── Domain/             # Pure Business Rules (Core)
    │   ├── Entity/         # DomainItem (Wrapper/Decorator)
    │   ├── Updater/        # Strategies (Brie, Sulfuras, etc.)
    │   ├── ValueObject/    # Quality
    │   └── Repository/     # Repository Interfaces
    └── Infrastructure/     # Technical Implementations
        └── Persistence/    # InMemoryItemRepository
```
### 🚀 Running with Docker (Recommended)

```
docker build -t gilded-rose-php .
docker run --rm gilded-rose-php
docker run --rm gilded-rose-php vendor/bin/phpunit
```

### Local Execution

If you prefer running it locally, you need PHP 8.3+ and Composer.

```
composer install
php index.php
vendor/bin/phpunit
```

