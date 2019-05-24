//
//  WAKCityWeatherViewController.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import UIKit
import CoreLocation


class WAKCityWeatherViewController: UIViewController {

    /*---------------------------------------------------------------------
     
     //MARK: INIT
     
     ---------------------------------------------------------------------*/
    
    var presenter: ViewToPresenterProtocol?
    
    private var scrollView : UIScrollView!
    private var weatherViews = NSMutableArray()
    private var loadingLabel : UILabel!
    
    private var firstWeatherModelLoaded : Bool = false
    
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad();
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.finishedLoadingLocations), name: kUpdatedCurrentLocation, object: nil)
        
        //Setting up views
        let backgroundImageView = UIImageView(frame: SCREEN_RECT)
        backgroundImageView.image = UIImage(named: "launchGradientImage")
        backgroundImageView.contentMode = .scaleAspectFill
        self.view.addSubview(backgroundImageView)
        
        scrollView = UIScrollView(frame: SCREEN_RECT)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        
        self.showSimpleLoader()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    /*---------------------------------------------------------------------
     
     //MARK: FUNCTIONS
     
     ---------------------------------------------------------------------*/
    
    func showSimpleLoader() {
        
        loadingLabel = UILabel(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH/2, height: 30))
        loadingLabel.text = "LOADING YOUR WEATHER"
        loadingLabel.textAlignment = .center
        loadingLabel.font = WAKFont(type: .regular, fontSize: 15)
        loadingLabel.textColor = .white
        self.view.addSubview(loadingLabel)
        loadingLabel.centerInParent()
        loadingLabel.smoothJiggle()
        
    }
    
    func hideSimpleLoader() {
        
        loadingLabel.stopJiggling()
        loadingLabel.fadeOutHide()
        
    }
    
    /*---------------------------------------------------------------------
     
     //MARK: HANDLES
     
     ---------------------------------------------------------------------*/
    
    @objc func finishedLoadingLocations(notification: Notification) {
        
        if let locations = notification.object as? NSArray {
            
            for coordinates in locations {
                
                if let coordinates = coordinates as? CLLocation {
                    
                    presenter?.updateView(coordinates: coordinates.coordinate)
                    
                } else if let locationName = coordinates as? String {
                    
                    presenter?.updateView(locationName: locationName)
                    
                }
                
            }
            
        }
        
    }
    
}



extension WAKCityWeatherViewController: PresenterToViewProtocol {
    
    func showWeather(weather: WAKCityWeatherModel) {
        
        if (!firstWeatherModelLoaded) {
            firstWeatherModelLoaded = true
            self.hideSimpleLoader()
        }
        
        let weatherView = WAKCityWeatherView(model: weather)
        self.weatherViews.add(weatherView)
        scrollView.addSubview(weatherView)
        weatherView.x = scrollView.contentSize.width
        weatherView.fadeIn()
        scrollView.resizeScrollViewContentSize()

    }
    
    func showError() {
        
        if (!firstWeatherModelLoaded) {
            firstWeatherModelLoaded = true
            self.hideSimpleLoader()
        }
        
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Weather", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}


extension WAKCityWeatherViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for weatherView in weatherViews {
            
            if let weatherView = weatherView as? WAKCityWeatherView {
                
                weatherView.scrollScrollView(panPercentile: ((scrollView.contentOffset.x - weatherView.x)/SCREEN_WIDTH) * 0.5)
                
            }
            
        }
        
    }
    
}
