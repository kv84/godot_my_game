extends Area2D


var active = false



func _ready():
	connect('body_entered', self, '_on_NPC_body_entered')
	connect('body_exited', self, '_on_NPC_body_exited')

func _process(delta):
	get_parent().get_node("Control2").visible = active
	#$Quest.visible = active

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true
		#get_parent().get_node("Control2").visible = true
		#get_tree().paused = true
		
		#get_tree().change_scene("res://DialogBox.tscn")	

func _on_NPC_body_exited(body):
	if body.name =='Player':
		active = false

#func _on_Tabs_pressed():
#	$Panel.visible = true
#	showTxt()
