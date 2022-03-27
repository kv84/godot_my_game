extends Area2D


var active = false
var dialog = 0



func _ready():
	connect('body_entered', self, '_on_NPC_body_entered')
	connect('body_exited', self, '_on_NPC_body_exited')

#func _process(delta):
	#get_parent().get_node("Control2/Panel").visible = active
	#$Quest.visible = active

func _on_NPC_body_entered(body):
	if body.name == 'Player':
		dialog += 1
		#active = true
		if dialog<2:
			get_parent().get_node("Control2").visible = true
			get_parent().get_node("Control2/Panel").visible = true
			var cc = get_parent().get_node("Player/Camera2D").get_camera_position() 
			get_parent().get_node("Control2").rect_position.x = cc.x - 508
			get_parent().get_node("Control2").rect_position.y = cc.y - 295
			get_tree().paused = true
			print(cc.x)
		
		#get_tree().change_scene("res://DialogBox.tscn")	

func _on_NPC_body_exited(body):
	if body.name =='Player':
		active = false

#func _on_Tabs_pressed():
#	$Panel.visible = true
#	showTxt()
