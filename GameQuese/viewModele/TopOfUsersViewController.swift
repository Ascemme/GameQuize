//
//  TopOfUsersViewController.swift
//  GameQuese
//
//  Created by Temur on 03/12/2021.
//

import UIKit

class TopOfUsersViewController: UIViewController {
    @IBOutlet weak var wholeView: UIView!

    @IBOutlet weak var myTableView: UITableView!
    var loalding = Upload()
    var arrayOfUsers = [UserModel]()
    var imageArray = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        loalding.firebaseGeting { mydata in
            self.arrayOfUsers = mydata
            self.myTableView.reloadData()
        }
    }


}



extension TopOfUsersViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrayOfUsers.count != 0{
            return arrayOfUsers.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = myTableView.dequeueReusableCell(withIdentifier: "CustomCell") as! CustomTableViewCell
        customCell.nickLable.text = self.arrayOfUsers[indexPath.row].score
        customCell.scoreLable.text = "Current score is: \(self.arrayOfUsers[indexPath.row].name)"
        if arrayOfUsers.count != 0{
            if let imageURL = URL(string: arrayOfUsers[indexPath.row].avatar){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data{
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            customCell.avatarView.image = image
                            customCell.avatarView.layer.masksToBounds = true
                            customCell.avatarView.layer.cornerRadius = 34
                            customCell.avatarView.layer.borderWidth = 0.1
                            self.imageArray.append(image!)
                        }
                    }
                }
            }
        }
        return customCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetales", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UserDetalesViewController{
            destination.userDetales = arrayOfUsers[myTableView.indexPathForSelectedRow!.row]
            
        }
    }
    
}
