//
//  ViewController.swift
//  MyLittleMonsterDemo
//
//  Created by Shannon Coward on 5/18/16.
//  Copyright © 2016 Shannon Coward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImg: MonsterImg!
    @IBOutlet weak var foodImg: DragImg!
    @IBOutlet weak var heartImg: DragImg!
    @IBOutlet weak var penalty1Img: UIImageView!
    @IBOutlet weak var penalty2Img: UIImageView!
    @IBOutlet weak var penalty3Img: UIImageView!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALTIES = 3
    
    var penalties = 0
    var timer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodImg.dropTarget = monsterImg
        heartImg.dropTarget = monsterImg
        
        penalty1Img.alpha = DIM_ALPHA
        penalty2Img.alpha = DIM_ALPHA
        penalty3Img.alpha = DIM_ALPHA
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:
            #selector(ViewController.itemDroppedOncharacter(_:)), name: "onTargetDropped", object: nil)
        
        startTimer()
    }
    
    func itemDroppedOncharacter(notif: AnyObject) {
        
    }
    
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    
    func changeGameState() {
        
        penalties += 1
        
        if penalties == 1 {
            penalty1Img.alpha = OPAQUE
            penalty2Img.alpha = DIM_ALPHA
        } else if penalties == 2 {
            penalty2Img.alpha = OPAQUE
            penalty3Img.alpha = DIM_ALPHA
        } else if penalties >= 3 {
            penalty3Img.alpha = OPAQUE
        } else {
            penalty1Img.alpha = DIM_ALPHA
            penalty2Img.alpha = DIM_ALPHA
            penalty3Img.alpha = DIM_ALPHA
        }
        
        if penalties >= MAX_PENALTIES {
            gameOver()
        }
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.playDeathAnimation()
    
    }
}

