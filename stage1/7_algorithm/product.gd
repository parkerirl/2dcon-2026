extends Node2D

var index: int = -1

func set_image(path):
	print(path)
	$"ProdImg".texture = load(path)

func set_index(i):
	index = i
