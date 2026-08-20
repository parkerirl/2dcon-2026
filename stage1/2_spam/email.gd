extends Node2D

func get_junk():
	return $"DeleteEmail".junk

func set_junk(x):
	$"DeleteEmail".junk = x

func set_text(x):
	$"EmailText".text = x

func disable():
	$"DeleteEmail".disabled = true
