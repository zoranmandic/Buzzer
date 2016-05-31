//
//  Answer.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-05-04.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//

import Foundation

class Category {
    
    var id = 0
    var title = ""
    var cluesCount = 0
    var answeredQuestions: [Int: Question] = [: ]
    
    
    init(){
        
        print("hello")
    }
    
    class func parseJSON(jsonDictionary: Dictionary<String, AnyObject>) -> Category {
        let category = Category()
        category.id = jsonDictionary["id"] as! Int
        category.title = jsonDictionary["title"] as! String
        category.cluesCount = jsonDictionary["clues_count"] as! Int
        return category
    }
        class func loadCategories() throws -> Array<Category> {
            if let jsonPath = NSBundle.mainBundle().pathForResource("JSON/Category", ofType: "json"),
                let jsonData = NSData(contentsOfFile: jsonPath) {
                    
                let json = try NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers)
                
                var categories = Array<Category>()
                if let array = json as? Array<AnyObject> {
                    for object in array {
                        if let validObject = object as? Dictionary<String, AnyObject> {
                            let category = Category.parseJSON(validObject)
                            categories.append(category)
                        }
                    }
                }
                return categories
            }
            
            throw NSError(domain: "Buzzer!", code: 100, userInfo: [NSLocalizedDescriptionKey: "Found invalid JSON data when looking for file Question.json"])
    }
    
    
    
    //load categories from internet
    class func loadCategories(numberOfCategories: Int, responseHandler : (error : NSError? , items : Array<Category>?) -> ()) {
        
        // TODO : Student Enhancement: Get random number and pass as offset to randomize the game somewhat.
        
        let url = NSURL(string: "http://jservice.io/api/categories?count=\(numberOfCategories)")
        let request = NSURLRequest(URL: url!)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, requestError) -> Void in
            
            do {
                let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                
                var categories = Array<Category>()
                
                if let array = jsonData as? Array<AnyObject> {
                    print(array)
                    for object: AnyObject in array {
                        let category = Category.parseJSON(object as! Dictionary<String, AnyObject>)
                        categories.append(category)
                    }
                }
                
                responseHandler(error: requestError, items: categories)
            } catch {
                print(error)
                responseHandler(error: requestError, items: nil)
            }
            
        }
        
        task.resume()
    }
   }
