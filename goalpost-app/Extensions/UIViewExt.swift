//
//  UIViewExt.swift
//  goalpost-app
//
//  Created by david.roff on 3/7/18.
//  Copyright © 2018 david.roff. All rights reserved.
//

import UIKit

//extension UIView {
//    func bindToKeyboard() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
//    }
//
//    @objc func keyboardWillChange(_ notification: NSNotification) {
//        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
//        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
//        let startingFrame = (notification.userInfo![UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
//        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        let deltaY = endingFrame.origin.y - startingFrame.origin.y
//
//        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
//            self.frame.origin.y += deltaY
//        }, completion: nil)
//    }
//}

class KeyboardAdjustableButton: UIButton {
    
    private var initialFrame: CGRect = .zero
    
    func bindToKeyboard() {
        initialFrame = frame
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(_:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    @objc func keyboardWillChange(_ notification: NSNotification) {
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        let endingFrame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: UIViewKeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y = self.initialFrame.origin.y - endingFrame.height
        }, completion: nil)
    }
}
