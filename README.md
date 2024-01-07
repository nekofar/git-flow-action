# Git Flow Action

[![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/nekofar/git-flow-action?include_prereleases)](https://github.com/nekofar/git-flow-action/releases)
[![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/nekofar/git-flow-action/prepare.yml)](https://github.com/nekofar/git-flow-action/actions/workflows/prepare.yml)
[![GitHub](https://img.shields.io/github/license/nekofar/git-flow-action)](https://github.com/nekofar/git-flow-action/blob/master/LICENSE)
[![X (formerly Twitter) Follow](https://img.shields.io/badge/follow-%40nekofar-ffffff?logo=x&style=flat)](https://x.com/nekofar)
[![Farcaster (Warpcast) Follow](https://img.shields.io/badge/follow-%40nekofar-855DCD.svg?logo=data:image/svg%2bxml;base64,PHN2ZyB3aWR0aD0iMzIzIiBoZWlnaHQ9IjI5NyIgdmlld0JveD0iMCAwIDMyMyAyOTciIGZpbGw9Im5vbmUiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxwYXRoIGQ9Ik01NS41ODY3IDAuNzMzMzM3SDI2My40MTNWMjk2LjI2N0gyMzIuOTA3VjE2MC44OTNIMjMyLjYwN0MyMjkuMjM2IDEyMy40NzkgMTk3Ljc5MiA5NC4xNiAxNTkuNSA5NC4xNkMxMjEuMjA4IDk0LjE2IDg5Ljc2NDIgMTIzLjQ3OSA4Ni4zOTI2IDE2MC44OTNIODYuMDkzM1YyOTYuMjY3SDU1LjU4NjdWMC43MzMzMzdaIiBmaWxsPSJ3aGl0ZSIvPgo8cGF0aCBkPSJNMC4yOTMzMzUgNDIuNjhMMTIuNjg2NyA4NC42MjY3SDIzLjE3MzNWMjU0LjMyQzE3LjkwODIgMjU0LjMyIDEzLjY0IDI1OC41ODggMTMuNjQgMjYzLjg1M1YyNzUuMjkzSDExLjczMzNDNi40NjgyMiAyNzUuMjkzIDIuMiAyNzkuNTYyIDIuMiAyODQuODI3VjI5Ni4yNjdIMTA4Ljk3M1YyODQuODI3QzEwOC45NzMgMjc5LjU2MiAxMDQuNzA1IDI3NS4yOTMgOTkuNDQgMjc1LjI5M0g5Ny41MzMzVjI2My44NTNDOTcuNTMzMyAyNTguNTg4IDkzLjI2NTEgMjU0LjMyIDg4IDI1NC4zMkg3Ni41NlY0Mi42OEgwLjI5MzMzNVoiIGZpbGw9IndoaXRlIi8+CjxwYXRoIGQ9Ik0yMzQuODEzIDI1NC4zMkMyMjkuNTQ4IDI1NC4zMiAyMjUuMjggMjU4LjU4OCAyMjUuMjggMjYzLjg1M1YyNzUuMjkzSDIyMy4zNzNDMjE4LjEwOCAyNzUuMjkzIDIxMy44NCAyNzkuNTYyIDIxMy44NCAyODQuODI3VjI5Ni4yNjdIMzIwLjYxM1YyODQuODI3QzMyMC42MTMgMjc5LjU2MiAzMTYuMzQ1IDI3NS4yOTMgMzExLjA4IDI3NS4yOTNIMzA5LjE3M1YyNjMuODUzQzMwOS4xNzMgMjU4LjU4OCAzMDQuOTA1IDI1NC4zMiAyOTkuNjQgMjU0LjMyVjg0LjYyNjdIMzEwLjEyN0wzMjIuNTIgNDIuNjhIMjQ2LjI1M1YyNTQuMzJIMjM0LjgxM1oiIGZpbGw9IndoaXRlIi8+Cjwvc3ZnPgo=&style=flat)](https://warpcast.com/nekofar)
[![Donate](https://img.shields.io/badge/donate-nekofar.crypto-a2b9bc?logo=ko-fi&logoColor=white)](https://ud.me/nekofar.crypto)

> [!WARNING]
> Please note that the project is currently in an experimental phase and it is subject to significant changes as it
> progresses.

<!--
This repository provides a comprehensive template for creating GitHub Actions using Shell Scripts. It encapsulates best
practices in scripting and interaction with the GitHub Actions environment.

## Features

1. **Scalable**: Enable easy scaling and modification of your Action steps using Shell scripts.
2. **Compatibility**: Designed to work seamlessly with the GitHub Actions environment.
3. **Best Practices**: Incorporates shell scripting best practices for enhanced efficiency and reliability.

## Example

```yaml
# Name of the workflow
name: Greeting Workflow

# Events that trigger the workflow
on: [ push, pull_request ]

# Define a single job named 'greeting'
jobs:
  greeting:
    # The type of machine that this job can run on
    runs-on: ubuntu-latest
    # List of steps this job will run
    steps:
      - name: Greet and Record Time  # Name for this step
        id: hello  # Unique identifier for the step to reference its outputs in other steps   
        uses: nekofar/git-flow-action@master  # Specifies the action to run as part of this step
        with: # Inputs for the 'uses' action
          who-to-greet: 'GitHub User'  # The 'who-to-greet' input for 'Hello World Action'

      - name: Get the output time  # Name for this step
        run: echo "The time was ${{ steps.hello.outputs.time }}"  # Display the 'time' output from 'hello' step
```

## Options

The configuration used in the GitHub Action workflow includes several options for customization. Below is a description
of these:

| Option         | Description                                                                                          |
|----------------|------------------------------------------------------------------------------------------------------|
| `who-to-greet` | This input is used to specify who to greet. If not provided, the default value 'World' will be used. |

## Contributing

We value your input and help! If you're interested in contributing, please reference
our [Contributing Guidelines](./CONTRIBUTING.md). Contributions aren't just about code - any bug reports, feedback, or
documentation enhancements are welcomed. Thanks for helping to improve this project!
-->
