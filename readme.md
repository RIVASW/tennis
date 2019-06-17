This is a scoring system for tennis.

Watch this for scoring rules https://en.wikipedia.org/wiki/Tennis_scoring_system

How to use example:

```

  match = new Match('Player 1', 'Player 2')
  match.point_won_by('Player 1')
  match.point_won_by('Player 2')
  // this will return '0 - 0, 15 - 15'
  match.score()

  match.point_won_by('Player 1')
  match.point_won_by('Player 1')
  // this will return '0 - 0, 40 - 15'
  match.score()

  match.point_won_by('Player 2')
  match.point_won_by('Player 2')
  // this will return '0 - 0, Deuce'
  match.score()

  match.point_won_by('Player 1')
  // this will return '0 - 0, Advantage Player 1'
  match.score()

  match.point_won_by('Player 1')
  // this will return '1 - 0'
  match.score()

```
