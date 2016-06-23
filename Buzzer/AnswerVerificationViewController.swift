//
//  AnswerVerificationViewController.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-06-01.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//

import UIKit

class AnswerVerificationViewController: UIViewController {
    
    var game: Game?
    
    @IBOutlet var categoryNameLabel: UILabel!
    @IBOutlet var categoryPriceLabel: UILabel!
    @IBOutlet var questionTextLabel: UITextView!
    @IBOutlet weak var answerTextLabel: UITextView!
    @IBOutlet weak var corectButton: UIButton!
    @IBOutlet weak var wrongButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUIElements()
        // Do any additional setup after loading the view.
    }

    
    func configureUIElements() {
        
        categoryNameLabel.text = game?.currentQuestion?.category?.title
        categoryPriceLabel.text = game?.currentQuestion?.formattedPrice()
        questionTextLabel.text = game?.currentQuestion?.answer
        answerTextLabel.text = game?.currentQuestion?.playerAnswer
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endGameAction(sender: AnyObject) {
        
       performSegueWithIdentifier("FinalResultSegue", sender: nil)
        
    }
    
    @IBAction func corectAnswerAction(sender: AnyObject) {

        
        game?.curentPlayerGotItRight()
                let alert = UIAlertController(title: "Yahoo", message: "You Got it right", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Destructive, handler: { alert in
         print("ksdg")
        }))
        
            corectButton.enabled = false
            wrongButton.enabled = false
     
        
        presentViewController(alert, animated: true, completion: nil)
        }
    
    @IBAction func wrongAnswerAction(sender: AnyObject) {

        
        
        
       
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "FinalResultSegue" {
            
            if let destinationViewController = segue.destinationViewController as?
            FinalResultsViewController {
                
                destinationViewController.game = game
            }
        }
    }
 
  /*  // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 */

}
