//
//  MenuSection+Fixture.swift
//  AlbertosTests
//
//  Created by 登秝吳 on 12/09/2021.
//

@testable import Albertos
extension MenuSection {
  static func fixture(
    category: String = "a category",
    items: [MenuItem] = [.fixture()]
  ) -> MenuSection {
    return MenuSection(category: category, items: items)
  }
}

