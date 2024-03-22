//
//  Date+Extension.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 3/22/24.
//

import Foundation

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d"
        return dateFormatter.string(from: self)
    }
}
