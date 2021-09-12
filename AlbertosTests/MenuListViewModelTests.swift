//
//  MenuList.swift
//  AlbertosTests
//
//  Created by 登秝吳 on 12/09/2021.
//

@testable import Albertos
import XCTest
import Combine

class MenuListViewModelTests: XCTestCase {
  
  var cancellables = Set<AnyCancellable>()
  
  func testCallsGivenGroupingFunction() throws {
    try XCTSkipIf(true, "skipping this for now, keeping it to release part of the code later on")
    var called = false
    let inputSections = [MenuSection.fixture()]
    let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
      called = true
      return inputSections
    }
    let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder(), menuGrouping: spyClosure)
    let sections = viewModel.sections
    // Check that the given closure was called
    XCTAssertTrue(called)
    // Check that the returned value was built with the  // closure
    XCTAssertEqual(sections, inputSections)
  }
  
  func testWhenFetchingStartsPublishesEmptyMenu() {
    let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder())
    XCTAssertTrue(viewModel.sections.isEmpty)
  }
  
  func testWhenFetchingSucceedsPublishesSectionsBuiltFromReceivedMenuAndGivenGroupingClosure() {
    // Arrange the ViewModel and its data source
    var receivedMenu: [MenuItem]?
    let expectedSections = [MenuSection.fixture()]
    let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
      receivedMenu = menu
      return expectedSections
    }
    let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingPlaceholder(), menuGrouping: spyClosure)
    let expectation = XCTestExpectation(description: "Publishes sections built from recieved menu and grouping closure")
    // Act on the ViewModel to trigger the update
    viewModel.$sections
      .dropFirst()
      .sink { value in
        // Assert the expected behavior
        // Ensure the grouping closure is called with the recieved menu
        XCTAssertEqual(receivedMenu, menu)
        // Ensure the published value is the result of the grouping closure
        XCTAssertEqual(value, expectedSections)
        expectation.fulfill()
      }
      .store(in: &cancellables)
      
    wait(for: [expectation], timeout: 1)
  }
  
  func testWhenFetchingFailsPublishesAnError() {
    
  }
}
