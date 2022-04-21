import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerCardImage: UIImageView!
    @IBOutlet weak var computerCardImage: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    var playerScore: Int = 0
    var computerScore: Int = 0
    var roundNumber: Int = 0
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    @objc func play() {
        updateRoundNumber()
        let player = getRandomCards()
        let computer = getRandomCards()
        
        updateCards(player: player, computer: computer)
        
        updatePlayersScores(player: player, computer: computer)
        
        if(roundNumber == 15){
            playButton.isHidden = false
            timer.invalidate()
        }
    }
    
    @IBAction func startGame() {
        playButton.isHidden = true
        resetGame()
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.play), userInfo: nil, repeats: true)
    }
    
    func updateCards(player: Int, computer: Int) {
        playerCardImage.image = UIImage(named: "c-\(player)")
        computerCardImage.image = UIImage(named: "c-\(computer)")
    }
    
    func getRandomCards() -> Int {
        return Int.random(in: 2...14)
    }
    
    func updatePlayersScores(player: Int, computer: Int) {
        if (player > computer) {
            playerScore += 1
            playerScoreLabel.text = String(playerScore)
        } else if (player < computer) {
            computerScore += 1
            computerScoreLabel.text = String(computerScore)
        }
    }
    
    func updateRoundNumber() {
        roundNumber += 1
        roundLabel.text = "Round: \(roundNumber)/15"
    }
    
    func resetGame() {
        roundNumber = 0
        playerScore = 0
        computerScore = 0
        playerScoreLabel.text = String(playerScore)
        computerScoreLabel.text = String(computerScore)
        roundLabel.text = "Round: \(roundNumber)/15"
    }
}
