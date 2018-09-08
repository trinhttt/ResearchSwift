//
//  ViewController.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Thai Thi Tu Trinh on 9/7/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    public var typeAction = -1
    var resizeView : ResizeView = ResizeView()
    
    @IBOutlet weak var ibRectangleButton: UIButton!
    @IBAction func ibDrawRectangle(_ sender: Any) {
//        resizeView : ResizeView!
        self.resizeView.backgroundColor = .white
        self.resizeView.frame = CGRect(x: 20, y: 20, width: 100, height: 100)
        self.view.addSubview(resizeView)
//        self.resizeView.setNeedsLayout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let ibRectangleButton = UIButton(type: .custom)
        let image = UIImage(named: "ic_rectangle")?.withRenderingMode(.alwaysTemplate)
        ibRectangleButton.setImage(image, for: .normal)
        ibRectangleButton.tintColor = UIColor.white
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

