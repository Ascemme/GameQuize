//
//  ViewButtons.swift
//  GameQuese
//
//  Created by Temur on 05/12/2021.
//

import UIKit

class ViewButtons: UIView {
    var arrayofBtn = [UIButton]()
    var textView = UITextView()
    var scoreLable = UILabel()
    var correctAnswer = 0
    func btnInit(btn1: UIButton,btn2: UIButton,btn3: UIButton,btn4: UIButton){
        arrayofBtn.append(btn1)
        arrayofBtn.append(btn2)
        arrayofBtn.append(btn3)
        arrayofBtn.append(btn4)
    }
    
    
    func btnAppears(){
        for value in arrayofBtn{
            btnAnim(btn: value)
        }
        textAnim(textVeiw: textView)
    }
    
    
    //MARK: - Text and Btn appears
    
    func textAnim(textVeiw: UITextView){
        UIView.animate(withDuration: 1 ,animations: {
            textVeiw.tintColor = UIColor.blue
            textVeiw.alpha = 0
            
        }) { done in
            UIView.animate(withDuration: 1 ,animations: {
                textVeiw.tintColor = UIColor.blue
                textVeiw.alpha = 1
            })
        }
    }
    
    func btnAnim(btn: UIButton){
        UIView.animate(withDuration: 0.5 ,animations: {
            btn.tintColor = UIColor.blue
            btn.alpha = 0
            btn.center.y = btn.center.y - 20
        }){ done in
            UIView.animate(withDuration: 2 ,animations: {
                btn.tintColor = UIColor.blue
                btn.alpha = 1
                btn.center.y = btn.center.y + 20
            })
        }
    }
    func scoreApper(){
        self.scoreLable.center.x = self.scoreLable.center.x + 300
        UIView.animate(withDuration: 3 ,animations: {
            self.scoreLable.alpha = 1
            self.scoreLable.center.x = self.scoreLable.center.x - 300
            
        })
        
    }
    
    
    //MARK: - Btn Shows resalts
    
    func allBtns(s: Bool){
        if s {
            btnAppears()
        }else{
            UIView.animate(withDuration: 0.5 ,animations: {
                
                for i in 0..<self.arrayofBtn.count{
                    self.arrayofBtn[i].tintColor = UIColor.red
                }
                self.arrayofBtn[self.correctAnswer].tintColor = UIColor.green
            })
        }
        for i in 0..<arrayofBtn.count{
            arrayofBtn[i].isUserInteractionEnabled = s
        }
    }

    

    
    func btnAnimationTrue(btn: UIButton){
        UIView.animateKeyframes(withDuration: 1, delay: 0 ,animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                btn.tintColor = .green
            })
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                btn.center.y = btn.center.y + 5
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                btn.center.y = btn.center.y - 5
            })
        })
    }
    
    func btnAnimationFalse(btn: UIButton){
        UIView.animateKeyframes(withDuration: 1, delay: 0 ,animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                btn.tintColor = .magenta
            })
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                btn.center.x = btn.center.x - 10
            })
            UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 0.25, animations: {
                btn.center.x = btn.center.x + 20
            })
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                btn.center.x = btn.center.x - 10
            })
            
        })
    }
    
    
// MARK: - creating RandomBtn Answer
    
    
    func randomAnswer(correct_answer: String, incorrect_answers: [String]) -> [String]{
        var answersArray = [String]()
        let correctBtn = Int.random(in: 0..<4)
        print(correctBtn)
        correctAnswer = correctBtn
        
        
        for i in 0..<3{
            answersArray.append(incorrect_answers[i])
        }
        if correctBtn == 3{
            answersArray.append(correct_answer)
        }
        else{
            var replacer = ""
            replacer = answersArray[correctBtn]
            answersArray[correctBtn] = correct_answer
            answersArray.append(replacer)
        }
        return answersArray
    }
}
