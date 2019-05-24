//
//  WAKCityWeatherInteractor.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class WAKCityWeatherInteractor: PresentorToInterectorProtocol{
    
    var presenter: InterectorToPresenterProtocol?
    
    func fetchLiveWeather(coordinates: CLLocationCoordinate2D) {
        
        let url = "\(BASE_URL)lat=\(coordinates.latitude)&lon=\(coordinates.longitude)&appid=\(API_KEY)&units=\(BASE_UNITS)"
        
        self.alamoRequest(url: url)
        
    }
    
    func fetchLiveWeather(locationName: String) {
        
        let url = "\(BASE_URL)q=\(locationName)&appid=\(API_KEY)&units=\(BASE_UNITS)"
        
        self.alamoRequest(url: url)
        
    }
    
    func alamoRequest(url: String) {
        
        Alamofire.request(url).responseJSON { response in
            
            if(response.response?.statusCode == 200){
                
                if let dictionary = response.result.value as? NSDictionary {
                    
                    let model = WAKCityWeatherModel(dictionary: dictionary)
                    self.presenter?.cityWeatherFetched(weather: model)
                    
                }
            }
            else {
                
                if (response.error != nil) { print("Response error: \(response.error!)") }
                print("Response error: \(response.response)")
                self.presenter?.liveWeatherFetchedFailed();
            }
        }
        
    }
}
