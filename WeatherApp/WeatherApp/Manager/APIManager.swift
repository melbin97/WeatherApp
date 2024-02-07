//
//  APIManager.swift
//  WeatherApp
//
//  Created by Melbin Mathew on 07/02/24.
//

import Foundation

class APIManager {
    private init() {}
    static let shared = APIManager()
    
    func getWeatherData(location: String) async throws -> Weather? {
        var components: URLComponents = URLComponents()
        components.scheme =  "https"
        components.host = "api.weatherapi.com"
        components.path = "/v1/current.json"
        
        components.queryItems = [URLQueryItem]()
        components.queryItems?.append(URLQueryItem(name: "key", value: "a31d4229743b4cccbff82321240702"))
        components.queryItems?.append(URLQueryItem(name: "q", value: "\(location)"))
        
        guard let url = components.url else { return nil }
        var req = URLRequest(url: url)
        req.httpMethod = "get"
        let (data, response) = try await URLSession.shared.data(for: req)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return try? decoder.decode(Weather.self, from: data)
    }
}
