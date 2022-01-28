//
//  ViewController.swift
//  Quizzler-iOS13
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    //Added new buttons.
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    // New button link to IBAction too.
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        
        //Need to fetch the answers and update the button titles usin the setTitle method.
        let answerChoice = quizBrain.getAnswerText()
        button1.setTitle(answerChoice[0], for: .normal)
        button2.setTitle(answerChoice[1], for: .normal)
        button3.setTitle(answerChoice[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
    }

}


























