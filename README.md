# Mastermind

A command-line implementation of the classic **Mastermind** code-breaking game, developed in Ruby as part of [The Odin Project](https://www.theodinproject.com/).

The project features two gameplay modes: a human player attempting to discover a secret code and a computer solver that uses a deduction strategy to find it.

## Features

- **Human vs. Code:** Play as the codebreaker and attempt to discover the computer-generated secret code.
- **Computer Solver:** Watch the computer attempt to identify a secret code using a logical deduction strategy.
- **Colorful Terminal Interface:** Uses the `colorize` gem to improve readability and distinguish game elements.
- **Input Validation:** Handles user input and validates guesses.
- **Modular Architecture:** Separates game logic, input handling, board rendering, configuration, and the computer-solving algorithm.

## Technologies

- **Ruby** — Main programming language.
- **Colorize** — Terminal text coloring.

## Requirements

- Ruby installed on your system.
- The `colorize` gem (version 1.1.0).

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/thiagoono/odin-mastermind.git
cd odin-mastermind
```

### 2. Install the Dependency

Install the required gem:

```bash
gem install colorize
```

### 3. Run the Game

From the project root, execute:

```bash
ruby lib/mastermind.rb
```

## Gameplay

Mastermind is a code-breaking game in which the player must discover a hidden sequence of colors.

The game provides two modes:

### Human Gameplay

The human player attempts to discover the secret code by submitting guesses. After each attempt, the game provides feedback indicating how many colors were correctly identified and how many were placed in the correct positions.

### Computer Gameplay

In this mode, the computer acts as the codebreaker. It analyzes the feedback received after each guess and uses the information to progressively narrow down the possibilities until it identifies the secret code.

## Project Structure

```text
odin-mastermind/
├── lib/
│   ├── mastermind/
│   │   ├── base_game.rb
│   │   ├── board.rb
│   │   ├── computer_game.rb
│   │   ├── game_config.rb
│   │   ├── game_solver.rb
│   │   ├── human_game.rb
│   │   └── input_handler.rb
│   └── mastermind.rb
├── rascunho.txt
└── README.md
```

## Code Organization

The project is organized into separate components, each responsible for a specific part of the application.

| File | Responsibility |
|---|---|
| `mastermind.rb` | Application entry point. Loads the necessary components and starts the game. |
| `base_game.rb` | Contains shared game logic used by the gameplay modes. |
| `board.rb` | Handles the terminal board and game information display. |
| `computer_game.rb` | Implements the computer gameplay mode. |
| `game_config.rb` | Defines shared game constants and configuration. |
| `game_solver.rb` | Implements the computer's deduction strategy. |
| `human_game.rb` | Implements the human gameplay mode. |
| `input_handler.rb` | Handles input collection and validation. |

## AI Assistance

AI tools, particularly ChatGPT, were used as development support during the implementation of this project.

The computer-solving strategy was conceived and documented by the author in [`rascunho.txt`](rascunho.txt) before its implementation. AI assistance was used only to translate the reasoning into Ruby code:


## Acknowledgments

This project was developed as part of [The Odin Project](https://www.theodinproject.com/), an open-source curriculum for learning web development.