//
//  ViewController.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Thai Thi Tu Trinh on 9/7/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    @IBOutlet weak var ibDrawView: UIView!
    @IBOutlet weak var ibDrawLineVector: UIButton!
    var gesture = UIPanGestureRecognizer()
//    var gesture : UIPanGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.draggedView(_:)))
        ibDrawView.isUserInteractionEnabled = true
        ibDrawView.addGestureRecognizer(gesture)
    }
    var rotated : Bool = false

    @IBAction func rotate() {
        if rotated {
            self.ibDrawView.transform = .identity
        }else {
            self.ibDrawView.transform = CGAffineTransform.identity.rotated(by: CGFloat.pi / 2)
        }
        
        rotated = !rotated
        
    }
    @objc func draggedView(_ sender:UIPanGestureRecognizer){
        self.view.bringSubview(toFront: ibDrawView)
        let translation = sender.translation(in: self.view)
        ibDrawView.center = CGPoint(x: ibDrawView.center.x + translation.x, y: ibDrawView.center.y + translation.y)
        sender.setTranslation(CGPoint.zero, in: self.view)
        
        //var translation = sender.translation(in: self.view)
//        ibDrawView.center = CGPoint(x: sender.view!.center.x,y: ibDrawView.center.y + translation.y)
//        sender.setTranslation(CGPoint.zero, in: self.view)
//        var distanceBetweenMarkers = self.topMarker.frame.origin.y - self.bottomMarker.frame.origin.y
//        vertical.frame.origin.y = self.topMarker.frame.origin.y
//        vertical.frame.size.height = distanceBetweenMarkers
        
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
//To save current Context
//    let context = UIGraphicsGetCurrentContext()
//    context!.saveGState()

//To restore
//    context!.restoreGState()

