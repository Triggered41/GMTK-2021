extends Control


var style_box = load("res://GUI/progress_bar.tres")
onready var bar = $ProgressBar

func _physics_process(delta):
	bar.value = lerp(bar.value, GLobalData.health, 0.1)

func _on_ProgressBar_value_changed(value):
	var color_mix = value/100
	
	var color = remap_range(color_mix, 0.5, 1, 0.0, 1.0)
	
	if color_mix >= 0.50:
		style_box.bg_color = lerp(Color.yellow, Color.green, color)
	else:
		color = remap_range(color_mix, 0.0, 0.5, 0.0, 1.0)
		style_box.bg_color = lerp(Color.red, Color.yellow, color)

func remap_range(value, InputA, InputB, OutputA, OutputB):
	return(value - InputA) / (InputB - InputA) * (OutputB - OutputA) + OutputA
