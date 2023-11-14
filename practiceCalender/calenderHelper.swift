//


import Foundation
import UIKit

class CalenderHelper {
    
    let calender = Calendar.current
    
    func plusMonth(date: Date) -> Date {
        return calender.date(byAdding: .month, value: 1, to: date)!
    }
    
    func minusMonth(date: Date) -> Date {
        return calender.date(byAdding: .month, value: -1, to: date)!
    }
    
    func monthString(date: Date) -> String {
        let formetter = DateFormatter()
        formetter.dateFormat = "MM"
        formetter.locale = Locale(identifier: "ko-KR")
        return formetter.string(from: date)
    }
    
    func yearString(date: Date) -> String {
        let formetter = DateFormatter()
        formetter.dateFormat = "yyyy"
        formetter.locale = Locale(identifier: "ko-KR")
        return formetter.string(from: date)
    }
    
    func daysInMonth(date: Date) ->  Int {
        let range = calender.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    func firstOfMonth(date: Date) -> Date {
        let components = calender.dateComponents([.year , .month] , from: date)
        return calender.date(from: components)!
    }
    
    func weekDay(date: Date) -> Int {
        let components = calender.dateComponents([.weekday], from: date)
        return components.weekday!
    }
     
}
