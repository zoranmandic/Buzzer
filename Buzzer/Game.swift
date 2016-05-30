//
//  Game.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-05-04.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//xx

import Foundation

class Game {
    
    var player1: Player?
    var player2: Player?
    var player3: Player?
    var currentPlayer: Player?
    
    var question: [Question] = []
    var currentQuestion: Question?
    var categories: [Category] = []
    

    func loadCategoriesForNewGame() {
        do {
            categories = try Category.loadCategories()
        }
        catch let error {
            print("Error loading categories: \(error)")
        }
    }
    
    func loadCategoriesForNewGame(numberOfCategories: Int, responseActionHandler : (error : NSError?) -> ()) {
        Category.loadCategories(numberOfCategories, responseHandler: { (error, items) -> () in
            self.categories = items!
            
            if let categoriesArray = items {
                self.categories = categoriesArray
            }
            
            responseActionHandler(error: error)
            
        })
    }
    
}