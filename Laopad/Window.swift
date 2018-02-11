//
//  Window.swift
//  Laopad
//
//  Created by Wexpo Lyu on 2018/2/11.
//  Copyright © 2018年 Wexpo Lyu. All rights reserved.
//

import Cocoa

class Window: NSWindow {
    
    override var canBecomeKey: Bool {
        get {
            return true
        }
    }
    
}
