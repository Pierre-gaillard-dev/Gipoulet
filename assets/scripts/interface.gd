extends CanvasLayer

@export var player: Node3D
@export var timer: RichTextLabel
@export var speedText: RichTextLabel
var time: int = 0

func updateTimer() -> void:
	var hours = str(8+floor((55+floor(time/60))/60))
	var minutes = str((55+floor(time/60))%60)
	var sec = str(time%60)
	
	if minutes.length() <=1:
		minutes = "0"+minutes
	if sec.length() <=1:
		sec= "0"+sec
	
	timer.text = hours+":"+minutes+":"+sec

func updatespeed() -> void:
	var speed = str(round(player.speed *100) /100)
	speedText.text = speed + " m/s"

func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ProgressBar.value = (player.distance / player.distance_max) *100
	updateTimer()
	updatespeed()


func _on_timer_timeout() -> void:
	if player.playing:
		time += 5
