# Handoff Notes

Agent-to-agent continuity notes: every completed task leaves a
`<task_id>.md` here (orchestration prompt §13.6). No agent starts a task
without reading its predecessor's handoff.

Human contributors: these notes are public on purpose. They're the most
honest record of what changed and what's unresolved — reading them before
touching a service is strongly recommended.

Format:

```yaml
---
task_id: T-fed-014
from_agent: RelayEng
to_agents: [AppViewEng, SREEng]
status: done
what_changed: "..."
interfaces_touched: [...]
open_questions: [...]
next_steps: [...]
---
```
