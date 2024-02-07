//
//  ViewModel.swift
//  WeatherApp
//
//  Created by Melbin Mathew on 07/02/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var weatherDetails: Weather?
    
    func getData() async {
        async let weather = APIManager.shared.getWeatherData(location: "Delhi,India")
        
        self.weatherDetails = try? await weather
        print(self.weatherDetails ?? "")
    }
}
