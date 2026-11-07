# Timelines
Secuencias de [[Tweens]] que se controlan como una sola animación.

```js
const tl = gsap.timeline({ defaults: { ease: "power3.out" } });
tl.from(".titulo", { y: 30, opacity: 0 })
  .from(".texto", { opacity: 0 }, "-=0.2")   // empieza 0.2 s antes
  .from(".boton", { scale: 0.8 }, "<");      // a la vez que el anterior
```

Relacionado: [[GSAP]], [[Coreografía y stagger]], [[ScrollTrigger]]
