//
//  WAKCityWeatherRouter.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import Foundation
import UIKit

class WAKCityWeatherRouter: PresenterToRouterProtocol {
    
    class func createModule() -> UIViewController {
        
        let view = WAKCityWeatherViewController()
        
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = WAKCityWeatherPresenter();
        let interactor: PresentorToInterectorProtocol = WAKCityWeatherInteractor()
        let router: PresenterToRouterProtocol = WAKCityWeatherRouter()
        
        view.presenter = presenter;
        presenter.view = view;
        presenter.router = router;
        presenter.interactor = interactor;
        interactor.presenter = presenter;
        
        return view;
        
    }
    
}
