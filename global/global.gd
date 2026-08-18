extends Node

#Global Variables
@onready var bpm: float = 120.0
@onready var gameWon: int = -1

#Global Audio
@onready var earlyTransition: AudioStreamPlayer = $earlyTransition

@onready var gameTimeScaleFactor: float = 1.33
