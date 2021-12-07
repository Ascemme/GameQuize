//
//  GameViewController.swift
//  GameQuese
//
//  Created by Temur on 02/12/2021.
//
import Foundation
import UIKit


class GameViewController: UIViewController {
    
    @IBOutlet weak var textQuestion: UITextView!
    @IBOutlet weak var answerLable: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    var viewButtons = ViewButtons()
    var answerIs = ""
    var gameData: [DataModle] = []
    var theGameIs = 0
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.answerLable.alpha = 0
        viewButtons.textView = textQuestion
        getURL()
        viewButtons.btnInit(btn1: button1, btn2: button2, btn3: button3, btn4: button4)
        viewButtons.btnAppears()
        viewButtons.scoreLable = answerLable
        
    }
    
    //MARK: - URL pareser
    
    func getURL(){
        let b = Parser()
        //b.parse()
        b.parse { myData in
            self.gameData = myData
            self.setQuestionFunc()
        }
    }
    
    //MARK: - URL Cleaner
    
    //URL giving errors in string like &quot;
    
    func clearQuestion(sentence: String) -> String{
        var sentence = sentence
        let wordToRemove = "&quot;"
        for _ in 0..<3{
            if let range = sentence.range(of: wordToRemove) {
                sentence.removeSubrange(range)
            }
        }
        return sentence
    }
    
    //MARK: - Setting Value in view
    
    func setQuestionFunc(){
        self.answerIs = gameData[self.theGameIs].correct_answer
        let currentGame: DataModle = gameData[theGameIs]
        textQuestion.text = clearQuestion(sentence: currentGame.question)
        let answers = viewButtons.randomAnswer(correct_answer: currentGame.correct_answer, incorrect_answers: currentGame.incorrect_answers)
        button1.setTitle(answers[0], for: .normal)
        button2.setTitle(answers[1], for: .normal)
        button3.setTitle(answers[2], for: .normal)
        button4.setTitle(answers[3], for: .normal)
    }
    
    
    
    
    @IBAction func btnAct(_ sender: UIButton) {
    
        let prestBtn = sender.titleLabel?.text
        if prestBtn == answerIs{
            self.score += 1
            print("good")
            self.viewButtons.btnAnimationTrue(btn: sender)
            self.answerLable.text = "Number of right answers is: \(self.score)"
            
            if self.score == 1{
                viewButtons.scoreApper()
            }
        }else{
            self.viewButtons.btnAnimationFalse(btn: sender)
        }
        viewButtons.allBtns(s: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5 ) {

            self.theGameIs += 1
            if self.theGameIs == 1{
                let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let newScreen = storyBoard.instantiateViewController(withIdentifier: "UserResant") as! UserResaltViewController
                newScreen.score = self.score
                self.navigationController?.show(newScreen, sender: nil)
                
            }else{
            self.setQuestionFunc()
            self.viewButtons.allBtns(s: true)
            }
            
            
            
                
        
        }
        
    }
    
    
   
    
    
}
