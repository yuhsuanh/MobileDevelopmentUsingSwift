// UtilityFunctions.Swift
// Locale-specific currency and percentage formatting functions
import Foundation
// Some code from objective-c is still used and supported in Swift
// Whenever you prefix NS, then it means it from objective-c
// Cocoa touch classes are written objective-c
// convert a numeric value to localized percent string
public func formatAsPercent(_ number: NSNumber) -> String {
    let percentFormatter = NumberFormatter()
    percentFormatter.numberStyle = .percent
    percentFormatter.minimumFractionDigits = 2
    percentFormatter.locale = Locale.current
    return percentFormatter.string(from: number)!
}

// convert a numeric value to localized currency string
func formatAsCurrency(_ number: NSNumber) -> String {
    return NumberFormatter.localizedString(
        from: number, number: .currency)
}

