extends Node

#Global Variables
@onready var bpm: float = 120.0
@onready var gameWon: bool = false

#Global Audio
@onready var earlyTransition: AudioStreamPlayer = $earlyTransition
