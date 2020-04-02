extends Actor

class_name Enemy

export var init_num = 2
export var init_denom = 3

var is_right_direction: = true

func _ready():
	health.num = init_num
	health.denom = init_denom
	update_health_label()

func _physics_process(delta: float) -> void:
	if is_on_floor():
		check_direction()
		if is_right_direction:
			move_right()
		else:
			move_left()
			
func check_direction() -> void:
	if is_on_wall():
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.collision_layer == Constants.PLAYER_LEVEL:
				print("Enemy met player")
				collision.collider.fight(self)
				return
		#switch direction
		if is_right_direction:
			is_right_direction = false
		else:
			is_right_direction = true
