//
//  ViewController.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Thai Thi Tu Trinh on 9/7/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ibRectangleButton: UIButton!
    @IBOutlet weak var ibCircleButton: UIButton!
    @IBOutlet weak var ibLineButton: UIButton!
    @IBOutlet weak var ibTextButton: UIButton!
    
    var resizeView1 : ResizeView = ResizeView()
    var resizeView2 : ResizeView = ResizeView()
    var resizeView3 : ResizeView = ResizeView()
    var resizeView4 : ResizeView = ResizeView()
    
    var subView = UIView()
    @IBAction func ibDrawRectangle(_ sender: Any) {
        contentTextView.removeFromSuperview()
        contentView.removeFromSuperview()
        resizeView1.removeFromSuperview()
        resizeView2.removeFromSuperview()
        resizeView3.removeFromSuperview()
        resizeView4.removeFromSuperview()

        chooseDrawLine = false
        
        self.resizeView1.backgroundColor = .white
        self.resizeView1.frame = CGRect(x: 30, y: 40, width: 170, height: 170)
        self.view.addSubview(resizeView1)
        resizeView1.setNeedsDisplay()
    }
    
    
    @IBAction func ibDrawCircle(_ sender: Any) {
        contentTextView.removeFromSuperview()
        contentView.removeFromSuperview()
        resizeView1.removeFromSuperview()
        resizeView2.removeFromSuperview()
        resizeView3.removeFromSuperview()
        resizeView4.removeFromSuperview()

        chooseDrawLine = false
        
        self.resizeView2.backgroundColor = .lightGray
        self.resizeView2.frame = CGRect(x: 30, y: 40, width: 170, height: 170)
        self.view.addSubview(resizeView2)
        
        self.resizeView2.addSubview(contentView)
        contentView.backgroundColor = .white
        contentView.frame = (contentView.superview?.bounds.insetBy(dx: borderInset/8, dy: borderInset/8))!
        contentView.layer.cornerRadius = (contentView.frame.width) / 2.0
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth, .flexibleTopMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]
        contentView.setNeedsLayout()
        resizeView2.setNeedsDisplay()
        
    }
    @IBAction func ibDrawLine(_ sender: Any) {
        

        contentTextView.removeFromSuperview()
        contentView.removeFromSuperview()
        resizeView1.removeFromSuperview()
        resizeView2.removeFromSuperview()
        resizeView3.removeFromSuperview()
        resizeView4.removeFromSuperview()

        chooseDrawLine = true
        
        self.resizeView4.backgroundColor = .lightGray
        self.resizeView4.frame = CGRect(x: 30, y: 40, width: 170, height: 170)
        self.view.addSubview(resizeView4)
        resizeView4.setNeedsDisplay()
    }
    
    @IBAction func ibDrawTextField(_ sender: Any) {

        contentTextView.removeFromSuperview()
        contentView.removeFromSuperview()
        resizeView1.removeFromSuperview()
        resizeView2.removeFromSuperview()
        resizeView3.removeFromSuperview()
        resizeView4.removeFromSuperview()

        chooseDrawLine = false
        self.resizeView3.backgroundColor = .white
        self.resizeView3.frame = CGRect(x: 30, y: 40, width: 300, height: 70)
        self.view.addSubview(resizeView3)
        
        self.resizeView3.addSubview(contentTextView)
        contentTextView.text = ""
        contentTextView.placeholder = "Give me some words"
        contentTextView.backgroundColor = .white
        contentTextView.frame = CGRect(x: 5, y: 5, width: 290, height: 60)
        contentTextView.autoresizingMask = [.flexibleHeight, .flexibleWidth, .flexibleTopMargin, .flexibleRightMargin, .flexibleLeftMargin, .flexibleBottomMargin]
        contentTextView.setNeedsLayout()
        resizeView3.setNeedsDisplay()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentTextView.removeFromSuperview()
        contentView.removeFromSuperview()
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

