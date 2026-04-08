# Validation script for new-youth-skill (Windows PowerShell)
# This script validates the skill installation

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "New Youth Skill - Validation Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

$ErrorActionPreference = "Stop"

# Check if SKILL.md exists
if (Test-Path "skills/new-youth/SKILL.md") {
    Write-Host "✅ SKILL.md found" -ForegroundColor Green
} else {
    Write-Host "❌ SKILL.md not found" -ForegroundColor Red
    exit 1
}

# Check if SKILL.md has valid frontmatter
$content = Get-Content "skills/new-youth/SKILL.md" -Head 5 -ErrorAction SilentlyContinue
if ($content -match "^---") {
    Write-Host "✅ Frontmatter detected" -ForegroundColor Green
} else {
    Write-Host "❌ Invalid frontmatter" -ForegroundColor Red
    exit 1
}

# Check required fields in frontmatter
$skillContent = Get-Content "skills/new-youth/SKILL.md" -Raw
$requiredFields = @("name:", "description:", "version:")
foreach ($field in $requiredFields) {
    if ($skillContent -match $field) {
        Write-Host "✅ Field '$field' found" -ForegroundColor Green
    } else {
        Write-Host "❌ Field '$field' missing" -ForegroundColor Red
        exit 1
    }
}

# Check if scripts exist
if (Test-Path "scripts/youth-index.py") {
    Write-Host "✅ youth-index.py found" -ForegroundColor Green
} else {
    Write-Host "⚠️ youth-index.py not found (optional)" -ForegroundColor Yellow
}

if (Test-Path "scripts/daily-task-generator.py") {
    Write-Host "✅ daily-task-generator.py found" -ForegroundColor Green
} else {
    Write-Host "⚠️ daily-task-generator.py not found (optional)" -ForegroundColor Yellow
}

# Check commands directory
if (Test-Path "commands") {
    Write-Host "✅ commands/ directory found" -ForegroundColor Green
} else {
    Write-Host "⚠️ commands/ directory not found (optional)" -ForegroundColor Yellow
}

# Check references directory
if (Test-Path "skills/new-youth/references") {
    Write-Host "✅ references/ directory found" -ForegroundColor Green
} else {
    Write-Host "⚠️ references/ directory not found (optional)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✅ Validation complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "To use with Claude Code:" -ForegroundColor White
Write-Host "  claude --plugin-dir ." -ForegroundColor Gray
Write-Host "" -ForegroundColor White
Write-Host "To use with OpenClaw:" -ForegroundColor White
Write-Host "  Copy skills/new-youth/ to your skills directory" -ForegroundColor Gray
