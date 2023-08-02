//
//  ContentView.swift
//  project
//
//  Created by vickry on 01/08/23.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.purple , .green, .gray]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).ignoresSafeArea()
                
                VStack {
                    Text("IOS Random APP")
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    VStack(spacing: 13) {
                        NavigationLink(
                            destination: JokeView(),
                            label: {
                                Text("Jokes")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 200, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.purple)
                                    .cornerRadius(30)
                            })
                        
                        NavigationLink(
                            destination: predictview(),
                            label: {
                                Text("Predict")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 200, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(30)
                                
                    })
                    
                        
                        NavigationLink(
                            destination: CoinDeskView(),
                            label: {
                                Text("Coin Desk")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 200, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(30)
                                
                    })
                        
                        NavigationLink(
                            destination: CatsFactsView(),
                            label: {
                                Text("Cat Facts")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 200, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color  .orange)
                                    .cornerRadius(30)
                                
                    })
                        
                        NavigationLink(
                            destination: IPInfoView(),
                            label: {
                                Text("IP Info")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                    .frame(width: 200, height: 60)
                                    .foregroundColor(.white)
                                    .background(Color.green)
                                    .cornerRadius(30)
                                
                    })
                    
                }
            }
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
