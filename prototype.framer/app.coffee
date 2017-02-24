# Import file "Design" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Design@3x")

scroll = ScrollComponent.wrap(sketch.tasks)
scroll.scrollHorizontal = false
sketch.screen.addChild(scroll)
scroll.placeBehind(sketch.status_bar)

for layer in sketch.tasks.children
	check = layer.children[0]
	check.states.incomplete =
		saturate: 0
	check.states.complete =
		saturate: 100
	
	check.stateSwitch("incomplete")
	check.on Events.Tap, (event, layer) ->
		layer.stateCycle("complete", "incomplete")

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

currentScroll = 0

sketch.FAB.states.hidden =
	scale: 0
	animationOptions:
		curve: Spring(damping: 0.5)
		time: 0.5

sketch.FAB.states.default =
	scale: 1
	animationOptions:
		curve: Spring(damping: 0.5)
		time: 0.5

scroll.onScroll ->
	if (scroll.scrollY > currentScroll)
		sketch.FAB.animate("hidden")
	else
		sketch.FAB.animate("default")
	currentScroll = scroll.scrollY