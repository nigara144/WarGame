import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playerCardImage: UIImageView!
    @IBOutlet weak var computerCardImage: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    @IBOutlet weak var computerScoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var playerScore: Int = 0
    var computerScore: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func deal() {
        let player = getRandomCardNumber()
        let computer = getRandomCardNumber()
        
        updateCardImages(player: player, computer: computer)
        
        updateScores(player: player, computer: computer)
    }
    
    func getRandomCardNumber() -> Int {
        return Int.random(in: 2...14)
    }
    
    func updateCardImages(player: Int, computer: Int) {
        playerCardImage.image = UIImage(named: "card-\(player)")
        computerCardImage.image = UIImage(named: "card-\(computer)")
    }
    
    func updateScores(player: Int, computer: Int) {
        if (player > computer) {
            playerScore += 1
            playerScoreLabel.text = String(playerScore)
        } else if (player < computer) {
            computerScore += 1
            computerScoreLabel.text = String(computerScore)
        }
    }
}
