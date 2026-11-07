# Rendimiento de animaciones
Anima solo `transform` y `opacity`: el navegador los resuelve sin recalcular el layout.

- Evita animar `width`, `height`, `top`, `left`, `margin`.
- `filter: blur()` es caro en áreas grandes.
- `will-change` solo cuando hay un problema real, no en todo.
- Objetivo: 60 fps (unos 16 ms por fotograma).

Relacionado: [[Principios de animación]], [[GSAP]]
