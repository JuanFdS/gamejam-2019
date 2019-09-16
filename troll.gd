extends "unit.gd"

func fall():
	print("estoy cayendoooo")
	stopMoving()
	$AnimatedSprite.set_light_mask(524288)
	$AnimationPlayer.play("fallAnimation")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "fallAnimation"):
		destroy()