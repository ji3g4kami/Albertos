//
//  AlbertosApp.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import SwiftUI

let menu = [
  MenuItem(category: "starters", name: "Caprese Salad"),
  MenuItem(category: "starters", name: "Arancini Balls"),
  MenuItem(category: "pastas", name: "Penne all'Arrabbiata"),
  MenuItem(category: "pastas", name: "Spaghetti Carbonara"),
  MenuItem(category: "drinks", name: "Water"),
  MenuItem(category: "drinks", name: "Red Wine"),
  MenuItem(category: "desserts", name: "Tiramisù"),
  MenuItem(category: "desserts", name: "Crema Catalana")
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
