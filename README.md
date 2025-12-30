# prompt-log

A Claude Code plugin that logs all your prompts to a markdown file, creating a build log of how your project was developed.

## What it does

Every time you submit a prompt to Claude Code, this plugin appends it to a `prompt-build-log.txt` file in your project directory. This creates a numbered history of all the prompts you used to build your project.

Example output:

```markdown
# Prompt Build Log

This documents the prompts used to build this project with Claude.

---

## 1. User prompt
> Build a retro RTS game with pixel art units and fog of war

## 2. User prompt
> Add a harvester unit that collects crystals and returns them to base

## 3. User prompt
> Make the enemy AI build tanks and attack when it has enough resources
```

## Installation

```bash
claude plugin install tylerwanlass/prompt-log
```

Or clone and install locally:

```bash
git clone https://github.com/tylerwanlass/prompt-log.git
claude plugin install --path ./prompt-log
```

## Usage

Once installed, the plugin works automatically. Every prompt you submit will be logged to `prompt-build-log.txt` in your current working directory.

## License

MIT
