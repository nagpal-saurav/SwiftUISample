import Foundation
import SwiftUI

//Cell Item
public protocol MenuItem: Identifiable {
    var id: UUID  { get }
    var title: String { get }
    var image: String? { get }
    var childs: [any MenuItem]? { get }
}

//Main Category
public struct Organization: MenuItem {
    public var id = UUID()
    var name: String
    public var image: String?
    var products: [Product]?

    public var title: String {
        return name
    }
    
    public var childs: [any MenuItem]? {
        return self.products
    }
}

public struct Product: MenuItem {
    public var id = UUID()
    var name: String
    public var image: String?
    
    public var title: String {
        return name
    }
    
    public var childs: [any MenuItem]? {
        return nil
    }
}

public struct ExpandableList: View {
    public var listItems: [any MenuItem] = []
    
    public init() {
        setupListItems()
    }

    fileprivate mutating func setupListItems() {
        // setup Employee List
        let product1 = Product(name: "iPhone", image: "iphone.gen1.circle")
        let product2 = Product(name: "Apple Watch", image: "watchface.applewatch.case")
        let product3 = Product(name: "iPad", image:"ipad.gen2")
        let product4 = Product(name: "Pixel Phone", image: "candybarphone")
        let product5 = Product(name: "Galaxy Phone", image: "flipphone")
        let product6 = Product(name: "Galaxy Watch", image: "stopwatch")
        let product7 = Product(name: "Smart Ring", image: "ring.circle")
        let product8 = Product(name: "Airdopes 131", image: "airpods")
        // setup Department
        let AppleOrg = Organization(name: "Apple", products: [product1, product2, product3])
        let googleOrg = Organization(name: "Google", products: [product4])
        let samsungOrg = Organization(name: "Samsung", products: [product5, product6])
        let boatOrg = Organization(name: "Boat", products: [product7, product8])
        self.listItems = [AppleOrg, googleOrg, samsungOrg, boatOrg]
    }
    
    public var body: some View {
        List(self.listItems, id: \.id, children: \.childs) { item in
            HStack {
                if let image = item.image {
                    Image(systemName: image)
                        .frame(width: 35, height: 35)
                }
                Text(item.title)
                    .font(.system(.title3, design: .rounded))
                    .bold()
            }
        }
    }
}
