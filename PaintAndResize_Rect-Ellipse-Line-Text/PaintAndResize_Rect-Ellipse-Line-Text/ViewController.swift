//
//  ViewController.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Thai Thi Tu Trinh on 9/7/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    @IBOutlet weak var ibRectangleButton: UIButton!
    @IBOutlet weak var ibCircleButton: UIButton!
    @IBOutlet weak var ibLineButton: UIButton!
    @IBOutlet weak var ibTextButton: UIButton!
    @IBOutlet weak var ibDrawView: UIView!

    var resizeView1 : ResizeView = ResizeView()
    var resizeView2 : ResizeView = ResizeView()
    var resizeView3 : ResizeView = ResizeView()
    var resizeView4 : DrawView = DrawView()
    
    @IBAction func ibClearViewAction(_ sender: Any) {
        finishedLines.removeAll()
        line.begin = CGPoint.zero
        line.end = CGPoint.zero
        contentTextView.removeFromSuperview()
        contentView.removeFromSuperview()
        resizeView1.removeFromSuperview()
        resizeView2.removeFromSuperview()
        resizeView3.removeFromSuperview()
        resizeView4.removeFromSuperview()
    }
    @IBAction func ibDrawRectangle(_ sender: Any) {
        self.resizeView1.backgroundColor = .lightGray
        self.resizeView1.frame = CGRect(x: 30, y: 40, width: 170, height: 170)
        self.ibDrawView.addSubview(resizeView1)

        resizeView1.setNeedsDisplay()

    }
    
    
    @IBAction func ibDrawCircle(_ sender: Any) {

        self.resizeView2.backgroundColor = .white
        self.resizeView2.frame = CGRect(x: 30, y: 40, width: 170, height: 170)
        self.ibDrawView.addSubview(resizeView2)
        
        self.resizeView2.addSubview(contentView)
        contentView.backgroundColor = .lightGray
        contentView.frame = (contentView.superview?.bounds.insetBy(dx: borderInset/8, dy: borderInset/8))!
        contentView.layer.cornerRadius = (contentView.frame.width) / 2.0
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth, .flexibleTopMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]
//        arrContentView.append(contentView)
        contentView.setNeedsLayout()
        resizeView2.setNeedsDisplay()
    }
    @IBAction func ibDrawLine(_ sender: Any) {
        self.resizeView4.backgroundColor = .white
        self.resizeView4.frame = CGRect(x: 0, y: 0, width: self.ibDrawView.frame.width, height: self.ibDrawView.frame.height)//self.ibDrawView.frame
        self.ibDrawView.addSubview(resizeView4)
        resizeView4.setNeedsDisplay()
    }
   
    @IBAction func ibDrawTextField(_ sender: Any) {
        self.resizeView3.backgroundColor = .white
        self.resizeView3.frame = CGRect(x: 30, y: 40, width: 300, height: 70)
        self.ibDrawView.addSubview(resizeView3)
        
        self.resizeView3.addSubview(contentTextView)
        contentTextView.placeholder = "Give me some words"
        contentTextView.backgroundColor = .white
        contentTextView.frame = CGRect(x: 10, y: 10, width: 280, height: 50)
        contentTextView.autoresizingMask = [.flexibleHeight, .flexibleWidth, .flexibleTopMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]
        contentTextView.setNeedsLayout()
        resizeView3.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "ic_rectangle")?.withRenderingMode(.alwaysTemplate)
        ibRectangleButton.setImage(image, for: .normal)
        ibRectangleButton.tintColor = UIColor.white
        
        let image1 = UIImage(named: "ic_circle")?.withRenderingMode(.alwaysTemplate)
        ibCircleButton.setImage(image1, for: .normal)
        ibCircleButton.tintColor = UIColor.white
        
        let image2 = UIImage(named: "ic_line")?.withRenderingMode(.alwaysTemplate)
        ibLineButton.setImage(image2, for: .normal)
        ibLineButton.tintColor = UIColor.white
        
        let image3 = UIImage(named: "ic_text")?.withRenderingMode(.alwaysTemplate)
        ibTextButton.setImage(image3, for: .normal)
        ibTextButton.tintColor = UIColor.white
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

