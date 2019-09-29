//
//  DailySummary.swift
//  CSV
//
//  Created by Michael Charland on 2019-09-29.
//

import Foundation

struct DailySummary: Decodable {
    let date: String
    let energy: Float
    let water: Float
    let b1: Float
    let b2: Float
    let b3: Float
    let b5: Float
    let b6: Float
    let b12: Float
    let alphaCarotene: Float
    let beta: Float
    let betaCarotene: Float
    let betaCryptoxanthin: Float
    let choline: Float
    let delta: Float
    let folate: Float
    let luteinZeaxanthin: Float
    let lycopene: Float
    let retinol: Float
    let retinolActivityEquivalent: Float
    let vitaminA: Float
    let vitaminC: Float
    let vitaminD: Float
    let vitaminE: Float
    let vitaminK: Float
    let calcium: Float
    let copper: Float
    let iron: Float
    let magnesium: Float
    let manganese: Float
    let molybdenum: Float?
    let phosphorus: Float
    let potassium: Float
    let selenium: Float
    let sodium: Float
    let zinc: Float
    let carbs: Float
    let fiber: Float
    let fructose: Float
    let galactose: Float
    let glucose: Float
    let lactose: Float
    let maltose: Float
    let starch: Float
    let sucrose: Float
    let sugars: Float
    let netCarbs: Float
    let fat: Float
    let cholesterol: Float
    let monounsaturated: Float
    let omega3: Float
    let omega6: Float
    let phytosterol: Float?
    let polyunsaturated: Float
    let saturated: Float
    let transFats: Float
    let alanine: Float
    let arginine: Float
    let aspartic: Float
    let cystine: Float
    let glutamic: Float
    let glycine: Float
    let histidine: Float
    let hydroxyproline: Float?
    let isoleucine: Float
    let leucine: Float
    let lysine: Float
    let methionine: Float
    let phenylalanine: Float
    let proline: Float
    let protein: Float
    let serine: Float
    let threonine: Float
    let tryptophan: Float
    let tyrosine: Float
    let valine: Float
    let completed: Bool

    enum CodingKeys : String, CodingKey {
        case date = "Date"
        case energy = "Energy (kcal)"
        case water = "Water (g)"
        case b1 = "B1 (Thiamine) (mg)"
        case b2 = "B2 (Riboflavin) (mg)"
        case b3 = "B3 (Niacin) (mg)"
        case b5 = "B5 (Pantothenic Acid) (mg)"
        case b6 = "B6 (Pyridoxine) (mg)"
        case b12 = "B12 (Cobalamin) (µg)"
        case alphaCarotene = "Alpha-carotene (µg)"
        case beta = "Beta Tocopherol (mg)"
        case betaCarotene = "Beta-carotene (µg)"
        case betaCryptoxanthin = "Beta-cryptoxanthin (µg)"
        case choline = "Choline (mg)"
        case delta = "Delta Tocopherol (mg)"
        case folate = "Folate (µg)"
        case luteinZeaxanthin = "Lutein+Zeaxanthin (µg)"
        case lycopene = "Lycopene (µg)"
        case retinol = "Retinol (µg)"
        case retinolActivityEquivalent = "Retinol Activity Equivalent (µg)"
        case vitaminA = "Vitamin A (IU)"
        case vitaminC = "Vitamin C (mg)"
        case vitaminD = "Vitamin D (IU)"
        case vitaminE = "Vitamin E (mg)"
        case vitaminK = "Vitamin K (µg)"
        case calcium = "Calcium (mg)"
        case copper = "Copper (mg)"
        case iron = "Iron (mg)"
        case magnesium = "Magnesium (mg)"
        case manganese = "Manganese (mg)"
        case molybdenum = "Molybdenum (µg)"
        case phosphorus = "Phosphorus (mg)"
        case potassium = "Potassium (mg)"
        case selenium = "Selenium (µg)"
        case sodium = "Sodium (mg)"
        case zinc = "Zinc (mg)"
        case carbs = "Carbs (g)"
        case fiber = "Fiber (g)"
        case fructose = "Fructose (g)"
        case galactose = "Galactose (g)"
        case glucose = "Glucose (g)"
        case lactose = "Lactose (g)"
        case maltose = "Maltose (g)"
        case starch = "Starch (g)"
        case sucrose = "Sucrose (g)"
        case sugars = "Sugars (g)"
        case netCarbs = "Net Carbs (g)"
        case fat = "Fat (g)"
        case cholesterol = "Cholesterol (mg)"
        case monounsaturated = "Monounsaturated (g)"
        case omega3 = "Omega-3 (g)"
        case omega6 = "Omega-6 (g)"
        case phytosterol = "Phytosterol (mg)"
        case polyunsaturated = "Polyunsaturated (g)"
        case saturated = "Saturated (g)"
        case transFats = "Trans-Fats (g)"
        case alanine = "Alanine (g)"
        case arginine = "Arginine (g)"
        case aspartic = "Aspartic acid (g)"
        case cystine = "Cystine (g)"
        case glutamic = "Glutamic acid (g)"
        case glycine = "Glycine (g)"
        case histidine = "Histidine (g)"
        case hydroxyproline = "Hydroxyproline (g)"
        case isoleucine = "Isoleucine (g)"
        case leucine = "Leucine (g)"
        case lysine = "Lysine (g)"
        case methionine = "Methionine (g)"
        case phenylalanine = "Phenylalanine (g)"
        case proline = "Proline (g)"
        case protein = "Protein (g)"
        case serine = "Serine (g)"
        case threonine = "Threonine (g)"
        case tryptophan = "Tryptophan (g)"
        case tyrosine = "Tyrosine (g)"
        case valine = "Valine (g)"
        case completed = "Completed"
    }
}


