extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
#	play()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	$Time.start()
	
	
func _on_timer_timeout():
	play()
