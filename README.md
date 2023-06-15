# The Pawn Simulator.

The code accepts the inputs as arguments in the script file (**pawn_simulator.rb**) itself. 
The script is called from within the file itself. The inputs should be in an array format.

Examples: 
 - **Valid Inputs** :
["PLACE 2 3 N White", "Move", "left", "MOVE", "RIGHT", "mOVE", "REPORT"]

	**Output**:
	Command : PLACE 2 3 N WHITE
	Current position: (2, 3) || Facing: N || Color: White
	Command : MOVE
	Moved North. Current position: (2, 4)
	Current position: (2, 4) || Facing: N || Color: black
	Command : LEFT
	Current position: (2, 4) || Facing: W || Color: black
	Command : MOVE
	Moved West. Current position: (1, 4)
	Current position: (1, 4) || Facing: W || Color: white
	Command : RIGHT
	Current position: (1, 4) || Facing: N || Color: white
	Command : MOVE
	Moved North. Current position: (1, 5)
	Current position: (1, 5) || Facing: N || Color: black
	Command : REPORT
	Current position: (1, 5)
	Current facing direction: N
	Current color: black
	Current position: (1, 5) || Facing: N || Color: black

- **Invalid Inputs**
	["PLACE 2 3 N Blue", "MOVE_RIGHT", "ELFT", "MOVE", "RIGHT", "MOVE", "REPORT"]
	The first input is invalid and will be ignored. Thus the pawn will never be placed on the board.

	**Output**:
	Command : PLACE 2 3 N BLUE
	Coordinates out of board. Pawn not placed.
	Command : MOVE_RIGHT
	Command : ELFT
	Command : MOVE
	Pawn not placed.
	Command : RIGHT
	Cannot rotate right. Pawn not placed.
	Command : MOVE
	Pawn not placed.
	Command : REPORT
	Pawn has not been placed yet!
	
**Note** :
The inputs are case-insensitive. This is represented in the first example above. 