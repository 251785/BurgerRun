import Igis
import Foundation
import Scenes



import Igis
import Foundation
import Scenes

class Background : RenderableEntity {
    var canvasSize = Size(width:0, height:0)
    let grass : Image
    let soil : Image
    init() {
        guard let grassURL = URL(string:"https://upload.wikimedia.org/wikipedia/commons/7/77/Pixel_art_grass_image.png")
        else {
            fatalError("You are an idiot")
        }
        guard let soilURL = URL(string:"https://pixelartmaker-data-78746291193.nyc3.digitaloceanspaces.com/image/5849ac1341e6265.png")
        else {
            fatalError("You are an Idiot")
        }

        grass = Image(sourceURL:grassURL)
        soil = Image(sourceURL:soilURL)
        // Using a meaningful name can be helpful for debugging
        super.init(name:"Background")
    }
    func backgroundRect() -> Rect {
        let fence = Rect(topLeft:Point(x:200, y:0), size:Size(width:1500, height:925))
        return fence
    }


    override func setup(canvasSize:Size, canvas:Canvas) {
        self.canvasSize = canvasSize
        canvas.setup(grass)
        canvas.setup(soil)
    }
    override func render(canvas:Canvas) {
        if  soil.isReady {
            soil.renderMode = .destinationRect(Rect(topLeft:Point(x:0, y:0), size:Size(width: 10000, height:1000)))
            canvas.render(soil)
            if grass.isReady {

                grass.renderMode = .destinationRect(Rect(topLeft:Point(x:200, y:0), size:Size(width:1500, height:925)))

                canvas.render(grass)
            }

        }

    }

}




    
        
        

    

 

 

