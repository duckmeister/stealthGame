extends Node
##A Node for handeling the game state

var points = 0 ##Points earned for capturing locations


func add_point():
	points += 1
	print(points)
