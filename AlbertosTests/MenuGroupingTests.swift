//
//  MenuGroupingTests.swift
//  AlbertosTests
//
//  Created by 登秝吳 on 12/09/2021.
//

import XCTest
@testable import Albertos

class MenuGroupingTests: XCTestCase {
  
  /// Q: Where should we start writing the test?
  /// A: From the assertion that will pass once the behavior is implemented.
  func testEmptyMenuReturnsEmptySection() {
    // Arrange the input: an empty menu
    let menu = [MenuItem]()
    
    let sections = groupMenuByCategory(menu)
    XCTAssertTrue(sections.isEmpty)
  }

  func testMenuWithManyCategoriesReturnsOneSectionPerCategory() {
    let menu: [MenuItem] = [
      .fixture(category: "pastas"),
      .fixture(category: "pastas")
    ]
    let sections = groupMenuByCategory(menu)
    XCTAssertEqual(sections.count, 1)
  }
  
  func testMenuWithOneCategoryReturnsOneSection() throws {
    let menu = [
      MenuItem.fixture(category: "pastas", name: "name"),
      MenuItem.fixture(category: "pastas", name: "other name")
    ]
    
    let sections = groupMenuByCategory(menu)
    XCTAssertEqual(sections.count, 1)
    
    let section = try XCTUnwrap(sections.first)
    XCTAssertEqual(section.items.count, 2)
    XCTAssertEqual(section.items.first?.name, "name")
    XCTAssertEqual(section.items.last?.name, "other name")
  }
  
  /// Given a menu with meny categories, returns as many sections,
  /// in reverse alphabetical order
  func test_groupMenyByCategories_MenuWithManyCategories_ReturnsAsManySectionsInReverseAlphabeticalOrder() {
    let menu: [MenuItem] = [
      .fixture(category: "pastas"),
      .fixture(category: "drinks"),
      .fixture(category: "pastas"),
      .fixture(category: "desserts")
    ]
    
    let sections = groupMenuByCategory(menu)
    XCTAssertEqual(sections.count, 3)
    XCTAssertEqual(sections[safe: 0]?.category, "pastas")
    XCTAssertEqual(sections[safe: 1]?.category, "drinks")
    XCTAssertEqual(sections[safe: 2]?.category, "desserts")
  }
  
  

}
