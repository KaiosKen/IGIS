import Scenes
import Igis

class Ball: RenderableEntity, MouseMoveHandler {
    var ellipse = Ellipse(center:Point(x:0, y:0), radiusX:30, radiusY:30, fillMode:.fillAndStroke)
    let strokeStyle = StrokeStyle(color:Color(.orange))
    let fillStyle = FillStyle(color:Color(.red))
    let lineWidth = LineWidth(width:5)
    
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Ball")
    }

    override func setup(canvasSize: Size, canvas: Canvas) {
        // Position the ellipse at the center of the canvas
        ellipse.center = canvasSize.center
        dispatcher.registerMouseMoveHandler(handler:self)
    }

    override func teardown() {
        dispatcher.unregisterMouseMoveHandler(handler:self)
    }

    func onMouseMove(globalLocation: Point, movement: Point) {
        ellipse.center = globalLocation 
    }

    override func boundingRect() -> Rect {
        return Rect(size: Size(width: Int.max, height: Int.max))
    }

    override func render(canvas:Canvas) {
        canvas.render(strokeStyle, fillStyle, lineWidth, ellipse)
    }

    
}
