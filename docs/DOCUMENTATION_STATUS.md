# Documentation Status - AI Dev Tasks v2

## Status Key
- ✅ **Current** - Up to date with v2
- ⚠️ **Deprecated** - Mostly replaced by v2 approach
- 📝 **Reference** - Still useful for reference
- 🗄️ **Archive** - Old versions

## Documentation Status

### Core Workflow Files
| File | Status | Notes |
|------|--------|-------|
| `create-prd.md` | ✅ v2.0 | Discovery-driven approach |
| `generate-tasks.md` | ✅ v2.0 | Pattern-based generation |
| `process-task-list.md` | ✅ v2.1 | Focused micro-tasks |

### Root Documentation
| File | Status | Notes |
|------|--------|-------|
| `README.md` | ✅ Updated | Reflects v2 workflow |
| `WHATS_NEW_V2.md` | ✅ New | Migration guide |
| `QUICK_REFERENCE.md` | ✅ New | One-page reference |
| `context-template.md` | ✅ Simplified | Now optional |
| `AGENTS.md` | ✅ Current | Token-optimized |

### /docs Folder
| File | Status | Notes |
|------|--------|-------|
| `complexity-rubric.md` | ⚠️ Deprecated | AI does scoring now with reasoning |
| `risk-assessment-framework.md` | ⚠️ Deprecated | Risk inherited from PRD only |
| `testing-guidelines.md` | ⚠️ Deprecated | Coverage % replaced with practical testing |
| `security-scan-exclusions.md` | ✅ Current | Still relevant for test organization |
| `MIGRATION_GUIDE.md` | 📝 Reference | Useful for understanding changes |
| `prd-version-comparison.md` | 📝 Reference | Shows v1 vs v2 differences |

### /examples Folder
| File | Status | Notes |
|------|--------|-------|
| `.snyk.example` | ✅ Current | Still useful |
| `sonar-project.properties.example` | ✅ Current | Still useful |
| `codeql-config.yml.example` | ✅ Current | Still useful |
| `gitlab-ci-security.yml.example` | ✅ Current | Still useful |
| `workflow-integration-example.md` | ⚠️ Outdated | Shows v1 workflow |

### /archive Folder
| File | Status | Notes |
|------|--------|-------|
| `create-prd-v1.0-*.md` | 🗄️ Archive | Original version |
| `generate-tasks-v1.0-*.md` | 🗄️ Archive | Original version |
| `process-task-list-v1.0-*.md` | 🗄️ Archive | Original version |

## Recommended Actions

### Immediate
1. ✅ **Done** - Updated core workflow files to v2
2. ✅ **Done** - Updated README with new approach
3. ✅ **Done** - Simplified context template
4. ✅ **Done** - Created migration guide

### Nice to Have
1. Add deprecation notice to old docs files
2. Update workflow-integration-example.md with v2 example
3. Consider moving deprecated docs to archive

### Keep As-Is
- Security scan configuration examples (still valuable)
- AGENTS.md (already optimized)
- Archive folder (historical reference)

## For Users

### If you're new:
- Start with `README.md`
- Reference `QUICK_REFERENCE.md`
- Use the 3 core workflow files

### If you're migrating:
- Read `WHATS_NEW_V2.md`
- Check `prd-version-comparison.md`
- Complete current work with v1, start new with v2

### If you need the old way:
- Check `/archive` folder
- All v1 files preserved there

## Bottom Line

The v2 workflow is simpler, faster, and more effective. Most old documentation about risk assessment, complexity scoring, and testing percentages is deprecated in favor of:
- Discovery-driven requirements
- Pattern-based task generation
- Focused micro-task implementation
- Practical testing

Focus on the 3 core files and ignore the complexity.