//
//  CoinDeskView.swift
//  project
//
//  Created by vickry on 01/08/23.
//

import SwiftUI

struct CoinDeskView: View {
    @State private var bitcoinPrice: CoinDesk?

    var body: some View {
        VStack {
            Text("Bitcoin Price")
                .font(.title)

            Spacer()

            Text(bitcoinPrice?.bpi.USD.rate ?? "")
                .padding()
                .font(.title2)
                .multilineTextAlignment(.center)

            Spacer()

            Button("Refresh") {
                fetchBitcoinPrice()
            }
        }
        .padding()
        .onAppear {
            fetchBitcoinPrice()
        }
    }

    func fetchBitcoinPrice() {
        let url = URL(string: "https://api.coindesk.com/v1/bpi/currentprice/USD.json")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {
                print("Error: Empty data")
                return
            }

            do {
                let bitcoinPrice = try JSONDecoder().decode(CoinDesk.self, from: data)

                DispatchQueue.main.async {
                    self.bitcoinPrice = bitcoinPrice
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}


struct CoinDeskView_Previews: PreviewProvider {
    static var previews: some View {
        CoinDeskView()
    }
}
