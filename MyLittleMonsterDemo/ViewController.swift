//
//  ViewController.swift
//  MyLittleMonsterDemo
//
//  Created by Shannon Coward on 5/18/16.
//  Copyright © 2016 Shannon Coward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImg: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var imgArray = [UIImage]()
        
        for x in 0...4 {
            let img = UIImage(named: "idle\(x).png")
            
            if img != nil {
                print("Adding image.")
                imgArray.append(img!)
                
            } else {
                print("unable to add imagaes")
            }
    }
        monsterImg.animationImages = imgArray
        monsterImg.animationDuration = 0.8
        monsterImg.animationRepeatCount = 0
        monsterImg.startAnimating()
    }

}

