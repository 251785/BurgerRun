import Scenes
import Igis



class Score : RenderableEntity {
    var highScore = 0
    var score = 0
    var scoreText = Text(location:Point(x:0, y:100), text: "")
    var highScoreText = Text(location:Point(x:0, y:250), text: "")
    
    func addScore() {
        score += 1
    }
    func resetScore() {
        score = 0
    }

    override func render(canvas:Canvas) {
        scoreText.text = "\(score)"
        scoreText.font = "100pt Arial"
        if highScore < score {
            highScore += 1
        }
        highScoreText.text = "\(highScore)"
        highScoreText.font = "50pt Arial"
        canvas.render(highScoreText)
        canvas.render(scoreText)
    }
    
    init() {
        super.init(name: "Score")
    }
}
                     
