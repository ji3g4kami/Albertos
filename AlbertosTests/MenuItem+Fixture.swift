//
//  MenuItem+Fixture.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

@testable import Albertos
extension MenuItem {
  static func fixture(
    category: String = "category",
    name: String = "name",
    spicy: Bool = false,
    price: Double = 10
  ) -> MenuItem {
    MenuItem(category: category, name: name, spicy: spicy, price: price)
  }
}
