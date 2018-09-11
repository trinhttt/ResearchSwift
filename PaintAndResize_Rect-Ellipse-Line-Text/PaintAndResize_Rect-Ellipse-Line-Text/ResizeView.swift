//
//  DrawView.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Thai Thi Tu Trinh on 9/7/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import CoreGraphics

var startPointDrawRect = [CGPoint]()
var oneTimes = 1
class ResizeView: UIView {
    
    public var minHeight : CGFloat = 0.0
    public var minWidth : CGFloat = 0.0
    public var showBorders : Bool = true {
        didSet {
            self.setNeedsDisplay()///Hàm có sẳn: Đánh dấu toàn bộ hình chữ nhật của người nhận khi cần phải vẽ lại.
        }
    }
    public var borderSize : CGFloat = 10

    private var lastLocation : CGPoint!
    private var dragging: Bool {
        get  {
            return handleSelection.count == 0
        }
    }
    private var handleSelection : [DragDirection] = []
    
    //MARK: - override touchesBegan + touchesMoved + touchesEnded + touchesCancelled
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let superview = self.superview, let touch = touches.first, showBorders else {
            return
        }
        
        superview.bringSubview(toFront: self)
        var locationInView = touch.location(in: superview)
        let frame = self.frame
        locationInView.x = locationInView.x - frame.origin.x
        locationInView.y = locationInView.y - frame.origin.y
        if oneTimes == 1 {
            startPointDrawRect.append(locationInView)
            oneTimes = oneTimes + 1
        }
        ///  1   2   3
        ///  8       4
        ///  7   6   5
        let Point1 = CGRect(x: 0, y: 0, width: borderSize, height: borderSize).contains(locationInView)
        let Point2 = CGRect(x: self.frame.size.width / 2 - borderSize / 2, y: 0, width: borderSize, height: borderSize).contains(locationInView)
        let Point3 = CGRect(x: self.frame.size.width - borderSize , y: 0, width: borderSize, height: borderSize).contains(locationInView)
        let Point4 = CGRect(x: self.frame.size.width - borderSize , y: self.frame.size.height / 2 - borderSize / 2, width: borderSize, height: borderSize).contains(locationInView)
        let Point5 = CGRect(x: self.frame.size.width - borderSize, y: self.frame.size.height - borderSize, width: borderSize, height: borderSize).contains(locationInView)
        let Point6 = CGRect(x: self.frame.size.width / 2 - borderSize / 2 , y: self.frame.size.height - borderSize , width: borderSize, height: borderSize).contains(locationInView)
        let Point7 = CGRect(x: 0, y: self.frame.size.height - borderSize , width: borderSize, height: borderSize).contains(locationInView)
        let Point8 = CGRect(x: 0, y: self.frame.size.height / 2 - borderSize / 2, width: borderSize, height: borderSize).contains(locationInView)
 
