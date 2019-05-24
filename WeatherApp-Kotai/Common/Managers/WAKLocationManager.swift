//
//  WAKLocationManager.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import CoreLocation

private let _locationManager : WAKLocationManager = { WAKLocationManager() }()

class WAKLocationManager: NSObject, CLLocationManagerDelegate {
    
    /*---------------------------------------------------------------------
     
     //MARK: INIT
     
     ---------------------------------------------------------------------*/
    
    private var locationManager: CLLocationManager?
    
    private var currentLocation : CLLocation?
    
    var locations = NSMutableArray(array: [
        "London",
        "Tokyo"
        ])
    
    class func sharedInstance() -> WAKLocationManager {
        return _locationManager
    }
    
    func startLocationManager() {
        
        locationManager = CLLocationManager()
        locationManager!.delegate = self
        
        // Check for Location Services
        if CLLocationManager.locationServicesEnabled() {
            locationManager!.requestWhenInUseAuthorization()
            locationManager!.startUpdatingLocation()
        }
        
    }
    
    func stopLocationManager() {
        
        if (locationManager != nil) {
            locationManager!.stopUpdatingLocation()
        }
        
    }
    
    /*---------------------------------------------------------------------
     
     //MARK: CLLOCATIONMANAGER DELEGATE
     
     ---------------------------------------------------------------------*/
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if currentLocation == nil {
            
            if let location = locations.last {
                
                currentLocation = location
                
                self.locations.insert(currentLocation!, at: 0)
                NotificationCenter.default.post(name: kUpdatedCurrentLocation, object: self.locations)
                
                //We only need the current location once so let's turn off lm for energy conservatino
                self.stopLocationManager()
                
            }
            
        }

    }
    
    /*---------------------------------------------------------------------
     
     //MARK: FUNCTIONS
     
     ---------------------------------------------------------------------*/
    
    func locationFor(index: Int) -> CLLocationCoordinate2D? {
        return locations[index] as? CLLocationCoordinate2D ?? nil
    }
    
}
