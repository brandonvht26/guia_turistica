# Reglas de Oro del Proyecto (Constitución)

> [!CAUTION]
> **ESTE ARCHIVO ES LA CONSTITUCIÓN DEL PROYECTO.** Las reglas aquí definidas MANDAN sobre cualquier otro archivo en el directorio `.context` o sobre directrices externas.
> **NO MODIFICAR, ACTUALIZAR NI ELIMINAR** este archivo sin la autorización EXPLÍCITA del usuario Brandon.

## Idioma
1. **Código fuente (Lógica):** Todo el código, variables, funciones, clases, métodos, comentarios de documentación en código e interfaces deben estar estrictamente en **INGLÉS**.
2. **Interfaz de Usuario (UI) y UX:** Todo texto visible para el usuario final (textos, diálogos, botones, placeholders, tooltips) debe estar estrictamente en **ESPAÑOL**.

## Convenciones de Nomenclatura (Naming Conventions)
El proyecto sigue rigurosamente los estándares de Dart/Flutter:
*   **PascalCase:** Nombres de Clases, Enums, Typedefs y Extensiones (ej. `HomePage`, `NetworkClient`, `AuthStatus`).
*   **camelCase:** Variables, funciones, métodos, parámetros y constantes no globales (ej. `fetchUserData`, `userName`, `isPressed`).
*   **snake_case:** Nombres de archivos y directorios (ej. `home_page.dart`, `app_theme.dart`, `utils/`).
*   **SCREAMING_SNAKE_CASE:** Exclusivamente para constantes globales puras de configuración o variables de entorno (no recomendado para variables de UI).
*   **Variables Privadas:** Siempre deben iniciar con guion bajo `_` (ej. `_internalFocus`, `_isFocused`).

## Flujo de Trabajo e IA
1. **Autorización:** Ningún archivo del directorio `.context` (en especial este `rules.md` y `architecture.md`) puede ser alterado o eliminado sin consultar y obtener la aprobación previa del usuario.
2. **Archivos Volátiles:** `session.md` y `roadmap.md` son volátiles y se actualizan según avance el trabajo, previa autorización o solicitud.
3. **Consistencia de dependencias:** No se añadirán dependencias depreciadas, y siempre se priorizará la compatibilidad del Stack (Riverpod, GoRouter, Dio, GetIt).
