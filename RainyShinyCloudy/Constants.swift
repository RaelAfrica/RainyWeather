//
//  Constants.swift
//  RainyShinyCloudy
//
//  Created by Rael Kenny on 4/26/17.
//  Copyright © 2017 Rael Kenny. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "93f0aa8885a2f8643392546b0d481c64"

typealias DownloadComplete = () -> ()

let current_weather_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"


