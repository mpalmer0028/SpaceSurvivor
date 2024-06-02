class_name Bullet
extends Area2D
@export var ship_input_vector:Vector2 = Vector2.ZERO
@export var ship_speed:float
var ship_velocity_effect = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	#var r = ((Vector2.UP.rotated(rotation)*2*ship_speed)+(ship_input_vector*ship_velocity_effect)).angle()
	#global_rotation = r
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	var move_vector = (Vector2.UP.rotated(rotation)*2*ship_speed*delta)+(ship_input_vector*ship_speed*ship_velocity_effect*delta)
	translate(move_vector)



func _on_body_entered(body):
	#print(body.name)
	var damage_comp:DamageableComponent = body.find_child("DamageableComp")
	if damage_comp:
		damage_comp.damage(25,self)
	queue_free()
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.
