//
//  MonsterImg.swift
//  MyLittleMonsterDemo
//
//  Created by Shannon Coward on 5/25/16.
//  Copyright © 2016 Shannon Coward. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    
    func playIdleAnimation() {
        self.image = UIImage(named: "idle1.png")
        
        self.animationImages = nil
        
        
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
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    
    }
    
    func playDeathAnimation() {
        self.image = UIImage(named: "dead5.png")
        
        self.animationImages = nil
        
        var imgArray = [UIImage]()
        
        for x in 0...5 {
            let img = UIImage(named: "dead\(x).png")
            
            if img != nil {
                print("Adding image.")
                imgArray.append(img!)
                
            } else {
                print("error")
            }
        }
        
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()

    }
}