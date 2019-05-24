//
//  WAKCityWeatherView.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import UIKit

class WAKCityWeatherView: UIView {

    /*---------------------------------------------------------------------
     
     //MARK: INIT
     
     ---------------------------------------------------------------------*/
    
    private var model : WAKCityWeatherModel?
    
    private var backgroundImageContainer : UIScrollView!
    private var backgroundImageView : UIImageView!
    
    private var destinationLabel : UILabel!
    
    private var tempContainerView : UIView!
    private var iconContainerView : UIView!
    private var iconImageView : UIImageView!
    private var tempLabel : UILabel!

    private var weatherDescLabel : UILabel!
    private var pressureLabel : UILabel!
    private var humidityLabel : UILabel!
    private var minTempLabel : UILabel!
    private var maxTempLabel : UILabel!
    private var windLabel : UILabel!
    private var cloudLabel : UILabel!
    
    private var imageSizeWidth: CGFloat = 0.0
    
    private var button : UIButton!
    
    private var hiddenLabels = NSMutableArray()
    
    private var kNAString : String = "n/a"
    
    private let kSampleAirPressureDivider : Double = 1013
    private let kDelayIncrement : Double = 0.025
    private let kAnimationDuration : Double = 0.2
    private let kBackgroundMinAlpha : CGFloat = 0.35
    
