//
//  Question.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-05-04.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//

import Foundation

class Question {
    
    weak var category: Category?
    var price = 0
    var question = ""
    var answer = ""
    var playerAnswer = ""
    
    func formattedPrice() -> String {
        return "$\(price)"
    }
    
    class func parseJSON(jsonDictionary: Dictionary<String, AnyObject>) -> Question {
        let question = Question()
        question.question = jsonDictionary["question"] as! String
        question.price = jsonDictionary["value"] as! Int
        question.answer = jsonDictionary["answer"] as! String
        
        return question
    }
    
    
    class func loadQuestion(category: Category, price: Int) throws -> Question {
        if let jsonPath = NSBundle.mainBundle().pathForResource("Question", ofType: "json"), let jsonData = NSData(contentsOfFile: jsonPath) {
            let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)
            
            if let array = json as? Array<AnyObject>, object = array.first as? Dictionary<String, AnyObject> {
                let question = Question.parseJSON(object)
                question.category = category
                return question
            }
        }
        
        throw NSError(domain: "Buzzer!", code: 100, userInfo: [NSLocalizedDescriptionKey: "Found invalid JSON data when looking for file Question.json"])
    }

}