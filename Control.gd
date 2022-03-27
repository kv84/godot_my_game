extends Control

var en = 0
var images = []
func my_view(en):
	var im1 = get_node("Image1")
	var im2 = get_node("Image2")
	var im3 = get_node("Image3")
	var im4 = get_node("Image4")
	images = [im1, im2, im3, im4]
	for i in range(len(images)):
		if i==en:
			images[i].show()
		else:
			images[i].hide()

func _input(event):
	if event.is_action_pressed('ui_accept'):
		en += 1
		my_view(en)
		if en>len(images)-1:
			en=0
			my_view(en)
	if event.is_action_pressed('ui_up') and $Panel.visible == true:
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
				
#####

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
#	if txtBrr[index][0] == "Afely":
#		$Panel/Sprite.visible =true
#		$Panel/Sprite2.visible =false
#	else:
#		$Panel/Sprite.visible =false
#		$Panel/Sprite2.visible =true
		
	$Panel/RichTextLabel.text = txtBrr[index][index2]
	var txtTime = txtSpeed * txtBrr[index][index2].length()
	$Panel/RichTextLabel.percent_visible = 0
	$Panel/Tween.interpolate_property($Panel/RichTextLabel, "percent_visible",0,1,txtTime,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Panel/Tween.start()



			

func _on_Tween_tween_completed(object, key):
	isCanNext = true 			
					
			

