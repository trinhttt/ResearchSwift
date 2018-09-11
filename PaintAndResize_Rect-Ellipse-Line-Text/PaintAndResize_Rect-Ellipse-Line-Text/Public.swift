//
//  Public.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Thai Thi Tu Trinh on 9/11/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import Foundation
import UIKit

struct Line{
    var begin = CGPoint.zero
    var end = CGPoint.zero
}
var line = Line()
var finishedLines = [Line]()

enum DragDirection {
    case up
    case down
    case right
    case left
}
var contentTextView = UITextField(){
    didSet {
        repositionContentTextView()
    }
}

func repositionContentTextView() {
    contentTextView.frame = (contentTextView.superview?.bounds.insetBy(dx: borderInset/8, dy: borderInset/8))!// -> CGRect
}
var arrContentView = [UIView]()
var contentView = UIView() {
    didSet {
        repositionContentView()///dat lai vi tri view noi dung
    }
}

func repositionContentView() {
    contentView.frame = (contentView.superview?.bounds.insetBy(dx: borderInset/8, dy: borderInset/8))!// -> CGRect
}

var borderInset : CGFloat = 10 {///viền
    didSet {
        repositionContentTextView()
        contentTextView.setNeedsDisplay()
        repositionContentView()
        contentView.setNeedsDisplay()
        
        
    }
}
var handleSize : CGFloat = 10 {
    didSet {
        contentTextView.setNeedsDisplay()
        contentView.setNeedsDisplay()
    }
}
