# Brightpath controller submodule

The folder `docs/brightpath_swarm` is a Git submodule pointing at the Brightpath controller repo
(swarm). It provides shared docs such as the project maturity rubric.

## First-time clone (CI or new machine)

```bash
git clone --recurse-submodules https://github.com/BrightforestX/zudoku.git
# or, if you already cloned without submodules:
git submodule update --init --recursive
```

## Update submodule to latest swarm

```bash
git submodule update --remote docs/brightpath_swarm
git add docs/brightpath_swarm
git commit -m "chore: update brightpath_swarm submodule"
```

## Key file for agents

- **Project maturity rubric:** `docs/brightpath_swarm/docs/project-maturity-health-rubric.md`
