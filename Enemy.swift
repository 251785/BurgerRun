import Scenes
import Igis
import Foundation


class Enemy: RenderableEntity {
    
    let skelo: Image
    var enemyBoundingRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:50, height:70))
    var step = 7
    let maxDistance = 1000.0
    var distance = 0.0
    var isTracking = false
    override func setup(canvasSize:Size, canvas:Canvas) {
        canvas.setup(skelo)
    }
    override func calculate(canvasSize:Size) {
        guard let scene = scene as? MainScene else {
            fatalError("why")
        }
        let burgerGuyRect = scene.returnBurgerGuyRect()
        let xDif = Double(enemyBoundingRect.topLeft.x - burgerGuyRect.topLeft.x)
        let yDif = Double(enemyBoundingRect.topLeft.y - burgerGuyRect.topLeft.y)
        distance = sqrt(xDif*xDif + yDif*yDif)
        if distance < maxDistance {
            isTracking = true
        } 
            
        
        if isTracking == true {
            if xDif < 0 {
                enemyBoundingRect.topLeft.x += step
            } else if xDif > 0 {
                enemyBoundingRect.topLeft.x -= step
            }
           if yDif < 0 {
               enemyBoundingRect.topLeft.y += step
            } else if yDif > 0 {
               enemyBoundingRect.topLeft.y -= step
           }
        }
           
        

        let rectangle = Rectangle(rect: enemyBoundingRect, fillMode: .stroke)
        let rectangleContainment = burgerGuyRect.containment(target:rectangle.rect)
        if !rectangleContainment.intersection([.contact]).isEmpty {
            scene.done()
        }
    }
            
        func done() {
            isTracking == false
        }
                  
            
    
    func move(to point: Point) {
        enemyBoundingRect.topLeft = point
    }
    override func render(canvas:Canvas) {
        guard let interaction = layer as? InteractionLayer else {
            fatalError("Idiot")
        }
        
        let skelo1 = (Rect(topLeft: Point(x:123, y:23), size:Size(width:468, height:733)))
        let rectangle = Rectangle(rect: enemyBoundingRect, fillMode: .stroke)
        skelo.renderMode = .sourceAndDestination(sourceRect:skelo1, destinationRect: enemyBoundingRect)
        canvas.render(skelo)
        //canvas.render(rectangle)
    }
    init() {
        guard let skeloURL = URL(string: "https://www.linkpicture.com/q/pngfind.com-shy-guy-png-3094633.png")
        else {
            fatalError("not URL Idiot")
        }
        skelo = Image(sourceURL:skeloURL)
    super.init(name:"Enemy")
    }
}
