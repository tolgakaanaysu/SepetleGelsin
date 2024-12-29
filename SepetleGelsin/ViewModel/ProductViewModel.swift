import Foundation

class ProductViewModel: ObservableObject {

    //Liked Products...
    @Published var favoriteList =  [ProductModel]()

    //Shopping Cart List...
    @Published var shoppingCartList = [ProductModel]()

    //Quantity of product in the cart...
    @Published var productQuantityDict: [Int : Int] = [:]

    //Calculate Total Price...
    func calculateTotalPrice() -> String {
        var totalPrice = 0.0
        var price = 0.0

        if !shoppingCartList.isEmpty {
            shoppingCartList.forEach { product in

                price = product.price * Double(productQuantityDict[product.id]!)
                totalPrice += price
            }

        }

        return String(format: "%.2f", totalPrice)
    }
}


