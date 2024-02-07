//
//  ContentView.swift
//  WeatherApp
//
//  Created by Melbin Mathew on 07/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeScreenView(viewModel: ViewModel())
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
