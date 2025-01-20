extends Node

func SetDisplay():
	var viewPort = get_node("/root").get_child(1).get_viewport_rect().size
	var camera = get_node("/root").get_child(1).find_node("MainCamera")
	print(camera.name)
	var View_port_scale = 600/viewPort.x
	camera.set_zoom(camera.get_zoom()*View_port_scale)
	print(camera.zoom)
