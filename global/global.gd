extends Node

#Global Variables
@onready var bpm: float = 120.0
@onready var gameWon: int = -1
@onready var gameTimeScaleFactor: float = 1.0

@onready var streak: int = 0
@onready var gameCount: int = 0
@onready var totalLives: int = 4
