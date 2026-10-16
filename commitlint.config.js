{
  "extends": ["@commitlint/config-conventional"],
  "rules": {
    "header-max-length": [2, "always", 100],
    "type-enum": [
      2,
      "always",
      ["feat", "fix", "docs", "spec", "refactor", "perf", "test", "build", "ci", "chore", "security", "revert"]
    ],
    "scope-enum": [
      2,
      "always",
      ["identity", "social-graph", "pds", "relay", "appview", "video", "delivery", "response", "amplify", "moderation", "client", "infra", "protocol", "docs", "tools", "skills", "agents", "repo"]
    ]
  }
}
