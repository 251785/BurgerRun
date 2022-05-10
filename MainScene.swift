import Scenes
import Igis
/*
   This class is responsible for implementing a single Scene.
   Scenes projects require at least one Scene but may have many.
   A Scene is comprised of one or more Layers.
   Layers are generally added in the constructor.
 */
class MainScene : Scene {

    /* Scenes typically include one or more Layers.
       A common approach is to use three Layers:
       One for the background, one for interaction,
       and one for the foreground.
     */
    let backgroundLayer = BackgroundLayer()
    let interactionLayer = InteractionLayer()
    let foregroundLayer = ForegroundLayer()
    let enemy = Enemy()
    let background = Background()
    func returnBurgerGuyRect() -> Rect {
        let rect = interactionLayer.returnBurgerGuyRect()
        return rect
    }

    func scored() {
        foregroundLayer.scored()
    }

    func done() {
        interactionLayer.done()
        foregroundLayer.done()
        enemy.done()
    }
    
    func backgroundRect() -> Rect {
        let rect = background.backgroundRect()
        return rect
    }
    init() {
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Main")

        // We insert our Layers in the constructor
        // We place each layer in front of the previous layer
        insert(layer:backgroundLayer, at:.back)
        insert(layer:interactionLayer, at:.inFrontOf(object:backgroundLayer))
        insert(layer:foregroundLayer, at:.front)

    }
}
