---
tags: [skills, claude, guía]
---
# Cómo instalamos las skills

Una *skill* es una carpeta con un archivo `SKILL.md` (instrucciones + descripción) y, a veces, archivos de referencia o scripts. Claude Code carga las que hay en:

- `C:\Users\nizzo\.claude\skills\` → **globales**, en todos los proyectos.
- `<proyecto>\.claude\skills\` → solo en ese proyecto.

## Método 1: con git (el que usamos casi siempre)
1. Clonar el repo en una carpeta temporal vacía:
   `git clone --depth 1 https://github.com/usuario/repo.git`
2. Buscar dónde están las skills: `find . -name SKILL.md`
3. Revisar qué contiene cada una (que no ejecute nada raro).
4. Copiar **solo la carpeta de la skill** a `~/.claude/skills/`.
5. Comprobar que no choque con otra skill del mismo nombre.
6. Reiniciar la sesión de Claude para que la cargue.

## Método 2: con el CLI `skills` (necesita Node.js)
```
npx skills add usuario/repo -g -a claude-code -y
npx skills add usuario/repo --skill nombre -g -a claude-code -y
```
- `-g` = global. Sin él se instala solo en la carpeta actual.
- Node.js se instaló con `winget install OpenJS.NodeJS.LTS`.

## Método 3: skills que son programas (ej. Graphify)
Algunas necesitan instalar una herramienta además de la skill:
```
python -m pip install --user graphifyy
python -m graphify install
```

## Historial
1. `impeccable` (pbakaus) - git
2. `transitions-*` (transitions.dev) - git
3. `make-interfaces-feel-better` - git (aún no había Node)
4. `gsap-*` (greensock) - git
5. Skills de Emil Kowalski - git
6. Node.js instalado
7. Graphify - pip
8. anthropics/skills, ui-ux-pro-max, vercel-labs, python-development, Trail of Bits - git

## Notas
- No se instaló `claude-api` de anthropics/skills porque Claude Code ya trae una versión integrada.
- De Trail of Bits solo se instalaron `static-analysis` y `differential-review` (el repo tiene ~96 skills).
- Las carpetas `C:\Users\nizzo\tmp_dl*` eran temporales y se pueden borrar.

Ver: [[Mapa - Skills de Claude]], [[Cómo usar las skills]]
