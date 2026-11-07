# GSAP con React
Usa el hook `useGSAP`, que limpia las animaciones al desmontar el componente.

```jsx
const ref = useRef();
useGSAP(() => {
  gsap.from(".item", { y: 20, opacity: 0, stagger: 0.05 });
}, { scope: ref });
```
- `scope` limita los selectores al componente.

Relacionado: [[GSAP]], [[Tweens]]
