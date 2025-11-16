class_name Enemy extends Node2D

var max_health: float = 100.0
var health: float:
	set(new_health):
		if new_health <= 0: die()
		else:
			health = min(new_health, max_health)

var speed: float = 5.0
var damage: float = 20.0

const ENEMY = preload("uid://bhw781t7ym1lx")

static func create(root: Node2D, enemy := ENEMY, max_health: float = 100.0, speed: float = 5.0, damage: float = 20.0) -> Enemy:
	var instance: Enemy = enemy.instantiate()
	
	instance.max_health = max_health
	instance.health = max_health
	instance.speed = speed
	instance.damage = damage
	
	instance.owner = root
	root.get_node("%EnemyManager").add_child(instance)
	return instance

func die():
	pass
