# Skill: Patrón de Diseño de UI/UX

Este Skill define las directrices estéticas y de experiencia de usuario que sigue nuestra base agnóstica de Flutter. Todos los componentes y vistas deben adherirse a estos principios.

## 1. Material 3 Expressive
El proyecto utiliza estrictamente **Material 3 Expressive**. Se busca una estética moderna con bordes redondeados (radius 16 típicamente), sombras sutiles y espacios amplios.

## 2. Paleta de Colores Dinámica (Color Seeds)
El diseño usa `ColorScheme.fromSeed` para generar la paleta de colores.
*   **Color Protagonista (Reposo):** El color primario de fondo es el **blanco absoluto** (`Colors.white` o `Colors.grey.shade50`) para dar descanso visual al usuario en la navegación y mantener un entorno limpio.
*   **Color de Acento:** Todo el dinamismo (botones, focus, íconos principales) se rige por el color semilla de la marca. 

### ¿Cómo hacer el "switch" de paleta de colores?
Cambiar toda la paleta de colores del proyecto es instantáneo. 
Solo debes ir al archivo `lib/core/theme/app_theme.dart` y cambiar la variable `seedColor`:

```dart
// En lib/core/theme/app_theme.dart
static const Color seedColor = Color(0xFFFF6D00); // Cambia este código Hexadecimal
```
El framework generará automáticamente los gradientes y estados para modo claro y oscuro.

## 3. Interactividad y "Efecto WOW" (Micro-Animaciones)
La UI NUNCA debe sentirse estática.
- **Navegación:** Toda navegación usa transiciones (ej. Fade + Scale) proporcionadas por nuestro enrutador personalizado en `app_router.dart`.
- **Inputs (`ConsecutiveTextField`):** Tienen un `AnimatedScale` que agranda ligeramente el campo al recibir el foco. El paso entre inputs debe ser consecutivo al presionar "Siguiente" en el teclado de software.
- **Botones (`AnimatedPressButton`):** Todo botón debe tener un efecto de "hundimiento" visual (Scale hacia abajo) durante el `TapDown` y retornar durante el `TapUp`.

## 4. Teclado y Scroll
Todo formulario debe estar diseñado de forma que la apertura del teclado **NUNCA** cubra los inputs de texto. Se requiere el uso de `SafeArea` y `SingleChildScrollView` para permitir que el contenido se desplace libremente.
(Excepción: Aplicaciones de Chat donde el input reposa directamente sobre el teclado de software).

## 5. Íconos
No se deben usar los emojis por defecto para representación visual primaria. Se exige usar paquetes de íconos profesionales. Actualmente se utiliza `lucide_icons`.
