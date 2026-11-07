# ScrollTrigger
Plugin para animar en función del scroll.

```js
gsap.registerPlugin(ScrollTrigger);
gsap.to(".imagen", {
  y: -100,
  scrollTrigger: { trigger: ".seccion", start: "top bottom", end: "bottom top", scrub: true }
});
```
- `scrub`: la animación sigue al scroll.
- `pin`: fija una sección mientras se anima.

Úsalo con moderación: demasiado scroll animado cansa ([[Cuándo no animar]]).

Relacionado: [[GSAP]], [[Timelines]], [[Plugins de GSAP]]
