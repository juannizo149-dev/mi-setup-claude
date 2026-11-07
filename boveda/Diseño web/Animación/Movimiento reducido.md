# Movimiento reducido
Algunas personas activan "reducir movimiento" en su sistema (mareos, vértigo).

```css
@media (prefers-reduced-motion: reduce) {
  * { animation-duration: 0.01ms !important; transition-duration: 0.01ms !important; }
}
```
Mejor que quitarlo todo: cambia los desplazamientos por fundidos.

En GSAP se gestiona con `gsap.matchMedia()` (ver [[GSAP]]).

Relacionado: [[Accesibilidad]], [[Principios de animación]]
