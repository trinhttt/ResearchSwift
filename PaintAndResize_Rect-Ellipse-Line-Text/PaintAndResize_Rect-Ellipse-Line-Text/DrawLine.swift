//
//  DrawLine.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Trinh Thai on 9/10/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import CoreGraphics

struct Line{
    var begin = CGPoint.zero
    var end = CGPoint.zero
}
var line = Line()
var finishedLines = [Line]()

class DrawView: UIView {
    @IBInspectable var finishedLineColor: UIColor = UIColor.black{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var currentLineColor: UIColor = UIColor.red{
        didSet{
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var lineThickness: CGFloat = 2 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    func strokeLine(line: Line) {
        let path = UIBezierPath()
        path.lineWidth = lineThickness
        path.lineCapStyle = CGLineCap.round
        
        path.move(to: line.begin)
        path.addLine(to: line.end)
        path.stroke()
    }
    
    override func draw(_ rect: CGRect) {
        finishedLineColor.setStroke()
        for line in finishedLines{
            strokeLine(line: line)
        }
        currentLineColor.setStroke()
        strokeLine(line: line)
        
       let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(UIColor.red.cgColor)
        print(line.begin.x)
        print(line.begin.y)
        if line.begin.x != 0 &&  line.begin.y != 0
        {
            context?.fillEllipse(in: CGRect(x: line.begin.x - 4, y: line.begin.y - 4, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context?.fillEllipse(in: CGRect(x: line.end.x - 4, y: line.end.y - 4, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            line = Line(begin: location, end: location)
             finishedLines.append(line)
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            line.end = touch.location(in: self)
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            line.end = touch.location(in: self)
            finishedLines.append(line)
        }
        setNeedsDisplay()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        setNeedsDisplay()
    }
    
}

