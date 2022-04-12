//
//  Date+Ext.swift
//  Loss Less
//
//  Created by Dicky Alamsyah on 12/04/22.
//

import Foundation

extension Date{
    func format() -> String {
        let formatter = DateFormatter()
        if Calendar.current.isDateInToday(self) {
            formatter.dateFormat = "h:mm a"
            
        } else {
            formatter.dateFormat = "dd/MM/yy"
        }
        return formatter.string(from: self)
    }
}
