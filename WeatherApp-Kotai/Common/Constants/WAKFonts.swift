//
//  WAKFonts.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import UIKit

enum WAKFontType : String {
    case black = "Avenir-Heavy"
    case bold = "AvenirNext-Bold"
    case boldItalic = "AvenirNext-BoldItalic"
    case italic = "AvenirNext-Italic"
    case light = "Avenir-Light"
    case lightItalic = "Avenir-LightOblique"
    case medium = "Avenir-Medium"
    case regular = "AvenirNext-Regular"
    case thin = "AvenirNext-UltraLight"
    case thinItalic = "AvenirNext-UltraLightItalic"

}

func WAKFont(type: WAKFontType ,fontSize: CGFloat) -> UIFont {
    return UIFont(name: type.rawValue as String, size: fontSize)!
}
