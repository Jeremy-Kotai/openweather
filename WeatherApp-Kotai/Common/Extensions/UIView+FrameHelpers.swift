//
//  UIView+FrameHelpers.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import UIKit

extension UIView {
    
    
    
    // MARK: - Getters/Setters
    // *********************************************************************************************
    
    public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    public var topSafeBuffer: CGFloat {
        get {
            return self.safeAreaInsets.top
        }
    }
    
    public var bottomSafeBuffer: CGFloat {
        get {
            return self.safeAreaInsets.bottom
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set (value) {
            self.frame.origin.y = value
        }
    }
    
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set (value) {
            self.frame.origin.x = value
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set (value) {
            self.frame.size.width = value
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set (value) {
            self.frame.size.height = value
        }
    }
    
    var midX: CGFloat {
        return self.frame.origin.x / 2
    }
    
    var midY: CGFloat {
        return self.frame.origin.y / 2
    }
    
    var midWidth: CGFloat {
        return self.frame.size.width / 2
    }
    
    var midHeight: CGFloat {
        return self.frame.size.height / 2
    }
    
    
    // MARK: - Frame functions
    // *********************************************************************************************
    
    @objc func newScale(scale : CGFloat) {
        self.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
    }
    
    func scale(scale : CGFloat) {
        self.transform = CGAffineTransform.identity.scaledBy(x: scale, y: scale)
    }
    
    func scaleFromWidths(originalFloat : CGFloat, newFloat : CGFloat) -> CGFloat {
        return newFloat / originalFloat
    }
    
    func setWidthHeight(width : CGFloat, height : CGFloat) {
        self.width = width
        self.height = height
    }
    
    func setXY(x : CGFloat, y : CGFloat) {
        self.x = x
        self.y = y
    }
    
    func setXYFromPoint(point : CGPoint) {
        self.x = point.x
        self.y = point.y
    }
    
    func adjustX(xIncrement : CGFloat) {
        self.adjustXY(xIncrement: xIncrement, yIncrement: 0)
    }
    
    func adjustY(yIncrement : CGFloat) {
        self.adjustXY(xIncrement: 0, yIncrement: yIncrement)
    }
    
    func adjustXY(xIncrement : CGFloat, yIncrement : CGFloat) {
        self.setXY(x: self.x + xIncrement, y: self.y + yIncrement)
    }
    
    func adjustWHByPercent(percent : CGFloat) {
        self.setWidthHeight(width: self.width * percent, height: self.height * percent)
    }
    
    func adjustProportionallyByWidth(width : CGFloat) {
        let newH : CGFloat = (width / self.width) * self.height
        self.setWidthHeight(width: width, height: newH)
    }
    
    func adjustProportionallyByHeight(height : CGFloat) {
        let newW : CGFloat = (height / self.height) * self.width
        self.setWidthHeight(width: newW, height: height)
    }
    
    func centerXWith(view : UIView) {
        var _center : CGPoint = self.superview!.convert(view.center, from : view.superview)
        _center.y = self.center.y
        self.center = _center
    }
    
    func centerYWith(view : UIView) {
        var _center : CGPoint = self.superview!.convert(view.center, from : view.superview)
        _center.x = self.center.x
        self.center = _center
    }
    
    func centerWith(view : UIView) {
        let _center : CGPoint = self.superview!.convert(view.center, from : view.superview)
        self.center = _center
    }
    
    func centerXInParent() {
        let xPoint : CGFloat = self.superview!.width/2
        self.center = CGPoint(x: xPoint, y: self.center.y)
    }
    
    func centerYInParent() {
        let yPoint : CGFloat = self.superview!.height/2
        self.center = CGPoint(x: self.center.x, y: yPoint)
    }
    
    func centerInParent() {
        let xPoint : CGFloat = self.superview!.width/2
        let yPoint : CGFloat = self.superview!.height/2
        self.center = CGPoint(x: xPoint, y: yPoint)
    }
    
    func centerInRect(rect : CGRect) {
        let centerX = rect.midX - rect.origin.x
        let centerY = rect.midY - rect.origin.y
        self.center = CGPoint(x:centerX, y:centerY)
    }
    
    func centerXInRect(rect : CGRect) {
        var _frame = self.frame
        _frame.origin.x = ((rect.size.width - _frame.size.width) / 2) + rect.origin.x
        self.frame = _frame
    }
    
    func centerYInRect(rect : CGRect) {
        let centerY = rect.midY
        var _frame = self.frame
        _frame.origin.y = (centerY - (_frame.size.height / 2)) + rect.origin.y
        self.frame = _frame
    }
    
    func insideTopEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x:0, y:spacing)
        self.y = self.superview!.convert(inTargetSpace, from: view).y
    }
    