        handleSelection = []
        if Point1 { ////Chọn điểm trên bên trái thì sẽ thay đổi theo chiều LÊN & TRÁI
            handleSelection.append(.up)
            handleSelection.append(.left)
        }
        if Point2 {
            handleSelection.append(.up)
        }
        if Point3 {
            handleSelection.append(.up)
            handleSelection.append(.right)
        }
        if Point4 {
            handleSelection.append(.right)
        }
        if Point5 {
            handleSelection.append(.down)
            handleSelection.append(.right)
        }
        if Point6 {
            handleSelection.append(.down)
        }
        if Point7 {
            handleSelection.append(.down)
            handleSelection.append(.left)
        }
        if Point8 {
            handleSelection.append(.left)
        }
        /// open func location(in view: UIView?) -> CGPoint
        lastLocation = touch.location(in: superview)///cập nhật điểm cuối cùng lúc buông khi kéo
    }
    
    /// Mỗi lần thay đổi đều gọi đến hàm touches moved
    /// Nếu đang còn kéo thì gọi hàm moveCenter để cập nhật tọa độ điểm chính giữa.
    ///Nếu đã thả ra rồi thì cập nhật
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("(x: \(self.frame.origin.x), y: \(self.frame.origin.y), width: \(self.frame.size.width), height: \(self.frame.size.height))")/// tọa độ của điểm điểm giữa, khi kéo rộng ra sẽ không thay đổi, Chiều rộng view, Chiều cao view
        guard let superview = self.superview, let touch = touches.first, showBorders else {
            return
        }
        let locationInSuperview = touch.location(in: superview)
        if dragging {
            moveCenter(to: locationInSuperview)
        }else {
            resize(using: locationInSuperview)
        }
        lastLocation = locationInSuperview
        setNeedsDisplay()

    }
    
    ///Gọi khi buông k kéo nữa
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
        arrContentView.append(contentView)
        handleSelection = []
        setNeedsDisplay()
        oneTimes = 1

        print("Start point of rect: (\(contentView.frame.origin.x),\(contentView.frame.origin.y))")


    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
        handleSelection = []
        setNeedsDisplay()

    }
    
    private func moveCenter(to newLocation: CGPoint) {
        guard let superview = self.superview else{
            return
        }
        ///tính khoảng dịch chuyển
        let translationX = newLocation.x - lastLocation.x
        let translationY = newLocation.y - lastLocation.y
        ///tọa độ điểm chính giữa mới
        var newX = self.center.x + translationX
        var newY = self.center.y + translationY
        /// Đảm bảo còn trong supper view => Tránh khi kéo ra ngoài màn hình
        let didPassRightBounds = newX + self.frame.size.width / 2 > superview.bounds.maxX
        let didPassLeftBounds = newX - self.frame.size.width / 2 < superview.bounds.minX
        if didPassLeftBounds || didPassRightBounds {
            newX = self.center.x
            print("vuot tp")
        }
        let didPassdownBounds = newY + self.frame.size.height / 2 > superview.bounds.maxY
        let didPassUpperBounds = newY - self.frame.size.height / 2 < superview.bounds.minY
        if didPassdownBounds || didPassUpperBounds {
            print("vuot td")
            newY = self.center.y
        }
        self.center = CGPoint(x: newX, y: newY)
        self.setNeedsDisplay()
    }
    
    private func resize(using newLocation: CGPoint) {
        guard let superview = self.superview else {
            return
        }
        let newLocation = newLocation
        var newX : CGFloat = self.frame.origin.x
        var newY : CGFloat = self.frame.origin.y
        var newW : CGFloat = self.frame.size.width
        var newH : CGFloat = self.frame.size.height
        
        let deltaY = newLocation.y - lastLocation.y
        let deltaX = newLocation.x - lastLocation.x
        
        if handleSelection.contains(.up) {
            if (newH - deltaY < self.minHeight) {
                newY = self.frame.maxY - self.minHeight
                newH = self.minHeight
            }else {
                newY = self.frame.origin.y + deltaY
                newH = self.frame.size.height - deltaY
            }
            if newY < superview.bounds.minY {
                newY = self.frame.origin.y
                newH = self.frame.size.height
            }
        }
        
        if handleSelection.contains(.left) {
            if (newW - deltaX < self.minWidth) {
                newX = self.frame.maxX - self.minWidth
                newW = self.minWidth
            }else {
                newX = self.frame.origin.x + deltaX
                newW = self.frame.size.width - deltaX
            }
            if newX < superview.bounds.minX {
                newX = self.frame.origin.x
                newW = self.frame.size.width
            }
        }
        
        if handleSelection.contains(.down) {
            if newH + deltaY < self.minHeight {
                newH = self.minHeight
            }else {
                newH = self.frame.size.height + deltaY
            }
            if newY + newH > superview.bounds.maxY {
                newH = superview.bounds.maxY - newY
            }
        }
        
        if handleSelection.contains(.right) {
            if newW + deltaX < self.minWidth {
                newW = self.minWidth
            }else {
                newW = self.frame.size.width + deltaX
            }
            if newX + newW > superview.bounds.maxX {
                newW = superview.bounds.maxX - newX
            }
        }
        self.frame = CGRect(x: newX, y: newY, width: newW, height: newH)
       
        contentView.layer.cornerRadius = (contentView.frame.width) / 2.0
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        //        super.draw(rect)
        guard showBorders, let context = UIGraphicsGetCurrentContext() else {
            return
        }
        ///Đường kẻ ở ngoài
        context.setLineWidth(1)
        context.setStrokeColor(UIColor.red.cgColor)
        let centerSpacing = borderInset/15
        let segments = [
            CGPoint(x:rect.minX + centerSpacing, y: rect.minY + centerSpacing),
            CGPoint(x:rect.maxX - centerSpacing, y: rect.minY + centerSpacing),
            CGPoint(x:rect.maxX - centerSpacing, y: rect.minY + centerSpacing),
            CGPoint(x:rect.maxX - centerSpacing, y: rect.maxY - centerSpacing),
            CGPoint(x:rect.maxX - centerSpacing, y: rect.maxY - centerSpacing),
            CGPoint(x:rect.minX + centerSpacing, y: rect.maxY - centerSpacing),
            CGPoint(x:rect.minX + centerSpacing, y: rect.maxY - centerSpacing),
            CGPoint(x:rect.minX + centerSpacing, y: rect.minY + centerSpacing)]
            context.strokeLineSegments(between: segments)
            context.setFillColor(UIColor.red.cgColor)
            
            context.fillEllipse(in: CGRect(x: 0, y: 0, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x: self.bounds.size.width / 2 - centerSpacing, y: 0, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x: self.bounds.size.width - borderInset, y: 0, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x: self.bounds.size.width - borderInset, y: self.bounds.size.height / 2 - centerSpacing, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x: self.bounds.size.width - borderInset, y: self.bounds.size.height - borderInset, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x:self.bounds.size.width / 2 - centerSpacing, y: self.bounds.size.height - borderInset, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x: 0, y: self.bounds.size.height - borderInset, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
            context.fillEllipse(in: CGRect(x: 0, y: self.bounds.size.height / 2 - centerSpacing, width: borderInset, height: borderInset).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
        /////
//        let context2 = UIGraphicsGetCurrentContext()
//        context2?.setFillColor(UIColor.blue.cgColor)
//        print("arr: \(arrContentView.count)")
//        var indexPoint = 0
//        for contentDrawView in arrContentView{
////            print(startPointDrawRect[indexPoint].x)
////            print(startPointDrawRect[indexPoint].y)
//
//            context2?.fillEllipse(in: CGRect(x: startPointDrawRect[indexPoint].x,y: startPointDrawRect[indexPoint].y, width: contentDrawView.frame.size.width, height: contentDrawView.frame.size.height).insetBy(dx: (borderInset - handleSize) / 2, dy: (borderInset - handleSize) / 2))
//            indexPoint = indexPoint + 1
//        }

        self.setNeedsDisplay()

        
    }
}
