# Session start hook for new-youth-skill (Windows PowerShell)
# This hook is called when a new session starts

$SkillPath = Join-Path $PSScriptRoot "..\skills\new-youth\SKILL.md"

if (Test-Path $SkillPath) {
    # Skill is available for context injection
    exit 0
} else {
    exit 1
}
