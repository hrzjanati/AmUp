//
//  storyBourdDesign.swift
//  instaFaraz
//
//  Created by 𝐻𝑜𝑠𝑒𝑖𝑛 𝑅𝑒𝑧𝑎𝑧𝑎𝑑𝑒ℎ  on 4/24/21.
//

import Foundation
import UIKit

extension UIView {

    @IBInspectable var cornerRadiusCircel: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = layer.frame.size.height / 2
            layer.masksToBounds = newValue > 0
        }
    }
    
    
    @IBInspectable var cornerRadiusV: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidthV: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColorV: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}


@IBDesignable
class PaddableTextField: UITextField {

    var padding = UIEdgeInsets(top: 0.0, left: 5.0, bottom: 0.0, right: 5.0)

    @IBInspectable var left: CGFloat = 0 {
        didSet {
            adjustPadding()
        }
    }

    @IBInspectable var right: CGFloat = 0 {
        didSet {
            adjustPadding()
        }
    }

    @IBInspectable var top: CGFloat = 0 {
        didSet {
            adjustPadding()
        }
    }

    @IBInspectable var bottom: CGFloat = 0 {
        didSet {
            adjustPadding()
        }
    }

    func adjustPadding() {
         padding = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)

    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
         return bounds.inset(by: UIEdgeInsets(top: top, left: left, bottom: bottom, right: right))
    }
}
