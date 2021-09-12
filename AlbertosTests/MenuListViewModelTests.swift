//
//  MenuList.swift
//  AlbertosTests
//
//  Created by 登秝吳 on 12/09/2021.
//

@testable import Albertos
import XCTest

class MenuListViewModelTests: XCTestCase {
  func testCallsGivenGroupingFunction() {
    var called = false
    let inputSections = [MenuSection.fixture()]
    let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
      called = true
      return inputSections
    }
    let viewModel = MenuList.ViewModel(menu: [.fixture()], menuGrouping: spyClosure)
    let sections = viewModel.sections
    // Check that the given closure was called
    XCTAssertTrue(called)
    // Check that the returned value was built with the closure
    XCTAssertEqual(sections, inputSections)
  }
    

}