    convenience init(model: WAKCityWeatherModel?) {
        
        self.init(frame: SCREEN_RECT)
        
        //Setting up views
        self.backgroundColor = .black
        
        backgroundImageContainer = UIScrollView(frame: SCREEN_RECT)
        backgroundImageContainer.clipsToBounds = true
        self.addSubview(backgroundImageContainer)
        backgroundImageContainer.isUserInteractionEnabled = false
        
        backgroundImageView = UIImageView(frame: SCREEN_RECT)
        backgroundImageContainer.addSubview(backgroundImageView)
        
        let dropShadow = UIImageView(image: UIImage(named: "shadow_down"))
        dropShadow.width = SCREEN_WIDTH
        dropShadow.height = 200
        dropShadow.alpha = 0.75
        self.addSubview(dropShadow)
        
        destinationLabel = UILabel(frame: CGRect(x: 20, y: 0, width: SCREEN_WIDTH - 40, height: 50))
        destinationLabel.textAlignment = .left
        destinationLabel.adjustsFontSizeToFitWidth = true
        destinationLabel.font = WAKFont(type: .bold, fontSize: 35.0)
        destinationLabel.textColor = .white
        
        self.addSubview(destinationLabel)
        destinationLabel.insideTopEdgeBy(spacing: bottomSafeBuffer + 50)
        
        tempContainerView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 44))
        self.addSubview(tempContainerView)
        tempContainerView.x = destinationLabel.x
        tempContainerView.outsideBottomEdgeOf(view: destinationLabel, spacing: 0.0)
        
        iconContainerView = UIView(frame: CGRect(x: 0, y: 0, width: tempContainerView.height, height: tempContainerView.height))
        iconContainerView.cornerRadius = iconContainerView.height/2
        iconContainerView.backgroundColor = .white
        tempContainerView.addSubview(iconContainerView)
        
        iconImageView = UIImageView(frame: CGRect(x: 0, y: 2, width: iconContainerView.height, height: iconContainerView.height))
        iconContainerView.addSubview(iconImageView)
        
        tempLabel = UILabel(frame: CGRect(x: 20, y: 0, width: SCREEN_WIDTH, height: tempContainerView.height))
        tempLabel.font = WAKFont(type: .bold, fontSize: 24.0)
        tempLabel.textColor = .white
        tempContainerView.addSubview(tempLabel)
        tempLabel.outsideRightEdgeOf(view: iconContainerView, spacing: 10.0)
        
        weatherDescLabel = self.factoryLabel()
        self.addSubview(weatherDescLabel)
        weatherDescLabel.outsideBottomEdgeOf(view: tempContainerView, spacing: 20.0)
        
        pressureLabel = self.factoryLabel()
        self.addSubview(pressureLabel)
        pressureLabel.outsideBottomEdgeOf(view: weatherDescLabel, spacing: 0.0)
        
        humidityLabel = self.factoryLabel()
        self.addSubview(humidityLabel)
        humidityLabel.outsideBottomEdgeOf(view: pressureLabel, spacing: 0.0)
        
        minTempLabel = self.factoryLabel()
        self.addSubview(minTempLabel)
        minTempLabel.outsideBottomEdgeOf(view: humidityLabel, spacing: 0.0)
        
        maxTempLabel = self.factoryLabel()
        self.addSubview(maxTempLabel)
        maxTempLabel.outsideBottomEdgeOf(view: minTempLabel, spacing: 0.0)
        
        windLabel = self.factoryLabel()
        self.addSubview(windLabel)
        windLabel.outsideBottomEdgeOf(view: maxTempLabel, spacing: 0.0)
        
        cloudLabel = self.factoryLabel()
        self.addSubview(cloudLabel)
        cloudLabel.outsideBottomEdgeOf(view: windLabel, spacing: 0.0)
        
        button = UIButton(frame: SCREEN_RECT)
        self.addSubview(button)
        button.addTarget(self, action: #selector(self.handleButton), for: .touchUpInside)
        
        if (model != nil) { self.updateWith(model: model!) }
        
    }
    
    
    /*---------------------------------------------------------------------
     
     //MARK: FUNCTIONS
     
     ---------------------------------------------------------------------*/
    
    func updateWith(model: WAKCityWeatherModel) {
        
        self.model = model
        
        //NOTE: For purposes of making this demo look more nice I just hardcoded in some images for backgrounds
        if let countryCode = model.country {
            
            if let image = UIImage(named: "\(countryCode)") {
                
                backgroundImageView.image = image
                backgroundImageView.contentMode = .scaleAspectFill
                imageSizeWidth = backgroundImageView.image!.size.width/3
                backgroundImageView.x = 0.0
                backgroundImageView.centerYInParent()
                
            }
            
        }
        
        
        //Populate the labels with model data
        
        destinationLabel.text = model.name != nil && model.country != nil ? "\(model.name!), \(model.country!)" : kNAString
        
        let roundedTemp = model.temp != nil ? "\(String(format: "%.1f", model.temp!))\u{00B0}" : kNAString
        tempLabel.text = roundedTemp
        
        let weatherDesc = model.weatherDescription != nil ? model.weatherDescription! : kNAString
        weatherDescLabel.text = "Conditions: \(weatherDesc.capitalized)"
        
        let pressure = model.pressure != nil ? "\(model.pressure! > kSampleAirPressureDivider ? "High" : "Low")" : kNAString
        pressureLabel.text = "Pressure: \(pressure)"
        
        let humidity = model.humidity != nil ? "\(model.humidity!)%" : kNAString
        humidityLabel.text = "Humidity: \(humidity)"
        
        let roundedMinTemp = model.tempMin != nil ? "\(String(format: "%.1f", model.tempMin!))\u{00B0}" : kNAString
        minTempLabel.text = "Min temp: \(roundedMinTemp)"
        
        let roundedMaxTemp = model.tempMax != nil ? "\(String(format: "%.1f", model.tempMax!))\u{00B0}" : kNAString
        maxTempLabel.text = "Max temp: \(roundedMaxTemp)"
        
        let windSpeed = model.windSpeed != nil ? "\(String(format: "%.1f", model.windSpeed!))mph" : kNAString
        windLabel.text = "Wind: \(windSpeed)"
        
        let cloud = model.cloudCover != nil ? "\(model.cloudCover!)%" : kNAString
        cloudLabel.text = "Cloud cover: \(cloud)"
        
        
        if let weatherIcon = model.weatherIcon { iconImageView.imageFromUrl(urlString:"\(BASE_IMAGE_URL)\(weatherIcon).png", fadeIn: true)
        }
        
        
    }
    
    func factoryLabel() -> UILabel {
        
        let label = UILabel(frame: CGRect(x: 20, y: 0, width: SCREEN_WIDTH, height: 35))
        label.font = WAKFont(type: .regular, fontSize: 19.0)
        label.textColor = .white
        label.alpha = 0.0
        hiddenLabels.add(label)
        
        return label
        
    }
    
    func scrollScrollView(panPercentile: CGFloat) {
        
        backgroundImageContainer.setContentOffset(CGPoint(x: SCREEN_WIDTH * panPercentile, y: 0.0), animated: false)
    }
    
    /*---------------------------------------------------------------------
     
     //MARK: HANDLES
     
     ---------------------------------------------------------------------*/
    
    @objc func handleButton() {
        
        //Animate to show/hide the extra information
        
        button.isSelected = !button.isSelected
        
        UIView.animate(withDuration: kAnimationDuration, delay: 0.0, options: kBaseAnimationCurve , animations: {
            
            if (self.button.isSelected) {
                self.backgroundImageContainer.alpha = self.kBackgroundMinAlpha
            } else {
                self.backgroundImageContainer.alpha = 1.0
            }
            
        }, completion: {  finished in
            if (finished) {
                
            }
        }
        )
        
        let labelArray = self.button.isSelected ? hiddenLabels : NSArray(array: hiddenLabels.reversed())
        
        var increment : Int = 0
        
        for label in labelArray {
            
            if let label = label as? UILabel {
                
                if (self.button.isSelected) {
                    label.fadeIn(curve: kBaseAnimationCurve, duration: kAnimationDuration, delay: kDelayIncrement * Double(increment))
                } else {
                    label.fadeOut(curve: kBaseAnimationCurve, duration: kAnimationDuration, delay: kDelayIncrement * Double(increment))
                }
                
            }
            
            increment += 1
            
        }
        
    }

}
