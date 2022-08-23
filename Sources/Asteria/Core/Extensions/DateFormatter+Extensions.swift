//
//  File.swift
//  
//
//  Created by Jacob Lattie on 8/23/22.
//

import Foundation

extension DateFormatter {
    static var yyyy_mm_dd: DateFormatter { DateFormatter(dateFormat: "yyyy-MM-dd") }

    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}
