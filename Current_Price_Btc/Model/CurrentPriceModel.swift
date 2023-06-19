// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let currentPriceModel = try? JSONDecoder().decode(CurrentPriceModel.self, from: jsonData)

import Foundation

// MARK: - CurrentPriceModel
struct CurrentPriceModel: Codable {
    let time: Time?
    let disclaimer, chartName: String?
    let bpi: Bpi?
}

// MARK: - Bpi
struct Bpi: Codable {
    let usd, gbp, eur: Currency?

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
        case gbp = "GBP"
        case eur = "EUR"
    }
}

// MARK: - Eur
struct Currency: Codable {
    let code, symbol, rate, description: String?
    let rateFloat: Double?

    enum CodingKeys: String, CodingKey {
        case code, symbol, rate, description
        case rateFloat = "rate_float"
    }
}

// MARK: - Time
struct Time: Codable {
    let updated: String?
    let updatedISO: String? // Change the type to String

    // Add a computed property to convert the string to a Date
    var updatedISODate: Date? {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: updatedISO ?? "")
    }

    let updateduk: String?
}
