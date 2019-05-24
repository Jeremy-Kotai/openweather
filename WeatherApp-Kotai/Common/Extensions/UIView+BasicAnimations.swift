//
//  UIView+BasicAnimations.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import UIKit

extension UIView {
    
    
    /*---------------------------------------------------------------------
     
     //MARK: SLIDING
     
     ---------------------------------------------------------------------*/
    
    func slideToCoordinates(coordinates : CGPoint, from : CGPoint, curve : UIView.AnimationOptions, duration : Double, delay : Double) {
        
        self.setXY(x: from.x, y: from.y)
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.setXY(x: coordinates.x, y: coordinates.y)
            
        }, completion: {  finished in
            if (finished) {}
        }
        )
        
    }
    
    func slideToCoordinates(coordinates : CGPoint, curve : UIView.AnimationOptions, duration : Double, delay : Double) {
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.setXY(x: coordinates.x, y: coordinates.y)
            
        }, completion: {  finished in
            if (finished) {}
        }
        )
        
    }
    
    func slideToCenter(centerPoint : CGPoint, curve : UIView.AnimationOptions, duration : Double, delay : Double) {
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.center = centerPoint
            
        }, completion: {  finished in
            if (finished) {}
        }
        )
        
    }
    
    func slide(direction : WAKAnimationDirection, curve : UIView.AnimationOptions, duration : Double, delay : Double, distance : CGFloat, startAtNegativeDistance : Bool) {
        
        var axisShift = distance
        
        if (direction == .up ||
            direction == .left) {
            axisShift *= -1
        }
        
        if (startAtNegativeDistance) {
            if (direction == .up ||
                direction == .down) {
                
                self.y -= axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x -= axisShift
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            if (direction == .up ||
                direction == .down) {
                
                self.y += axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x += axisShift
                
            }
            
            
        }, completion: {  finished in
            if (finished) {}
        }
        )
        
    }
    
    func slideWithCompletion(direction : WAKAnimationDirection, curve : UIView.AnimationOptions, duration : Double, delay : Double, distance : CGFloat, startAtNegativeDistance : Bool, completion: @escaping (_ finished : Bool) -> Void) {
        
        var axisShift = distance
        
        if (direction == .up ||
            direction == .left) {
            axisShift *= -1
        }
        
        if (startAtNegativeDistance) {
            if (direction == .up ||
                direction == .down) {
                
                self.y -= axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x -= axisShift
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            if (direction == .up ||
                direction == .down) {
                
                self.y += axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x += axisShift
                
            }
            
            
        }, completion: {  finished in
            if (finished) {
                
                completion(true)
                
            }
        }
        )
        
    }
    
    /*---------------------------------------------------------------------
     
     //MARK: FADING
     
     ---------------------------------------------------------------------*/
    
    func fadeIn() {
        self.fadeIn(curve: kBaseAnimationCurve, duration: kBaseAnimationDuration, delay: kBaseAnimationDelay)
    }
    
    func fadeIn(curve : UIView.AnimationOptions, duration : Double, delay : Double) {
        
        self.alpha = 0.0
        self.isHidden = false
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 1.0
            
        }, completion: {  finished in
            if (finished) {
                
            }
        }
        )
        
    }
    
    func fadeInWithCompletion(curve : UIView.AnimationOptions, duration : Double, delay : Double, completion: @escaping (_ finished : Bool) -> Void) {
        
        self.alpha = 0.0
        self.isHidden = false
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 1.0
            
        }, completion: {  finished in
            if (finished) {
                
                completion(true)
                
            }
        }
        )
        
    }
    
    func fadeInSlide(direction : WAKAnimationDirection, curve : UIView.AnimationOptions, duration : Double, delay : Double, distance : CGFloat, startAtNegativeDistance : Bool) {
        
        self.alpha = 0.0
        self.isHidden = false
        
        var axisShift = distance
        
        if (direction == .up ||
            direction == .left) {
            axisShift *= -1
        }
        
        if (startAtNegativeDistance) {
            if (direction == .up ||
                direction == .down) {
                
                self.y -= axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x -= axisShift
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 1.0
            
            if (direction == .up ||
                direction == .down) {
                
                self.y += axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x += axisShift
                
            }
            
        }, completion: {  finished in
            if (finished) {
                
            }
        }
        )
        
    }
    
    func fadeInSlideWithCompletion(direction : WAKAnimationDirection, curve : UIView.AnimationOptions, duration : Double, delay : Double, distance : CGFloat, startAtNegativeDistance : Bool, completion: @escaping (_ finished : Bool) -> Void) {
        
        self.alpha = 0.0
        self.isHidden = false
        
        var axisShift = distance
        
        if (direction == .up ||
            direction == .left) {
            axisShift *= -1
        }
        
        if (startAtNegativeDistance) {
            if (direction == .up ||
                direction == .down) {
                
                self.y -= axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x -= axisShift
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 1.0
            
            if (direction == .up ||
                direction == .down) {
                
                self.y += axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x += axisShift
                
            }
            
        }, completion: {  finished in
            if (finished) {
                completion(true)
            }
        }
        )
        
    }
    
    func fadeOut() {
        self.fadeOut(curve: kBaseAnimationCurve, duration: kBaseAnimationDuration, delay: kBaseAnimationDelay)
    }
    
    func fadeOutHide() {
        
        UIView.animate(withDuration: kBaseAnimationDuration, delay: kBaseAnimationDelay, options: kBaseAnimationCurve , animations: {
            
            self.alpha = 0.0
            
        }, completion: {  finished in
            if (finished) {
                self.isHidden = true
            }
        }
        )
        
    }
    
    func fadeOut(curve : UIView.AnimationOptions, duration : Double, delay : Double) {
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 0.0
            
        }, completion: {  finished in
            if (finished) {
                
            }
        }
        )
        
    }
    
    func fadeOutRemove(curve : UIView.AnimationOptions, duration : Double, delay : Double) {
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 0.0
            
        }, completion: {  finished in
            if (finished) {
                self.removeFromSuperview()
            }
        }
        )
        
    }
    
    func fadeOutWithCompletion(curve : UIView.AnimationOptions, duration : Double, delay : Double, completion: @escaping (_ finished : Bool) -> Void) {
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 0.0
            
        }, completion: {  finished in
            if (finished) {
                
                completion(true)
                
            }
        }
        )
        
    }
    
    func fadeOutSlide(direction : WAKAnimationDirection, curve : UIView.AnimationOptions, duration : Double, delay : Double, distance : CGFloat, startAtNegativeDistance : Bool) {
        
        var axisShift = distance
        
        if (direction == .up ||
            direction == .left) {
            axisShift *= -1
        }
        
        if (startAtNegativeDistance) {
            if (direction == .up ||
                direction == .down) {
                
                self.y -= axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x -= axisShift
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 0.0
            
            if (direction == .up ||
                direction == .down) {
                
                self.y += axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x += axisShift
                
            }
            
        }, completion: {  finished in
            if (finished) {
                
            }
        }
        )
        
    }
    
    func fadeOutSlideWithCompletion(direction : WAKAnimationDirection, curve : UIView.AnimationOptions, duration : Double, delay : Double, distance : CGFloat, startAtNegativeDistance : Bool, completion: @escaping (_ finished : Bool) -> Void) {
        
        var axisShift = distance
        
        if (direction == .up ||
            direction == .left) {
            axisShift *= -1
        }
        
        if (startAtNegativeDistance) {
            if (direction == .up ||
                direction == .down) {
                
                self.y -= axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x -= axisShift
                
            }
        }
        
        UIView.animate(withDuration: duration, delay: delay, options: curve , animations: {
            
            self.alpha = 0.0
            
            if (direction == .up ||
                direction == .down) {
                
                self.y += axisShift
                
            } else if (direction == .left ||
                direction == .right) {
                
                self.x += axisShift
                
            }
            
        }, completion: {  finished in
            if (finished) {
                completion(true)
            }
        }
        )
    }
    
    /*---------------------------------------------------------------------
     
     //MARK: JIGGLING
     
     ---------------------------------------------------------------------*/
    
    func smoothJiggle() {
        
        let degrees: CGFloat = 5.0
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation.z")
        animation.duration = 0.6
        animation.isCumulative = true
        animation.repeatCount = Float.infinity
        animation.values = [0.0,
                            degreesToRadians(degress: -degrees) * 0.25,
                            0.0,
                            degreesToRadians(degress: degrees) * 0.5,
                            0.0,
                            degreesToRadians(degress: -degrees),
                            0.0,
                            degreesToRadians(degress: degrees),
                            0.0,
                            degreesToRadians(degress: -degrees) * 0.5,
                            0.0,
                            degreesToRadians(degress: degrees) * 0.25,
                            0.0]
        animation.fillMode = CAMediaTimingFillMode.forwards;
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.isRemovedOnCompletion = true
        
        layer.add(animation, forKey: "wobble")
    }
    
    func stopJiggling() {
        self.layer.removeAllAnimations()
        self.transform = CGAffineTransform.identity
        self.layer.anchorPoint = CGPoint(x:0.5, y:0.5)
    }
        
}
