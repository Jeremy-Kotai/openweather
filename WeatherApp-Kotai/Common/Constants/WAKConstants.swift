//
//  WAKConstants.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import UIKit

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_IMAGE_URL = "http://openweathermap.org/img/w/"
let BASE_UNITS = "imperial"
let API_KEY = "b40d31a0b9c4ba026c24999f7a43c3fe"

let SCREEN_WIDTH:CGFloat = UIScreen.main.bounds.size.width //Width of actual window
let SCREEN_HEIGHT:CGFloat = UIScreen.main.bounds.size.height //Height of actual window
let SCREEN_RECT:CGRect = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)

let LOCATION_MANAGER = WAKLocationManager.sharedInstance()

let kBaseAnimationDuration:Double = 0.25
let kBaseAnimationDelay:Double = 0.0
let kBaseAnimationCurve:UIView.AnimationOptions = .curveEaseInOut

/*---------------------------------------------------------------------
 
 //MARK: NOTIFICATION STRINGS
 
 ---------------------------------------------------------------------*/

let kUpdatedCurrentLocation = Notification.Name("kUpdatedCurrentLocation")
