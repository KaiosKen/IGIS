import Foundation
import Scenes
import Igis

  /*
     This class is responsible for rendering the background.
   */


class Background : RenderableEntity {
    let rectangle = Rectangle(rect:Rect(), fillMode:.fill)
    let fillStyle = FillStyle(color:Color(red:20, green:57, blue:65))
    let back : Image
    
    init() {
        guard let backURL = URL(string:"https://www.codermerlin.com/users/muqadam-sabir/background.png") else {
            fatalError("Failed to create URL for whitehouse")
        }
        back = Image(sourceURL:backURL)
        super.init(name:"Background")
    }

    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(back)
        
        back.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:canvasSize))
        
    }

    override func render(canvas:Canvas) {
        if back.isReady {
            canvas.render(back)
        }
    }
}
