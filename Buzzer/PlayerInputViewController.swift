//
//  PlayerInputViewController.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-05-09.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//

import UIKit

class PlayerInputViewController: UIViewController {
    
    @IBOutlet weak var player1Name: UITextField!
    @IBOutlet weak var player2Name: UITextField!
    @IBOutlet weak var player3Name: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playGameAction(sender: AnyObject) {
        
     performSegueWithIdentifier("GoToQuestionPicker", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GoToQuestionPicker" {
            if let destinationViewController = segue.destinationViewController as? QuestionPickerViewController {
        
            let player1 = Player()
            player1.name = player1Name.text ?? ""
            
            let player2 = Player()
            player2.name = player2Name.text ?? ""
            
            let player3 = Player()
            player3.name = player3Name.text ?? ""
            
            let game = Game()
            game.player1 = player1
            game.player2 = player2
            game.player3 = player3
            game.loadCategoriesForNewGame(numberOfCategories, responseActionHandler: { (error) -> () in
                if error == nil {
                    // TODO: Load UI
                } else {
                    print("Error trying to load categories: \(error)")
                }
            
            })
           destinationViewController.game = game
        
        }
    }
    
    
    }
    
    
    
}
