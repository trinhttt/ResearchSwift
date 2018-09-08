//
//  MoveDetail.swift
//  PaintAndResize_Rect-Ellipse-Line-Text
//
//  Created by Trinh Thai on 9/8/18.
//  Copyright © 2018 Thai Thi Tu Trinh. All rights reserved.
//

import UIKit

extension CGFloat {
    var rounded : String {
        let divisor = pow(10.0, Double(2))
        return "\((Double(self) * divisor).rounded() / divisor)"
    }
}

class UIViewAttributesPreview: UIView {
    @IBOutlet weak var labelBounds: UILabel!
    @IBOutlet weak var labelFrame: UILabel!
    @IBOutlet weak var labelCenter: UILabel!
    @IBOutlet weak var labelAnchor: UILabel!
    
    @IBOutlet weak var watchedView: UIView? {
        didSet {////addObserver: These are not merely convenience methods; invoking them is potentially much faster than repeatedly invoking NSObject

            watchedView?.addObserver(self, forKeyPath: "frame", options: NSKeyValueObservingOptions.new, context: nil)
            watchedView?.addObserver(self, forKeyPath: "center", options: NSKeyValueObservingOptions.new, context: nil)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.labelFrame.text = self.watchedView!.frame.width.rounded
        self.labelCenter.text = self.watchedView!.center.x.rounded
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
}
