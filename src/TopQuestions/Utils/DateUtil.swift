//
//  String+Ext.swift
//  TopQuestions
//
//  Created by Ricardo Montesinos on 21/01/22.
//

import Foundation

final class DateUtil {
    
    static func getAskedDate(from dateTime: Int?) -> String {
        guard let dateTime = dateTime else { return "" }
        let timeInterval = TimeInterval(dateTime)
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, YYYY"
        return "Asked on " + dateFormatter.string(from: date)
    }
    
}
