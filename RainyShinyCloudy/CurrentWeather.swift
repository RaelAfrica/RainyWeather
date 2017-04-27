//
//  CurrentWeather.swift
//  RainyShinyCloudy
//
//  Created by Rael Kenny on 4/26/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String{
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }

    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //alamofire download
        let currentWeatherURL = URL(string: current_weather_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, Any> {
                
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                
                if let weather = dict["weather"] as? [Dictionary<String, Any>]{
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                
                if let main = dict["main"] as? Dictionary<String, Any>{
                    if let currentTemperature = main["temp"] as? Double {
                        
                        let celsiusTemp = currentTemperature - 273.15
                        
//                        let kelvinToFarenheitPreDivision = (currentTemperature * 9/5 - 459.67)
                        
//                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDivision/10))
                        
//                        let farenheitToCelius = (kelvinToFarenheit * 1.8 + 32)
                        
                        self._currentTemp = celsiusTemp
                        print(self._currentTemp)
                        
                    }
                }
            
                
            
            
            }
            
            
            
            //print(response)
            //Parse the response
            //Assign it to some array?
            
            
            
            DispatchQueue.main.async {
                completed()
           }
        }
        
    }
    
}
