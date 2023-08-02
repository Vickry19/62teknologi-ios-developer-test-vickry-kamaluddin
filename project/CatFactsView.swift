//
//  CatFactsView.swift
//  project
//
//  Created by vickry on 01/08/23.
//

import SwiftUI

struct CatsFactsView: View {
    @State private var catFact: CatFacts?

    var body: some View {
        VStack {
            Text("Cat Facts")
                .font(.title)

            Spacer()

            Text(catFact?.fact ?? "")
                .padding()
                .font(.title2)
                .multilineTextAlignment(.center)
                

            Spacer()

            Button("Random Cat Fact") {
                fetchCat()
            }
        }
        .padding()
        .onAppear {
            fetchCat()
        }
    }

    func fetchCat() {
        let url = URL(string: "https://catfact.ninja/fact")!

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else {
                print("Error: Empty data")
                return
            }

            do {
                let catFact = try JSONDecoder().decode(CatFacts.self, from: data)

                DispatchQueue.main.async {
                    self.catFact = catFact
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }

        task.resume()
    }
}

struct CatsFactsView_Previews: PreviewProvider {
    static var previews: some View {
        CatsFactsView()
    }
}
