# Connect Four

A command-line implementation of the classic game of Connect Four, built with Ruby. This project was developed as part of The Odin Project curriculum.

### 🎯 About The Project

This is a two-player game where players take turns dropping colored discs into a vertically suspended grid. The goal is to be the first to get four of your pieces in a row, either horizontally, vertically, or diagonally.

The project is structured with three classes to separate concerns:

* **Game:** Manages the game flow, player turns, and win conditions.

* **Gameboard:** Handles the board's state, placing pieces, and checking for valid moves.

* **main.rb:** Serves as the entry point, running the game loop and handling user input/output.

### Prerequisites

* **Ruby** (version 3.0 or higher is recommended)

### Installation

* Clone the repository:

```
git clone https://github.com/your_username/odin-connect-four.git
```

* Navigate to the project directory:

```
cd odin-connect-four
```

### How to Play

Simply run the main.rb file from your terminal:

```
ruby main.rb
```

Follow the prompts to enter a column number (0-6) to drop your piece. The game will automatically detect a winner or a draw and prompt you to play again.

### 🧪 Testing

The project includes an RSpec test suite to ensure the game logic is working correctly.

To run the tests, first make sure you have the RSpec gem installed:

```
gem install rspec
```

Then, run the RSpec command from the project's root directory:

```
rspec
```

### 📄 License

Distributed under the MIT License. See LICENSE.md for more information.