# Mi setup de Claude Code + Obsidian

Este repo tiene dos cosas:

1. **`boveda/`**: una bóveda de Obsidian con notas sobre diseño web, animación, GSAP y las skills de Claude Code, todas enlazadas entre sí.
2. **`instalar-skills.ps1`**: un script que instala en tu PC las mismas ~85 skills de Claude Code que uso yo, descargadas de sus repositorios oficiales.

## Requisitos

- Windows 10 u 11
- [Git](https://git-scm.com): `winget install Git.Git`
- [Claude Code](https://claude.com/claude-code)
- [Obsidian](https://obsidian.md), para ver las notas
- Opcional: Python 3.10 o superior, para Graphify

## Instalación

### 1. Descargar el repo
```powershell
git clone https://github.com/juannizo149-dev/mi-setup-claude.git
cd mi-setup-claude
```

### 2. Instalar las skills
```powershell
powershell -ExecutionPolicy Bypass -File .\instalar-skills.ps1
```
Las skills se instalan en `C:\Users\TU_USUARIO\.claude\skills\` y funcionan en todos tus proyectos.

Si ya tienes alguna skill con el mismo nombre, el script no la toca. Para sobrescribirlas, añade `-Force`. Para no instalar Graphify, añade `-SinGraphify`.

Cuando termine, reinicia Claude Code.

### 3. Abrir las notas
En Obsidian, elige **Abrir carpeta como bóveda** y selecciona la carpeta `boveda`. Empieza por estas dos notas:
- **Mapa - Diseño web**
- **Mapa - Skills de Claude**

Pulsa `Ctrl+G` para ver el grafo de conexiones entre notas.

## Qué skills se instalan

| Origen | Skills |
|---|---|
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | impeccable |
| [Jakubantalik/transitions.dev](https://github.com/Jakubantalik/transitions.dev) | transitions-dev, transitions-polish, transitions-ui-generation |
| [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) | make-interfaces-feel-better |
| [greensock/gsap-skills](https://github.com/greensock/gsap-skills) | gsap-* (8 skills) |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | animate, review-animations, apple-design… (17 skills) |
| [anthropics/skills](https://github.com/anthropics/skills) | frontend-design, docx, xlsx, pptx, pdf, skill-creator… (todas excepto claude-api, que ya viene integrada en Claude Code) |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | ui-ux-pro-max, design, design-system, ui-styling, brand, banner-design, slides |
| [vercel-labs/agent-skills](https://github.com/vercel-labs/agent-skills) | react-best-practices, web-design-guidelines, deploy-to-vercel… |
| [wshobson/agents](https://github.com/wshobson/agents) | plugin python-development (16 skills) |
| [trailofbits/skills](https://github.com/trailofbits/skills) | semgrep, codeql, sarif-parsing, differential-review |
| [Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify) | graphify, que se instala con pip |

Este repo no incluye copias de las skills. El script las descarga de sus repositorios oficiales, así que cada una mantiene su propia licencia.
