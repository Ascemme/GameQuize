//
//  UserDetalesViewController.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import UIKit

class UserDetalesViewController: UIViewController {
    var userDetales: UserModel? = nil
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var myLableView: UILabel!
    
    @IBOutlet weak var myScoreLableView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLableView.text = userDetales?.score
        myScoreLableView.text = "Current score is: " + (userDetales?.name)!
        
        self.myImageView.layer.masksToBounds = true
        self.myImageView.layer.cornerRadius = 65
        self.myImageView.layer.borderWidth = 0.1
        
        
        if let imageURL = URL(string: userDetales!.avatar){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data{
                    let image = UIImage(data: data)
                    DispatchQueue.main.async { [self] in
                        myImageView.image = image
                    }
                }
            }
        }
  
    }



}
