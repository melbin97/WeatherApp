//
//  HomeScreenView.swift
//  WeatherApp
//
//  Created by Melbin Mathew on 07/02/24.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            if let weather = viewModel.weatherDetails {
                ScrollView {
                    VStack(alignment: .center) {
                        if let url = URL(string: weather.current?.condition?.url ?? "")  {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                VStack {}
                            }
                        }
                        Text("\(weather.current?.tempC ?? 0)°C")
                            .font(.largeTitle)
                        Text(weather.current?.condition?.text ?? "")
                            .font(.title3)
                            .multilineTextAlignment(.center)
                        Text((weather.location?.name ?? "") + ", " + (weather.location?.country ?? ""))
                            .font(.title3)
                    }
                    .padding()
                    .background (
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.ultraThinMaterial)
                            .shadow(color: .black.opacity(0.2), radius: 1, x: 0, y: 1)
                    )
                }
                .refreshable {
                    Task {
                        await viewModel.getData()
                    }
                }
                Spacer()
                Text("last updated on " + (weather.current?.lastUpdated ?? ""))
                    .font(.subheadline)
                    .foregroundStyle(Color.gray)
            }
        }
        .frame(maxWidth: .infinity)
        .background(
            Image("misty")
                .resizable()
                .visualEffect({ effect, _ in
                    effect.blur(radius: 2)
                })
                .ignoresSafeArea(.all, edges: .all)
        )
        .task {
            await viewModel.getData()
        }
    }
}

#Preview {
    HomeScreenView(viewModel: ViewModel())
}
