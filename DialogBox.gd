extends Control

var txtArr = []
var txtBrr 
var txtSpeed = 0.1

func _ready():
	txtArr = txtload()
	txtBrr = txtArr["Con"]
	showTxt()
	print(txtBrr)

func txtload():
	var filePath = 'res://Dialog_A.json'
	var file = File.new()
	if not file.file_exists(filePath):
		return ''
	else:
		file.open(filePath, File.READ)
		var content = file.get_as_text()
		return parse_json(content)	

var index = 0
var index2 = 1
var index3 = 0
var isCanNext
func showTxt():
	isCanNext = false
	$Panel.visible = true
	$Panel/RichTextLabel.get_font("font").size = 30
	$Panel/Label.text = txtBrr[index][0]
	if txtBrr[index][0] == "Afely":
		$Panel/Sprite.visible =true
		$Panel/Sprite2.visible =false
	else:
		$Panel/Sprite.visible =false
		$Panel/Sprite2.visible =true
		
	$Panel/RichTextLabel.text = txtBrr[index][index2]
	var txtTime = txtSpeed * txtBrr[index][index2].length()
	$Panel/RichTextLabel.percent_visible = 0
	$Panel/Tween.interpolate_property($Panel/RichTextLabel, "percent_visible",0,1,txtTime,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Panel/Tween.start()


func _input(event):
	if event.is_action_pressed('ui_accept') and $Panel.visible == true:
		if isCanNext:
			index2+=1
			if index2 == len(txtBrr[index]): #txtBrr.size():
				#$Panel.visible = false
				index += 1
				index2 = 1
				
				
			if index==len(txtBrr): #and index2 == len(txtBrr[index]):
				$Panel.visible = false
				index = 0
				index2 = 1
				#get_tree().change_scene("res://Main.tscn")
			else:
				showTxt()
				#isCanNext = true
		else:
			$Panel/RichTextLabel.percent_visible = 1
			$Panel/Tween.stop($Panel/RichTextLabel)
			isCanNext = true		

func _on_Tween_tween_completed(object, key):
	isCanNext = true 			
