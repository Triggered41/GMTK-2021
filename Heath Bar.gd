extends ProgressBar

#the styleboxflat
var style_box = get("custom_styles/fg")
var current_color : Color

#the color values for the different hp values
export var color_high_health : Color
export var color_medium_health  : Color
export var color_low_health  : Color

func _process(delta):
	#sets label's text to hp 
	get_parent().get_node("Label").text = "HP: " + str(round(value))
	#sets bar color to color according to hp value
	style_box.bg_color = current_color
	
	if value > 33:
		current_color = color_low_health
	elif value > 66:
		current_color = color_medium_health
	else:
		current_color = color_high_health
