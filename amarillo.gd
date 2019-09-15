extends "unit.gd"

func fall():
	$AnimatedSprite.play("die")

func _on_AnimationPlayer_animation_started(anim_name):
	$AnimatedSprite.play("die")
