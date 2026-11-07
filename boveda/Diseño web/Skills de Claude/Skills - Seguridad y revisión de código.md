---
tags: [skills, claude]
---
# Skills - Seguridad y revisión de código

Análisis estático y revisión de cambios con enfoque de seguridad.

**Origen:** trailofbits/skills (plugins static-analysis y differential-review)

| Skill | Para qué sirve |
|---|---|
| `semgrep` | Runs a Semgrep security scan over a codebase: detects languages, selects rulesets, presents the plan for explicit approval, then runs every approved ruleset through scripts/run-scans.sh, which batches the semgrep process |
| `codeql` | Scans a codebase for security vulnerabilities using CodeQL's interprocedural data flow and taint tracking analysis. |
| `sarif-parsing` | Parses and processes SARIF files from static analysis tools like CodeQL, Semgrep, or other scanners. |
| `differential-review` | Performs security-focused differential review of code changes. |

Volver a [[Mapa - Skills de Claude]]
