import Scenes
import Igis
import Foundation

class BurgerGuy: RenderableEntity {
    var swap = 0
    var count = 0
    var rectangle: Rectangle
    let burger1 : Image
    let burger2: Image

    init(rect: Rect) {
        guard let burger1URL = URL(string: "https://linkpicture.com/q/burger-sprite-1.png") 
        else {
            fatalError("I am an idiot")
        }
        burger1 = Image(sourceURL:burger1URL)
        
        guard let burger2URL = URL(string: "https://linkpicture.com/q/burger-sprite-2.png")
        else {
            fatalError("I am an idiot")
        }
        burger2 = Image(sourceURL:burger2URL)
                
        rectangle = Rectangle(rect: rect, fillMode:.fillAndStroke)
        super.init(name: "BurgerGuy")
    }

    func returnRect() -> Rect {
        let rect = rectangle.rect
        return rect
    }
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(burger1)
        canvas.setup(burger2)
    }

    override func render(canvas: Canvas) {
        guard let interaction = layer as? InteractionLayer else {
            fatalError("Idiot")
        }
        swap += 1
        if swap > 5 {
            count += 1
        }
        if count > 1 {
            count = 0
        }
        let strokeStyle = StrokeStyle(color:Color(.black))
        let fillStyle = FillStyle(color:Color(.white))
        let lineWidth = LineWidth(width: 2)
//        canvas.render(strokeStyle, fillStyle, lineWidth, rectangle)
        let burger1Sprite = Rect(topLeft: Point(x:67, y:49), size:Size(width:100, height:114))
        let burger2Sprite = Rect(topLeft: Point(x:67, y:49), size:Size(width:100, height:114))
        let destinationRect = Rect(topLeft:Point(x:20 , y:50 ), size:Size(width:100, height:114))

        if count == 1 {
            burger1.renderMode = .sourceAndDestination(sourceRect:burger1Sprite, destinationRect: boundingRect() )
        }
        if count == 0 {
            burger2.renderMode = .sourceAndDestination(sourceRect:burger2Sprite, destinationRect: boundingRect() )
        }
        canvas.render(burger1)
        canvas.render(burger2)

    }
    func move(to point: Point) {
        rectangle.rect.topLeft = point
    }
    override func boundingRect() ->Rect{
        return rectangle.rect
    }
    
}

