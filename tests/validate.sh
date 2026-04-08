#!/bin/bash
# Validation script for new-youth-skill
# This script validates the skill installation

set -e

echo "========================================"
echo "New Youth Skill - Validation Script"
echo "========================================"
echo ""

# Check if SKILL.md exists
if [ -f "SKILL.md" ]; then
    echo "✅ SKILL.md found"
else
    echo "❌ SKILL.md not found"
    exit 1
fi

# Check if SKILL.md has valid frontmatter
if head -5 SKILL.md | grep -q "^---"; then
    echo "✅ Frontmatter detected"
else
    echo "❌ Invalid frontmatter"
    exit 1
fi

# Check required fields in frontmatter
required_fields=("name:" "description:" "version:")
for field in "${required_fields[@]}"; do
    if grep -q "$field" SKILL.md; then
        echo "✅ Field '$field' found"
    else
        echo "❌ Field '$field' missing"
        exit 1
    fi
done

# Check if scripts exist
if [ -f "scripts/youth-index.py" ]; then
    echo "✅ youth-index.py found"
    python3 -m py_compile scripts/youth-index.py && echo "✅ youth-index.py syntax valid" || echo "❌ youth-index.py syntax error"
else
    echo "⚠️ youth-index.py not found (optional)"
fi

if [ -f "scripts/daily-task-generator.py" ]; then
    echo "✅ daily-task-generator.py found"
    python3 -m py_compile scripts/daily-task-generator.py && echo "✅ daily-task-generator.py syntax valid" || echo "❌ daily-task-generator.py syntax error"
else
    echo "⚠️ daily-task-generator.py not found (optional)"
fi

# Check commands directory
if [ -d "commands" ]; then
    echo "✅ commands/ directory found"
    command_count=$(ls -1 commands/*.md 2>/dev/null | wc -l)
    echo "   Found $command_count command files"
else
    echo "⚠️ commands/ directory not found (optional)"
fi

# Check references directory
if [ -d "references" ]; then
    echo "✅ references/ directory found"
else
    echo "⚠️ references/ directory not found (optional)"
fi

echo ""
echo "========================================"
echo "✅ Validation complete!"
echo "========================================"
echo ""
echo "To use with Claude Code:"
echo "  mkdir -p .claude/skills"
echo "  git clone https://github.com/Moroiser/new-youth-skill.git .claude/skills/new-youth-skill"
echo ""
echo "To use with OpenClaw:"
echo "  git clone https://github.com/Moroiser/new-youth-skill ~/.openclaw/workspace/skills/new-youth-skill"
