//
//  IPInfoView.swift
//  project
//
//  Created by vickry on 01/08/23.
//
import SwiftUI

struct IPInfoView: View {
    @State private var ipInfo: IPInfo?

    var body: some View {
        VStack {
            Text("IP Information")
                .font(.title)

            Spacer()

            if let ipInfo = ipInfo {
                Text("IP Address: \(ipInfo.ip)")
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)

                Text("Kota: \(ipInfo.city)")
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)

                Text("Wilayah: \(ipInfo.region)")
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)

                Text("Negara: \(ipInfo.country)")
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)
            } else {
                Text("Loading...")
                    .padding()
                    .font(.title2)
                    .multilineTextAlignment(.center)
            }

            Spacer()

            Button("Dapatkan IP") {
                fetchIPInfo()
            }
        }
        .padding()
        .onAppear {
            fetchIPInfo()
        }
    }

    func fetchIPInfo() {
        let url = URL(string: "https://ipinfo.io")!

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
                let ipInfo = try JSONDecoder().decode(IPInfo.self, from: data)

                DispatchQueue.main.async {
                    self.ipInfo = ipInfo
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}

struct IPInfoView_Previews: PreviewProvider {
    static var previews: some View {
        IPInfoView()
    }
}
