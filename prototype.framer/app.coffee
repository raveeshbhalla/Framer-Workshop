# Import file "Design" (sizes and positions are scaled 1:3)
sketch = Framer.Importer.load("imported/Design@3x")

scroll = ScrollComponent.wrap(sketch.tasks)
scroll.scrollHorizontal = false
sketch.screen.addChild(scroll)
scroll.placeBehind(sketch.status_bar)

sketch.FAB.x = 456