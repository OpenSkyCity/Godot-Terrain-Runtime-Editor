extends Spatial
class_name QuadTreeNode
const QuadTree = preload("res://addons/sairam.quadtree/QuadTree.gd")


export var extents: Vector3 setget set_bounds
export var capacity: int
export var max_levels: int

var bounds: AABB

export(NodePath) var immediate_geo_node_path

var _quad_tree: QuadTree

func _ready():
	_quad_tree = QuadTree.new(bounds, capacity, max_levels)
	if get_node_or_null(immediate_geo_node_path):
		_quad_tree.set_drawing_node(get_node(immediate_geo_node_path))

func add_body(body: Spatial, bounds: AABB = AABB()):
	return _quad_tree.add_body(body, bounds)

func remove_body(body: Spatial):
	return _quad_tree.remove_body(body)

func update_body(body: Spatial, bounds: AABB = AABB()):
	return _quad_tree.update_body(body, bounds)

func clear():
	return _quad_tree.clear()

func query(bounds: AABB):
	return _quad_tree.query(bounds)

func draw(height: float = 1, clear_drawing: bool = true, draw_outlines: bool = true, draw_tree_bounds: bool = true):
	return _quad_tree.draw(height, clear_drawing, draw_outlines, draw_tree_bounds)

func set_bounds(value):
	extents = value
	bounds = AABB(-extents, extents * 2)
	update_gizmo()

func set_extents(value):
	set_bounds(value)

func dump(file_name = "", indent = "\t"):
	return _quad_tree.dump(file_name, indent)
	
