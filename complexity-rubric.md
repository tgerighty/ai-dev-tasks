# Complexity Rubric (1–10 overall; leaf ≤4)

Purpose
- Provide a consistent, practical scoring rubric for task sizing.
- Enable automatic decomposition for items scored >4 into leaf tasks ≤4.

Scoring Dimensions (weigh qualitatively)
- Implementation difficulty: algorithmic complexity, edge cases, data model impact
- Time required: estimated effort in hours/days for a typical contributor
- Dependencies/integration: external services, cross-module coupling, sequencing
- Uncertainty/novelty: unfamiliar tech, unclear requirements, experimentation needed

Scale Definitions
- 1: Trivial change
  - Examples: typo, copy change, toggle a config flag, add a constant
  - Scope: single line/file, negligible risk
- 2: Small, localized change
  - Examples: new small util, simple form validation, add a basic UI element, one straightforward API endpoint
  - Scope: single file or a couple files, low risk
- 3: Medium change
  - Examples: modify data flow across a component + service, add non-trivial validation, integrate a library with basic configuration
  - Scope: multiple files/modules, moderate risk, requires tests
- 4: Large but bounded change
  - Examples: new self-contained component/service, external API integration with retries, add search to a page with indexing
  - Scope: multiple modules, notable risk, tests + docs updates required
- 5–10: Epic/high-level items (must decompose)
  - Examples: “Implement SSO”, “Build PRD engine”, “Create DMS with versioning”
  - Action: Break down until all leaf tasks are ≤4

Rules
- Assign 1–10 at ideation; decompose anything >4 into smaller subtasks.
- Only leaf tasks carry complexity; parents are containers (no scores).
- Use the same rubric across frontend, backend, data, and ops tasks.
- Re-evaluate scores after decomposition; adjust if scope changes.

Decomposition Triggers
- Any single step needs >1 integration or cross-cutting change
- Touches >3 modules/files in separate areas
- Requires both UI and backend changes together
- Unclear acceptance criteria or high uncertainty

Examples
- “Add ARIA attributes to Button”: 2
- “Implement retry with exponential backoff for AI calls”: 4
- “Implement Microsoft Entra SSO end-to-end”: 7 → decompose to 2–4 point leaf tasks

