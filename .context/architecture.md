# Arquitectura del Proyecto (Clean Architecture)

> [!IMPORTANT]
> **RESTRICCIÓN ESTRICTA:** Este archivo NO puede ser eliminado, y su actualización requiere autorización del usuario. Define la estructura base agnóstica que evita flujos o estructuras fuera de los estándares establecidos.

El proyecto sigue un patrón estricto de **Clean Architecture** adaptado para Flutter, orientado a desacoplar completamente la lógica de negocio de las implementaciones externas (UI, bases de datos, APIs).

## Stack Tecnológico Principal
- **Manejo de Estado:** Riverpod (`flutter_riverpod`).
- **Enrutamiento:** GoRouter.
- **Inyección de Dependencias:** GetIt.
- **Red/API:** Dio.
- **Modelos:** Freezed y JSON Serializable.

## Estructura de Directorios (`lib/`)

La estructura se divide en 3 capas principales: `core`, `di` y `features`.

### 1. `core/` (Núcleo Agnóstico)
Contiene todo el código global, reutilizable y agnóstico a las características (features).
- `network/`: Configuraciones del cliente HTTP (Dio interceptors, base URLs).
- `error/`: Excepciones, fallos (Failures) y manejo de errores globales.
- `usecases/`: Interfaz abstracta base genérica para los casos de uso.
- `theme/`: Configuraciones visuales globales (Material 3, Color Schemes).
- `router/`: Configuración centralizada de GoRouter.
- `utils/`: Widgets globales reutilizables (ej. inputs, botones), extensiones y constantes globales.

### 2. `di/` (Inyección de Dependencias)
- `injection.dart`: Punto de entrada de GetIt. Configura e inyecta Singleton y Factories para toda la aplicación. Se prioriza el desacoplamiento inyectando repositorios y casos de uso.

### 3. `features/` (Características del Dominio)
Cada funcionalidad de la aplicación (ej. `auth`, `home`, `profile`) debe aislarse en su propia carpeta bajo `features/`. A su vez, cada feature respeta 3 capas:

*   **`domain/` (Capa de Dominio):** Totalmente independiente de Flutter y paquetes de terceros.
    *   `entities/`: Objetos puros de negocio.
    *   `repositories/`: Interfaces (contratos abstractos) de los repositorios.
    *   `usecases/`: La lógica de negocio pura, ejecutando reglas específicas.
*   **`data/` (Capa de Datos):** Implementa los contratos del Dominio.
    *   `models/`: DTOs, serialización (JSON/Freezed) que heredan o mapean hacia Entidades.
    *   `repositories/`: Implementación concreta de los contratos de la capa `domain`.
    *   `datasources/`: Fuentes de datos (LocalStorage, APIs Remotas).
*   **`presentation/` (Capa de Presentación):** Código fuertemente acoplado a Flutter.
    *   `pages/` (o `screens/`): Vistas principales ruteables.
    *   `widgets/`: Componentes UI locales de la feature.
    *   `providers/` (o `controllers/`): Lógica de presentación y manejo de estado usando Riverpod.

## Reglas de Arquitectura
1. **Regla de Dependencia:** La capa `domain` no puede importar NADA de `data` ni de `presentation`. `data` y `presentation` dependen de `domain`.
2. Las llamadas a red o bases de datos solo ocurren en `datasources`.
3. Los Widgets (`presentation`) nunca deben realizar lógica de negocio directamente, deben delegarlo a un Provider de Riverpod, el cual se comunicará con un UseCase (`domain`).
