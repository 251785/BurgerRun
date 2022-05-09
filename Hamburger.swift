import Scenes
import Igis
import Foundation

class Hamburger : RenderableEntity {
   
    let hamb : Image
    var xPos = 0
    var yPos = 0
    init() {
        guard let hamburgerURL = URL(string: "https://cdn.gamedevmarket.net/wp-content/uploads/20210725015814/ba8144c5a40fdf53f03cd399bc457ab5.png")
        else {
            fatalError("stupid")
        }
        hamb = Image(sourceURL:hamburgerURL)
        
        super.init(name: "Hamburger")
    }

    var burgerGuy = Rect(topLeft:Point(x:0,y:0),size:Size(width:0,height:0))
    let paddleLeft = Point(x: 10, y: 10)
    let strokeStyle = StrokeStyle(color:Color(.orange))
    let fillStyle = FillStyle(color:Color(.red))
    let lineWidth = LineWidth(width:5)

    var  hamburgerBoundingRect = Rect(topLeft:Point(x:0, y:0), size:Size(width:50,height:50))
    
    
    
       
       override func setup(canvasSize:Size, canvas:Canvas) {
           
           canvas.setup(hamb)
           xPos = Int.random(in: 200 ..< 1000)
           yPos = Int.random(in: 200 ..< 500)
           hamburgerBoundingRect.topLeft = Point(x:canvasSize.center.x,y:canvasSize.center.y)
           let rectangle = Rectangle(rect: Rect(topLeft: Point(x: canvasSize.center.x, y:canvasSize.center.y), size:Size(width:50, height:50)), fillMode:.fillAndStroke)
           let hamburgerBoundingRectangle = Rectangle(rect: Rect(topLeft: Point(x: canvasSize.center.x, y:canvasSize.center.y), size:Size(width:50, height:50)))
           canvas.render(rectangle, fillStyle, strokeStyle, lineWidth, hamburgerBoundingRectangle)
       }
       
       
       override func calculate(canvasSize:Size) {
           guard let scene = scene as? MainScene else {
               fatalError("Expected InteractionLayer owner to setContainment()")
           }

            let rectangle = Rectangle(rect:hamburgerBoundingRect, fillMode:.fillAndStroke)
            let burgerGuyBounding = scene.returnBurgerGuyRect()//Rect(topLeft:Point(x: xPos, y: yPos), size:Size(width:50, height:50))
            let rectangleContainment = burgerGuyBounding.containment(target:rectangle.rect)
          
          
           
           //let boundingSubset : ContainmentSet = [.contact] 
           if !rectangleContainment.intersection([.contact]).isEmpty {
           //if boundingSubset.isSubset(of:rectangleContainment){
            xPos = Int.random(in: 200 ..< 1000)
            yPos = Int.random(in: 200 ..< 500)
            hamburgerBoundingRect = Rect(topLeft:Point(x:xPos,y:yPos), size:Size(width:50, height:50))
            scene.scored()
            //render(xPos:xPos, yPos:yPos)
           }
       }
       
       override func render(canvas:Canvas) {
           //  override func calculate(canvasSize:Size) {
           let source = Rect(topLeft: Point(x:164, y:82), size:Size(width:377, height:374))
           hamb.renderMode = .sourceAndDestination(sourceRect:source, destinationRect: hamburgerBoundingRect)
           func render() {//xPos: Int, yPos: Int 
           let rectangle = Rectangle(rect:hamburgerBoundingRect, fillMode:.fillAndStroke)
           let hamburgerBoundingRectangle = Rectangle(rect: hamburgerBoundingRect)
           
               
               
//           canvas.render(strokeStyle, fillStyle, lineWidth, rectangle, hamburgerBoundingRectangle)
           canvas.render(hamb)
           }
           render()
       }
           
}      
       
       
        
 
                   

       
