// Invoice.java
// Invoice class that adopts the Payable protocol
import Foundation
// In the protocols, classes are disimilar..there need not be any similarity between the classes.
// public class Invoice : Payable, Printable {
open class Invoice : Payable {
    let partNumber: String!
    let partDescription: String!
    var quantity: Int!
    var price: NSDecimalNumber!
    
    // initializer
    public init?(partNumber: String, partDescription: String,
        quantity: Int, price: NSDecimalNumber) {
            
        if partNumber.isEmpty || partDescription.isEmpty ||
            quantity < 0 || (price.compare(NSDecimalNumber.zero) ==
            ComparisonResult.orderedAscending) {
            return nil
        }
        
        self.partNumber = partNumber
        self.partDescription = partDescription
        self.quantity = quantity
        self.price = price
    }
    
    // conform to the Payable protocol
    open var paymentAmount: NSDecimalNumber {
        let quantity = NSDecimalNumber(string: self.quantity.description)
        return quantity.multiplying(by: price)
    }
    
    // conform to the Printable protocol
    open var description: String {
        let pricePerItem = NumberFormatter.localizedString(
            from: price, number: .currency)
        return String(format: "%@:\n%@: %@ (%@) \n%@: %d\n%@: %@",
            "Invoice", "Part number", partNumber, partDescription,
            "Quantity", quantity, "Price per item", pricePerItem)
    }
} 
