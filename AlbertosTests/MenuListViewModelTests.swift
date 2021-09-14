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
    let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingStub(returning: .success([.fixture()])), menuGrouping: spyClosure)
    let sections = try viewModel.sections.get()
    // Check that the given closure was called
    XCTAssertTrue(called)
    // Check that the returned value was built with the  // closure
    XCTAssertEqual(sections, inputSections)
  }
  
  func testWhenFetchingStartsPublishesEmptyMenu() throws {
    let viewModel = MenuList.ViewModel(menuFetching: MenuFetchingStub(returning: .success([.fixture()])))
    let sections = try viewModel.sections.get()
    XCTAssertTrue(sections.isEmpty)
  }
  
  func testWhenFetchingSucceedsPublishesSectionsBuiltFromReceivedMenuAndGivenGroupingClosure() {
    // Arrange the ViewModel and its data source
    var receivedMenu: [MenuItem]?
    let expectedSections = [MenuSection.fixture()]
    let spyClosure: ([MenuItem]) -> [MenuSection] = { items in
      receivedMenu = items
      return expectedSections
    }
    let expectedMenu = [MenuItem.fixture()]
    let menuFethcingStub = MenuFetchingStub(returning: .success(expectedMenu))
    let viewModel = MenuList.ViewModel(menuFetching: menuFethcingStub, menuGrouping: spyClosure)
    let expectation = XCTestExpectation(description: "Publishes sections built from recieved menu and grouping closure")
    // Act on the ViewModel to trigger the update
    viewModel.$sections
      .dropFirst()
      .sink { value in
        guard case .success(let sections) = value else {
          return XCTFail("Expected a successful Result, got: \(value)")
        }
        // Assert the expected behavior
        // Ensure the grouping closure is called with the recieved menu
        XCTAssertEqual(receivedMenu, expectedMenu)
        // Ensure the published value is the result of the grouping closure
        XCTAssertEqual(sections, expectedSections)
        expectation.fulfill()
      }
      .store(in: &cancellables)
      
    wait(for: [expectation], timeout: 1)
  }
  
  func testWhenFetchingFailsPublishesAnError() {
    let expectedError = TestError(id: 123)
    let menuFetchingStub = MenuFetchingStub(returning: .failure(expectedError))
    let viewModel = MenuList.ViewModel(menuFetching: menuFetchingStub) { _ in [] }
    let expectation = XCTestExpectation(description: "Publishes an error")
    viewModel
      .$sections
      .dropFirst()
      .sink { value in
        guard case .failure(let error) = value else {
          return XCTFail("Expected a failing Result, got: \(value)")
        }
        XCTAssertEqual(error as? TestError, expectedError)
        expectation.fulfill()
      }
      .store(in: &cancellables)
    
    wait(for: [expectation], timeout: 1)
    
  }
}