    func insideTopEdgeBy(spacing : CGFloat) {
        self.insideTopEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func insideRightEdgeBy(spacing : CGFloat) {
        self.insideRightEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func insideRightEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x: view.frame.size.width - spacing - self.frame.size.width, y:0)
        self.x = self.superview!.convert(inTargetSpace, from: view).x
    }
    
    func insideBottomEdgeBy(spacing : CGFloat) {
        self.insideBottomEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func insideBottomEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x:0, y:view.frame.size.height - spacing - self.frame.size.height)
        self.y = self.superview!.convert(inTargetSpace, from: view).y
    }
    
    func insideLeftEdgeBy(spacing : CGFloat) {
        self.insideLeftEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func insideLeftEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x:spacing, y:0)
        self.x = self.superview!.convert(inTargetSpace, from: view).x
    }
    
    func outsideTopEdgeBy(spacing : CGFloat) {
        self.outsideTopEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func outsideTopEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x:0, y: -(spacing + self.frame.size.height))
        self.y = self.superview!.convert(inTargetSpace, from: view).y
    }
    
    func outsideRightEdgeBy(spacing : CGFloat) {
        self.outsideRightEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func outsideBottomEdgeBy(spacing : CGFloat) {
        self.outsideBottomEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func outsideLeftEdgeBy(spacing : CGFloat) {
        self.outsideLeftEdgeOf(view: self.superview!, spacing: spacing)
    }
    
    func outsideRightEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x: view.frame.size.width + spacing, y:0)
        self.x = self.superview!.convert(inTargetSpace, from: view).x
    }
    
    func outsideBottomEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x:0, y:view.frame.size.height + spacing)
        self.y = self.superview!.convert(inTargetSpace, from: view).y
    }
    
    func outsideLeftEdgeOf(view : UIView, spacing : CGFloat) {
        let inTargetSpace = CGPoint(x:-(spacing + self.frame.size.width), y:0)
        self.x = self.superview!.convert(inTargetSpace, from: view).x
    }
    
    func belowView(view : UIView) {
        self.y = view.height + view.y
    }
    
    func belowView(view : UIView, padding : CGFloat) {
        self.y = view.height + view.y + padding
    }
    
    func toRightOfView(view : UIView, padding : CGFloat) {
        self.x = view.width + view.x + padding
    }
    
    func setW(w : CGFloat) {
        self.setWH(w: w, h: self.frame.size.height)
    }
    
    func setH(h : CGFloat) {
        self.setWH(w: self.frame.size.width, h: h)
    }
    
    func setWH(w : CGFloat, h : CGFloat) {
        let _frame = self.frame
        self.frame = CGRect(x: _frame.origin.x, y:_frame.origin.y, width: w, height: h)
    }
    
    func centerY(y : CGFloat) {
        self.center = CGPoint(x:self.center.x, y:y)
    }
    
    func centerX(x : CGFloat) {
        self.center = CGPoint(x:x, y:self.center.y)
    }
    
    func adjustW(w : CGFloat) {
        self.adjustWH(w:w, h: 0)
    }
    
    func adjustH(h : CGFloat) {
        self.adjustWH(w:0, h: h)
    }
    
    func adjustWH(w : CGFloat, h : CGFloat) {
        let _frame = self.frame
        self.frame = CGRect(x:_frame.origin.x, y:_frame.origin.y, width:_frame.size.width + w, height:_frame.size.height + h)
    }
    
    func setSizeFromSize(size : CGSize) {
        var _frame = self.frame
        _frame.size = size
        self.frame = _frame
    }
    
    func setSizeFromView(view : UIView) {
        var _frame = self.frame
        _frame.size = view.frame.size
        self.frame = _frame
    }
    
    func maxX() -> CGFloat {
        return self.frame.maxX
    }
    
    func maxY() -> CGFloat {
        return self.frame.maxY
    }
    
    func aspectRatio() -> CGFloat {
        return self.frame.size.width / self.frame.size.height
    }
    
    func border(width : CGFloat, color : CGColor) {
        self.layer.borderColor = color
        self.layer.borderWidth = width
    }
    
    func shadow(radius : CGFloat, opacity : Float, offset : CGSize, color : UIColor) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func makeIntoCircle() {
        if (self.width == self.height) {
            self.layer.cornerRadius = self.width/2
            self.clipsToBounds = true
        }
    }
    
    func shadowedLayer(fill: UIColor, cornerRadius: CGFloat, shadowColor: UIColor, path: CGRect, offset: CGSize, opacity: Float, radius: CGFloat, borderWidth: CGFloat, borderColor: UIColor?) {
        
        let shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: path, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = fill.cgColor
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowOpacity = opacity
        shadowLayer.borderWidth = borderWidth
        if (borderColor != nil) { shadowLayer.borderColor = borderColor!.cgColor }
        shadowLayer.shadowRadius = radius
        
        self.layer.insertSublayer(shadowLayer, at: 0)
        
    }
    
}

