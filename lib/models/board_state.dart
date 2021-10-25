List<double> boardStateDummy = [
  0.0, 0.0, 0.0, 2.0, 0.0, 0.0, 0.0,
  0.0, 0.0, 2.2, 0.0, 2.3, 0.0, 0.0,
  0.0, 2.4, 0.0, 2.1, 0.0, 2.5, 0.0,
  7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1,
  7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
  7.0, 7.0, 7.0, 7.0, 7.0, 7.0, 7.0,
  7.1, 7.1, 7.1, 7.1, 7.1, 7.1, 7.1,
  0.0, 1.4, 0.0, 1.1, 0.0, 1.5, 0.0,
  0.0, 0.0, 1.2, 0.0, 1.3, 0.0, 0.0,
  0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0,
];

// 0.0 = empty tile
// 1.0 = player's 1 flag
// 1.1 = player 1a
// 1.2 = player 1b
// 1.3 = player 1c
// 1.4 = player 1d
// 1.5 = player 1e
// 2.0 = player's 2 flag
// 2.1 = player 2a
// 2.2 = player 2b
// 2.3 = player 2c
// 2.4 = player 2d
// 2.5 = player 2e
// 5.0 = player's 1 minefield
// 6.0 = player's 2 minefield
// 7.0 = wall
// 8.0 = tiles that player can move to (blinking tile)