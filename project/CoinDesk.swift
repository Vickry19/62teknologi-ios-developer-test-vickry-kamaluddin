//
//  CoinDesk.swift
//  project
//
//  Created by vickry on 01/08/23.
//

import Foundation

struct CoinDesk: Codable {
    var bpi: BPI
}

struct BPI: Codable {
    var USD: BitcoinInfo
}

struct BitcoinInfo: Codable {
    var rate: String
}
