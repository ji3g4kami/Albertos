//
//  AlbertosApp.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import SwiftUI

let menu = [
  MenuItem(category: "starters", name: "Caprese Salad", spicy: false, price: 10),
  MenuItem(category: "starters", name: "Arancini Balls", spicy: false, price: 10),
  MenuItem(category: "pastas", name: "Penne all'Arrabbiata", spicy: false, price: 10),
  MenuItem(category: "pastas", name: "Spaghetti Carbonara", spicy: false, price: 10),
  MenuItem(category: "drinks", name: "Water", spicy: false, price: 10),
  MenuItem(category: "drinks", name: "Red Wine", spicy: false, price: 10),
  MenuItem(category: "desserts", name: "Tiramisù", spicy: false, price: 10),
  MenuItem(category: "desserts", name: "Crema Catalana", spicy: false, price: 10)
]

@main
struct AlbertosApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            MenuList(sections: groupMenuByCategory(menu))
              .navigationTitle("Alberto's 🇹🇼")
          }
        }
    }
}
