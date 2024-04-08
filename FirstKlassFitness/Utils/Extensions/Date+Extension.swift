//
//  Date+Extension.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 3/22/24.
//

import Foundation

extension Date {
    func formattedDatebyMDY() -> String {
           // Create date formatter
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMMM dd, yyyy" // Format string to represent Month, day, and year
           
           // Format date to string
           return dateFormatter.string(from: self)
       }
    
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E MMM d"
        return dateFormatter.string(from: self)
    }
    
    func formattedTime() -> String {
          let formatter = DateFormatter()
          formatter.dateFormat = "h:mma"
          return formatter.string(from: self)
      }
    
    func getWeekDay(from date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEE"
           dateFormatter.string(from: date)
           
           return date.formatted(Date.FormatStyle().weekday(.narrow))
       }
       
       func getDay(from date: Date) -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "d"
           return dateFormatter.string(from: date)
       }
}
