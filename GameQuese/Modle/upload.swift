//
//  upload.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage


struct Upload{
    
    private var database = Database.database().reference()
    var nickName = "Tim"
    var Score = "10"
    var imageURL = String()
    var imageURLS = [String]()
    
    
    
    
    //MARK: FireBASE using
    
    func firebaseInit(imageURL: String){
        print("click")
        let object: [String : String] = [
            "name": nickName,
            "score": Score,
            "avatar": imageURL
        ]
        //var newUser = UserModel(name: nickName, Score: Score, avatar: imageURL)
        
        database.child(nickName).setValue(object)
    }
    
    
    
    //MARK: IMAGES uploadin to firebase
    
    func upload(image: UIImage){
        let ref = Storage.storage().reference().child("images").child(nickName)
        guard let imageData = image.jpegData(compressionQuality: 0.4) else {return}
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        ref.putData(imageData, metadata: metadata) { metadata, error in
            guard let _ = metadata else {
                return
            }
            
            ref.downloadURL { url, error in
                guard let url = url else {return}
                self.firebaseInit(imageURL: String(url.absoluteString))
            }
        }
        
        
    }
    

    
    func firebaseGeting(completed: @escaping ([UserModel]) ->()){
        
        var myArray = [UserModel]()
        let keys = ["avatar","name","score"]
        database.observeSingleEvent(of: .value, with: { snapshot in
            // Get user value
            
            let data = snapshot.value as? NSDictionary
            let values = data?.allValues as? [NSDictionary]
            //let value = values![0] as NSDictionary
            
            
            
            for i in 0..<values!.count{
                let value = values![i] as NSDictionary
                let userName = value.value(forKey: keys[1])
                let userScore = value.value(forKey: keys[2])
                let userAwatar = value.value(forKey: keys[0])
                let mystract = UserModel(avatar: userAwatar as! String, name: userScore as! String, score: userName as! String)
                myArray.append(mystract)
            }
            DispatchQueue.main.async {
                completed(myArray)
            }
            
        }) { error in
            print(error.localizedDescription)
        }
        
    }
    
}

