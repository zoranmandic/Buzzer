//
//  QuestionPickerViewController.swift
//  Buzzer
//
//  Created by Zoran Mandic on 2016-05-09.
//  Copyright © 2016 Zoran Mandic. All rights reserved.
//

import UIKit

class QuestionPickerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var questionCollectionView:
    UICollectionView!
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK:-UICollectionviewDelegate
    
    //MARK:-UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) ->Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) ->
        UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuestionPrice", forIndexPath: indexPath) as? QuestionPriceCell{
                cell.priceLabel.text = "$999"
                return cell
    }

    return UICollectionViewCell (frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    
}
