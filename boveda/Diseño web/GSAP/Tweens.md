# Tweens
```js
gsap.to(".caja", { x: 200, duration: 0.4, ease: "power3.out" });
gsap.from(".item", { opacity: 0, y: 20, stagger: 0.05 });
gsap.fromTo(".a", { scale: 0.9 }, { scale: 1 });
```
- `to`: del estado actual al indicado.
- `from`: del indicado al actual (ideal para entradas).
- `stagger`: ver [[Coreografía y stagger]].

Relacionado: [[GSAP]], [[Easing]], [[Timelines]]
