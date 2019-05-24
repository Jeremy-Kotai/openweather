//
//  WAKCityWeatherModel.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import UIKit

private let KEY_NAME = "name";

private let KEY_SYS = "sys";
private let KEY_SYS_COUNTRY = "country";

private let KEY_COORD = "coord";
private let KEY_COORD_LONG = "author";
private let KEY_COORD_LAT = "title";

private let KEY_WEATHER = "weather";
private let KEY_WEATHER_ID = "id";
private let KEY_WEATHER_MAIN = "main";
private let KEY_WEATHER_DESCRIPTION = "description";
private let KEY_WEATHER_ICON = "icon";

private let KEY_MAIN = "main";
private let KEY_MAIN_TEMP = "temp";
private let KEY_MAIN_PRESSURE = "pressure";
private let KEY_MAIN_HUMIDITY = "humidity";
private let KEY_MAIN_TEMP_MIN = "temp_min";
private let KEY_MAIN_TEMP_MAX = "temp_max";

private let KEY_WIND = "wind";
private let KEY_WIND_SPEED = "speed";
private let KEY_WIND_DEGREES = "deg";

private let KEY_CLOUDS = "clouds";
private let KEY_CLOUDS_ALL = "all";

private var windLabel : UILabel!
private var cloudLabel : UILabel!

class WAKCityWeatherModel: WAKBaseModel {

    
    /*---------------------------------------------------------------------
     
     //MARK: PRIVATE
     
     ---------------------------------------------------------------------*/
    
    private var coord : NSDictionary {
        
        get {
            if let sys = data[KEY_COORD] as? NSDictionary {
                return sys
            } else { return NSDictionary() }
        }
        
    }
    
    private var weather : NSDictionary {
        
        get {
            if let weatherArray = data[KEY_WEATHER] as? NSArray { //weather comes in array
                
                //Just going to return the first object of the weather array for this demo
                if let weather = weatherArray.firstObject as? NSDictionary {
                    return weather
                } else { return NSDictionary() }

            } else { return NSDictionary() }
            
        }
        
    }
    
    private var sys : NSDictionary {
        
        get {
            if let sys = data[KEY_SYS] as? NSDictionary {
                return sys
            } else { return NSDictionary() }
        }
        
    }
    
    private var main : NSDictionary {
        
        get {
            if let main = data[KEY_MAIN] as? NSDictionary {
                return main
            } else { return NSDictionary() }
        }
    }
    
    private var wind : NSDictionary {
        
        get {
            if let wind = data[KEY_WIND] as? NSDictionary {
                return wind
            } else { return NSDictionary() }
        }
    }
    
    private var clouds : NSDictionary {
        
        get {
            if let clouds = data[KEY_CLOUDS] as? NSDictionary {
                return clouds
            } else { return NSDictionary() }
        }
    }
    
    /*---------------------------------------------------------------------
     
     //MARK: GETTERS / SETTERS
     
     ---------------------------------------------------------------------*/
    
    var name : String? {
        
        get { return data[KEY_NAME] as? String }
        
    }
    
    var country : String? {
        
        get { return sys[KEY_SYS_COUNTRY] as? String }
        
    }
    
    var long : Double? {
        
        get { return coord[KEY_COORD_LONG] as? Double }
        
    }
    
    var lat : Double? {
        
        get { return coord[KEY_COORD_LAT] as? Double }
        
    }
    
    var weatherId : Int? {
        
        get { return weather[KEY_WEATHER_ID] as? Int }
        
    }
    
    var weatherMain : String? {
        
        get { return weather[KEY_WEATHER_MAIN] as? String }
        
    }
    
    var weatherDescription : String? {
        
        get { return weather[KEY_WEATHER_DESCRIPTION] as? String }
        
    }
    
    var weatherIcon : String? {
        
        get { return weather[KEY_WEATHER_ICON] as? String }
        
    }
    
    var temp : Double? {
        
        get { return main[KEY_MAIN_TEMP] as? Double }
        
    }
    
    var tempMin : Double? {
        
        get { return main[KEY_MAIN_TEMP_MIN] as? Double }
        
    }
    
    var tempMax : Double? {
        
        get { return main[KEY_MAIN_TEMP_MAX] as? Double }
        
    }
    
    var pressure : Double? {
        
        get { return main[KEY_MAIN_PRESSURE] as? Double}
        
    }
    
    var humidity : Int? {
        
        get { return main[KEY_MAIN_HUMIDITY] as? Int}
        
    }
    
    var cloudCover : Int? {
        
        get { return clouds[KEY_CLOUDS_ALL] as? Int }
        
    }
    
    var windSpeed : Double? {
        
        get { return wind[KEY_WIND_SPEED] as? Double }
        
    }
    
    var windDeg : Double? {
        
        get { return wind[KEY_WIND_DEGREES] as? Double }
        
    }
    
}
