//
//  MenuViewController.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-05-04.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func PlayGame(sender: AnyObject) {
        print("HELLO")
    }
    
   @IBAction func unwindToMenuViewController(segue: UIStoryboardSegue) {
    
    }
}

