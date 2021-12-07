//
//  ViewController.swift
//  GameQuese
//
//  Created by Temur on 02/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStartBtn: UIButton!
    
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var exitBtn: UIButton!
    
    var done = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        if done{
            navigationController?.showDetailViewController(SucsesViewController(), sender: self)
        }
        DispatchQueue.main.asyncAfter(deadline: .now()  ) {
            self.startAnim()
        }
    }
    
    
    
    @IBAction func gameStarnBtnAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newiden = storyBoard.instantiateViewController(withIdentifier: "gameScreen") as! GameViewController
        navigationController?.show(newiden, sender: nil)
        
        
    }
    
    @IBAction func topAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newiden = storyBoard.instantiateViewController(withIdentifier: "TopScreen") as! TopOfUsersViewController
        navigationController?.show(newiden, sender: nil)
    }
    
    
    
    
    @IBAction func exitBtn(_ sender: Any) {
        exit(0)
    }
    
    

    func startAnim(){
        UIView.animate(withDuration: 2, delay: 0.1 ,usingSpringWithDamping: 0.5, initialSpringVelocity: 0.2 , options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.gameStartBtn.tintColor = .magenta
            self.gameStartBtn.alpha = 0.5
            self.gameStartBtn.center.y = self.gameStartBtn.center.y - 10
        }, completion: nil)

    }
    
}

