//
//  WAKBaseEntity.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation

class WAKBaseModel: NSObject {
    
    /*---------------------------------------------------------------------
     
     //MARK: INIT
     
     ---------------------------------------------------------------------*/
    
    var data = NSMutableDictionary()
    
    convenience init(dictionary : NSDictionary) {
        self.init()
        self.load(dictionary: dictionary)
    }
    
    func load(dictionary : NSDictionary) {
        
        data = NSMutableDictionary(dictionary: dictionary)
        
    }
    
    
}

