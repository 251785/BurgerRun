import Igis

import Scenes

  /*
     This class is responsible for the foreground Layer.
     Internally, it maintains the RenderableEntities for this layer.
   */


class ForegroundLayer : Layer {
    let score = Score()
    func scored() {
        score.addScore()
    }
    func done() {
        score.resetScore()
    }
      init() {
          // Using a meaningful name can be helpful for debugging
          super.init(name:"Foreground")
          insert(entity: score, at:.front)
  
          // We insert our RenderableEntities in the constructor

      }
  }
