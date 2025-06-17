extends RigidBody2D

class_name Panda2

@export var move_force := 1000.0
@export var jump_force := -1200.0
@export var gravity := 900.0
@export var max_speed := 700.0
@export var knockback_strength := 1000.0 

@export var player_id = 1
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_resetting = false
var pending_reset_position: Vector2

func _ready():
	contact_monitor = true
	max_contacts_reported = 4
	
func _integrate_forces(state: PhysicsDirectBodyState2D):
	if is_resetting:
		var new_transform = state.transform
		new_transform.origin = pending_reset_position
		state.transform = new_transform
		
		linear_velocity = Vector2.ZERO
		angular_velocity = 0.0
		is_resetting = false
		return
	
	
	apply_central_force(Vector2(0, gravity))
	
	var input_left = "Left2" if player_id == 1 else "Left2"
	var input_right = "Right2" if player_id == 1 else "Right2"
	var input_jump = "Jump2" if player_id == 1 else "Jump2"
	
	if Input.is_action_pressed(input_left):
		apply_central_force(Vector2(-move_force, 0))
	elif Input.is_action_pressed(input_right):
			apply_central_force(Vector2(move_force, 0))
			
	if linear_velocity.length() > max_speed:
		linear_velocity = linear_velocity.normalized() * max_speed
	if Input.is_action_just_pressed(input_jump):
		apply_central_impulse(Vector2(0, jump_force))
		animation_player.play("2Jump")

	
	for i in range(state.get_contact_count()):
		var collider = state.get_contact_collider_object(i)
		if collider is Panda1 and collider != self:
			var direction = (global_position - collider.global_position).normalized()
			apply_central_impulse(direction * knockback_strength)
