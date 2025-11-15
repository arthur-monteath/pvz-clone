extends Node2D

func tween(object: Node2D, property: String, target, time := 1.0, easing: Tween.EaseType = Tween.EASE_OUT, trans: Tween.TransitionType = Tween.TRANS_QUINT) -> Tween:
	var tw := object.create_tween()
	tw.set_ease(easing).set_trans(trans)
	tw.tween_property(object, property, target, time)
	return tw
