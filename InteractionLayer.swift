import Scenes
import Igis
import Foundation


class InteractionLayer : Layer, KeyDownHandler, KeyUpHandler {
    var up = false
    var down = false
    var left1 = false
    var right1 = false
    let enemy = Enemy()
    let hamburger = Hamburger()
    let burgerGuy = BurgerGuy(rect: Rect(size:Size(width: 50, height: 70)))
    let score = Score()

    func returnBurgerGuyRect() -> Rect {
        let rect = burgerGuy.returnRect()
        return rect
    }
    func done() {
        enemy.move(to: Point(x: 920, y: 480))
        burgerGuy.move(to: Point(x: 20, y: 480))
        
    }
    //    hamburger.done()
    
    
    
    init() {

        super.init(name: "InteractionLayer.swift")
        

        insert(entity: burgerGuy, at: .front)
        insert(entity: hamburger, at: .front)
        insert(entity: enemy, at:.front)

    }
    override func preSetup(canvasSize: Size, canvas: Canvas) {
        burgerGuy.move(to: Point(x: 20, y: canvasSize.center.y))
        dispatcher.registerKeyDownHandler(handler: self)
        dispatcher.registerKeyUpHandler(handler: self)
    }
    func onKeyDown(key: String, code: String, ctrlKey: Bool, shiftKey: Bool, altKey: Bool, metaKey: Bool) {
        print(key)
      
        switch key {
        case "w":
            up = true
    
        case "s":
            down = true
    
        case "d":
            right1 = true
    
        case "a":
            left1 = true
    
        default:
            break
        }

    }
    
    func onKeyUp(key:String, code:String, ctrlKey: Bool, shiftKey:Bool, altKey: Bool, metaKey:Bool) {
        switch key {
        case "w":
            up = false
    
        case "s":
            down = false
    
        case "d":
            right1 = false
    
        case "a":
            left1 = false
    
        default:
            break
        }
    }

override func preCalculate(canvas:Canvas) {
    let P1position = burgerGuy.rectangle.rect.topLeft
    if up == true {
        burgerGuy.move(to: Point(x: P1position.x, y: P1position.y - 20))
    }
    if down == true {
        burgerGuy.move(to: Point(x: P1position.x, y: P1position.y + 20))
    }
    if left1 == true {
        burgerGuy.move(to: Point(x: P1position.x - 20, y: P1position.y))
    }
    if right1 == true {
        burgerGuy.move(to: Point(x: P1position.x + 20, y: P1position.y))
    }
    if up && right1 == true {
        burgerGuy.move(to: Point(x: P1position.x + 20, y: P1position.y - 20))
    }
    if up && left1 == true {
        burgerGuy.move(to: Point(x: P1position.x - 20, y: P1position.y - 20))
    }
    if down && right1 == true {
        burgerGuy.move(to: Point(x: P1position.x + 20, y: P1position.y + 20))
    }
    if down && left1 == true {
        burgerGuy.move(to: Point(x: P1position.x - 20, y: P1position.y + 20))
    }

}
override func postTeardown() {
    dispatcher.unregisterKeyDownHandler(handler: self)
    dispatcher.registerKeyUpHandler(handler: self)
}
}

