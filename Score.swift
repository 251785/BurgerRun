import Scenes
import Igis



class Score : RenderableEntity {
    var highScore = 0
    var score = 0
    var scoreText = Text(location:Point(x:0, y:100), text: "")
    
    func addScore() {
        score += 1
    }
    func resetScore() {
        score = 0
    }

    override func render(canvas:Canvas) {
        scoreText.text = "\(score)"
        scoreText.font = "100pt Arial"
        canvas.render(scoreText)
    }
    
    init() {
        super.init(name: "Score")
    }
}
                     
