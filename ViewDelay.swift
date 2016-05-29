//
//  ViewDelay.swift
//  MyLittleMonsterDemo
//
//  Created by Shannon Coward on 5/26/16.
//  Copyright © 2016 Shannon Coward. All rights reserved.
//

import Foundation

func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}