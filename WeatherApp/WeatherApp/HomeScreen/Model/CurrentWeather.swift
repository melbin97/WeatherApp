//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Melbin Mathew on 07/02/24.
//

import Foundation

struct Weather: Codable {
    let location: Location?
    let current: CurrentWeather?
}

struct Location: Codable {
    let name: String?
    let region: String?
    let country: String?
}

struct CurrentWeather: Codable {
    let lastUpdated: String?
    let humidity: Int?
    let feelslikeC: Int?
    let tempC: Int?
    let condition: CurrentCondition?
}

struct CurrentCondition: Codable {
    let text: String?
    let icon: String?
    let code: Int?
    
    var url: String {
        return "https:" + (icon ?? "")
    }
}
