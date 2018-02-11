//
//  TrackpadView.swift
//  Laopad
//
//  Created by Wexpo Lyu on 2018/2/11.
//  Copyright © 2018年 Wexpo Lyu. All rights reserved.
//

import Cocoa

class TrackpadController: NSView {
    
    @IBOutlet weak var inputField: NSTextField!
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect);
        self.allowedTouchTypes = [.direct,.indirect]
        print("init")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.allowedTouchTypes = [.direct,.indirect]
        print("init")
    }
    
    
    override func touchesEnded(with event: NSEvent) {
        
        let touches = event.touches(matching: .ended, in: nil)
        
//        7 8 9 delete
//        4 5 6
//        1 2 3 clear
//        , 0 . enter
        
        for touch in touches {
            let pos = touch.normalizedPosition
            print(pos)
            if pos.y < 0.25 {
                if pos.x < 0.25 { inputField.stringValue += "," }
                if pos.x > 0.25 && pos.x < 0.5 { inputField.stringValue += "0" }
                if pos.x > 0.5 && pos.x < 0.75 { inputField.stringValue += "." }
                if pos.x > 0.75 { inputField.stringValue += "\n" }
            }
            if pos.y > 0.25 && pos.y < 0.5 {
                if pos.x < 0.25 { inputField.stringValue += "1" }
                if pos.x > 0.25 && pos.x < 0.5 { inputField.stringValue += "2" }
                if pos.x > 0.5 && pos.x < 0.75 { inputField.stringValue += "3" }
                if pos.x > 0.75 { inputField.stringValue = "" }
            }
            if pos.y > 0.5 && pos.y < 0.75 {
                if pos.x < 0.25 { inputField.stringValue += "4" }
                if pos.x > 0.25 && pos.x < 0.5 { inputField.stringValue += "5" }
                if pos.x > 0.5 && pos.x < 0.75 { inputField.stringValue += "6" }
                if pos.x > 0.75 { /* not yet defined */ }
            }
            if pos.y > 0.75 {
                if pos.x < 0.25 { inputField.stringValue += "7" }
                if pos.x > 0.25 && pos.x < 0.5 { inputField.stringValue += "8" }
                if pos.x > 0.5 && pos.x < 0.75 { inputField.stringValue += "9" }
                if pos.x > 0.75 {
                    let val = inputField.stringValue
                    inputField.stringValue = val.substring(to: val.index(before: val.endIndex))
                }
            }
        }
    }
}
