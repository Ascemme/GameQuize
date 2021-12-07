//
//  QuestionModle.swift
//  GameQuese
//
//  Created by Temur on 06/12/2021.
//

import Foundation

struct QuestionModle: Decodable{
    let results: [DataModle]
}
struct DataModle: Decodable{
    let correct_answer: String
    let incorrect_answers: [String]
    let question: String
}

