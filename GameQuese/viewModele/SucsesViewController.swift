//
//  SucsesViewController.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import UIKit

class SucsesViewController: UIViewController {
    var myView = UIView()
    var myText = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myView.frame = CGRect(x: view.center.x / 3, y: view.frame.height / 2, width: view.frame.width / 1.5 , height: view.frame.height / 5)
        self.myView.backgroundColor = UIColor.white
        self.myView.layer.masksToBounds = true
        self.myView.layer.cornerRadius = 10
        self.myView.layer.borderWidth = 0.1
        self.view.addSubview(myView)
        self.myText.text = "Congratulations!))"
        self.myText.textColor = UIColor.black
        self.myText.frame = CGRect(x: 10, y:  50, width: 250 , height: 50)
        self.myView.addSubview(myText)
    }
    


}
