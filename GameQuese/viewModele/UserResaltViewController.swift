//
//  UserResaltViewController.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import UIKit

class UserResaltViewController: UIViewController{
    
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var myLable: UILabel!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var buttonSeve: UIButton!
    @IBOutlet weak var buttonExit: UIButton!
    var loalding = Upload()
    var score = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        myLable.text = "Right answers is: " + String(score)
        self.avatarView.layer.masksToBounds = true
        self.avatarView.layer.cornerRadius = 75
        self.avatarView.layer.borderWidth = 0.1
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func changeImageAct(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func buttonSaveAct(_ sender: Any) {
        if nickName.text == ""{
            navigationController?.showDetailViewController(ErrorViewController(), sender: self)
        }else{
            loalding.nickName = nickName.text!
            loalding.upload(image: avatarView.image!)
            //StartScreen
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newiden = storyBoard.instantiateViewController(withIdentifier: "StartScreen") as! ViewController
            newiden.done = true
            navigationController?.show(newiden, sender: nil)
        
        }
        
    }
    
    @IBAction func buttonexitAct(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newiden = storyBoard.instantiateViewController(withIdentifier: "StartScreen") as! ViewController
        newiden.done = false
        navigationController?.show(newiden, sender: nil)
    }
    
}



extension UserResaltViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        
        avatarView.image = image
        
        
    }
    
}
