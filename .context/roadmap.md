# Roadmap y Planificación

> [!NOTE]
> Archivo volátil. Solo se llena cuando se ejecuta un plan grande, previa autorización de Brandon (diario o por sprint).
> **NO ELIMINAR**. Puede actualizarse con autorización.

El Roadmap ha sido actualizado para el Deber 8: Guía Turística.

*(Al planificar, cada fase o punto a desarrollar deberá indicar el modelo más eficiente y apropiado del siguiente stack, cuidando de no saturar los modelos de uso limitado por cuenta estudiantil):*

**Stack de Modelos Disponibles:**
- GLM-5.1
- Kimi K2.5
- Mimo V2.5
- Mimo V2.5 Pro
- MiniMax M2.5
- MiniMax M2.7
- MiniMax M3
- Qwen3.6 Plus
- Mimo V2.5 Free
- MiniMax M3 Free
- Nemotron 3 Ultra Free
- DeepSeek V4 Flash
- Qwen3.7 Max
- Qwen3.6 Plus
- DeepSeek V4 Pro
- GLM-5.0
- DeepSeek V4 Flash Free
- Kimi K2.6
- Claude Opus *(Uso restringido)*
- Claude Sonnet *(Uso restringido)*
- GPT 5+ *(Uso restringido)*
- Gemini *(Uso restringido)*

---

## Sprint Actual: Deber 8 - Guía Turística

1. **Fase 1: Limpieza y Reestructuración Core**
   - Eliminar módulo de autenticación.
   - Reconfigurar GoRouter para apuntar a la UI principal.
   - **Modelo sugerido:** DeepSeek V4 Flash / Qwen3.6 Plus

2. **Fase 2: Clean Architecture - Capa Domain & Data**
   - Creación de entidad `TouristSite`.
   - Creación de repositorio, DataSources (Mock de 10 sitios) y UseCases.
   - **Modelo sugerido:** DeepSeek V4 Pro / Qwen3.7 Max

3. **Fase 3: UI/UX Senior & Interactividad (Presentación)**
   - Implementación de UI de los tutoriales (Layout/Interactivity) con diseño Senior.
   - Integración con Riverpod para estado de favoritos.
   - **Modelo sugerido:** Claude Sonnet (Uso restringido) o DeepSeek V4 Pro
