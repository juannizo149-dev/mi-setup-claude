# Instala las skills de Claude Code de este setup, descargándolas de sus repos oficiales.
# Uso:  powershell -ExecutionPolicy Bypass -File .\instalar-skills.ps1  [-Force] [-SinGraphify]
#   -Force        sobrescribe skills que ya existan
#   -SinGraphify  no instala Graphify (necesita Python)

param([switch]$Force, [switch]$SinGraphify)
$ErrorActionPreference = 'Stop'

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Falta git. Instálalo con: winget install Git.Git" -ForegroundColor Red; exit 1
}

$destino = Join-Path $env:USERPROFILE '.claude\skills'
New-Item -ItemType Directory -Force $destino | Out-Null
$tmp = Join-Path $env:TEMP ("skills-" + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory $tmp | Out-Null

# repo => rutas (dentro del repo) de carpetas de skills; '*' = todas las subcarpetas
$fuentes = [ordered]@{
    'pbakaus/impeccable'                      = @('.claude/skills/impeccable')
    'Jakubantalik/transitions.dev'            = @('skills/transitions-dev', 'skills/transitions-polish', 'skills/transitions-ui-generation')
    'jakubkrehel/make-interfaces-feel-better' = @('skills/make-interfaces-feel-better')
    'greensock/gsap-skills'                   = @('skills/*')
    'emilkowalski/skills'                     = @('skills/*')
    'anthropics/skills'                       = @('skills/*')
    'nextlevelbuilder/ui-ux-pro-max-skill'    = @('.claude/skills/*')
    'vercel-labs/agent-skills'                = @('skills/*')
    'wshobson/agents'                         = @('plugins/python-development/skills/*')
    'trailofbits/skills'                      = @('plugins/static-analysis/skills/*', 'plugins/differential-review/skills/*')
}
# claude-api ya viene integrada en Claude Code
$excluir = @('claude-api')

$nuevas = 0; $saltadas = 0
try {
    foreach ($repo in $fuentes.Keys) {
        Write-Host "Descargando $repo ..." -ForegroundColor Cyan
        $dir = Join-Path $tmp ($repo -replace '/', '_')
        git clone --depth 1 -q "https://github.com/$repo.git" $dir
        if ($LASTEXITCODE -ne 0) { Write-Host "  No se pudo clonar $repo" -ForegroundColor Yellow; continue }

        foreach ($ruta in $fuentes[$repo]) {
            $carpetas = if ($ruta.EndsWith('/*')) {
                Get-ChildItem -Directory (Join-Path $dir $ruta.TrimEnd('*', '/'))
            } else { Get-Item (Join-Path $dir $ruta) }

            foreach ($c in $carpetas) {
                if (-not (Test-Path (Join-Path $c.FullName 'SKILL.md'))) { continue }
                if ($excluir -contains $c.Name) { continue }
                $obj = Join-Path $destino $c.Name
                if ((Test-Path $obj) -and -not $Force) { $saltadas++; continue }
                if (Test-Path $obj) { Remove-Item -Recurse -Force $obj }
                Copy-Item -Recurse $c.FullName $obj
                $nuevas++
            }
        }
    }
} finally {
    Remove-Item -Recurse -Force $tmp -ErrorAction SilentlyContinue
}

Write-Host "`nSkills instaladas: $nuevas   (ya existían: $saltadas)" -ForegroundColor Green

if (-not $SinGraphify) {
    if (Get-Command python -ErrorAction SilentlyContinue) {
        Write-Host "Instalando Graphify..." -ForegroundColor Cyan
        python -m pip install --user graphifyy
        python -m graphify install
    } else {
        Write-Host "Python no encontrado: Graphify no se instaló (opcional). Instala Python 3.10+ y vuelve a ejecutar." -ForegroundColor Yellow
    }
}

Write-Host "`nListo. Reinicia Claude Code para que cargue las skills." -ForegroundColor Green
