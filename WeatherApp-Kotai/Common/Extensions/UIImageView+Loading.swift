//
//  UIImageView+Loading.swift
//  WeatherApp-Kotai
//
//  Created by SkyNet on 2019-05-23.
//  Copyright © 2019 KCSI. All rights reserved.
//

import UIKit
import Alamofire

extension UIImageView {
    public func imageFromUrl(urlString: String, fadeIn: Bool) {
        Alamofire.request(urlString, method: .get)
            .validate()
            .responseData(completionHandler: { [unowned self] (responseData) in
                
                self.image = UIImage(data: responseData.data!)
                if (fadeIn) { self.fadeIn() }
                
            })
    }
}
