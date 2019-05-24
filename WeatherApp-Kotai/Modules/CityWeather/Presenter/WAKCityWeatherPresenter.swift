//
//  WAKCityWeatherPresenter.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import CoreLocation

class WAKCityWeatherPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    var interactor: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView(coordinates: CLLocationCoordinate2D) {
        interactor?.fetchLiveWeather(coordinates: coordinates);
    }
    
    func updateView(locationName: String) {
        interactor?.fetchLiveWeather(locationName: locationName);
    }

}

extension WAKCityWeatherPresenter: InterectorToPresenterProtocol {
    
    func cityWeatherFetched(weather: WAKCityWeatherModel) {
        view?.showWeather(weather: weather);
    }
    
    func liveWeatherFetchedFailed(){
        view?.showError()
    }
}
