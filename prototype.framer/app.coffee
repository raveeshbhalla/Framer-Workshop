# Import file "Design" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Design@3x")

scroll = ScrollComponent.wrap(sketch.tasks)
scroll.scrollHorizontal = false
sketch.screen.addChild(scroll)
scroll.placeBehind(sketch.status_bar)

sketch.FAB.x = 456

menu = new Layer
		y: 72
		width: 173
		height: 167
		opacity: 0
sketch.screen1.addChild(menu)

flow = new FlowComponent
flow.showNext(sketch.Home, false)

sketch.FAB.onTap ->
	flow.showNext(sketch.Detail)
	home = false

menu.onTap ->
	flow.showPrevious()