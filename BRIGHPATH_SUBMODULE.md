# Brightpath controller submodule

The folder `brightpath_swarm` is a Git submodule pointing at the Brightpath controller repo
(swarm). It provides shared docs such as the project maturity rubric.

## First-time clone (CI or new machine)

```bash
git clone --recurse-submodules https://github.com/BrightforestX/zudoku-docs.git
# or, if you already cloned without submodules:
git submodule update --init --recursive
```

## Update submodule to latest swarm

```bash
git submodule update --remote brightpath_swarm
git add brightpath_swarm
git commit -m "chore: update brightpath_swarm submodule"
```

## Key file for agents

- **Project maturity rubric:** `brightpath_swarm/docs/project-maturity-health-rubric.md`
