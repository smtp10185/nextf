import 'dart:core';

class QueenSolution {
  int boardSize;
  late List<List<bool>> board;

  QueenSolution({required this.boardSize});

  run() {
    _initializeBoard();
    _queen(0);
  }

  _initializeBoard() {
    board = List.generate(boardSize, (_) => List.filled(boardSize, false));
  }

  _queen(int curRow) {
    if (curRow == boardSize) {
      _printResult();
    } else {
      for (int col = 0; col < boardSize; col++) {
        if (_isValid(curRow, col)) {
          board[curRow][col] = true;
          _queen(curRow + 1);
          board[curRow][col] = false;
        }
      }
    }
  }

  bool _isValid(int row, int col) {
    for (int i = 0; i < row; i++) {
      if (board[i][col] == true) return false;
    }
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
      if (board[i][j] == true) return false;
    }
    for (int i = row - 1, j = col + 1; i >= 0 && j < boardSize; i--, j++) {
      if (board[i][j] == true) return false;
    }
    return true;
  }

  void _printResult() {
    board.forEach((row) {
      String rowOutput = '';
      row.forEach((item) {
        rowOutput += item ? 'Q ' : '. ';
      });
      print(rowOutput.trim());
      print('');
    });
    print('');
  }
}
