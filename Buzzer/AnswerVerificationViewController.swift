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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func endGameAction(sender: AnyObject) {
        
       performSegueWithIdentifier("FinalResultSegue", sender: nil)
        
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
