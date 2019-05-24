//
//  WAKProtocols.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController;
}

protocol PresenterToViewProtocol: class {
    func showWeather(weather: WAKCityWeatherModel);
    func showError();
}

protocol InterectorToPresenterProtocol: class {
    func cityWeatherFetched(weather: WAKCityWeatherModel);
    func liveWeatherFetchedFailed();
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set} ;
    func fetchLiveWeather(coordinates: CLLocationCoordinate2D);
    func fetchLiveWeather(locationName: String);
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set};
    var interactor: PresentorToInterectorProtocol? {get set};
    var router: PresenterToRouterProtocol? {get set}
    func updateView(coordinates: CLLocationCoordinate2D);
    func updateView(locationName: String);
}

