//
//  Parser.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import Foundation
import UIKit

struct Parser{
    func parse(completed: @escaping ([DataModle]) ->()){
        guard let url = URL(string: "https://opentdb.com/api.php?amount=11&category=29&difficulty=easy&type=multiple") else{ return }
        let session = URLSession.shared
        session.dataTask(with: url) {( data, response, error) in
            
        if error == nil{
            
            do{
                //print (try JSONSerialization.jsonObject(with: data!, options: []))
                let json = try JSONDecoder().decode(QuestionModle.self, from: data!)
                //print(json)
                
                DispatchQueue.main.async {
                    completed(json.results)
                }
                    
            }catch{
                print(error)
            }
        }
        
        
        }.resume()
    }
    
    
}
