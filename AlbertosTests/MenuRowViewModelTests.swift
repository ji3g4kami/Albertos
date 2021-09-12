//
//  MenuRowViewModelTests.swift
//  AlbertosTests
//
//  Created by 登秝吳 on 12/09/2021.
//
@testable import Albertos
import XCTest

class MenuRowViewModelTests: XCTestCase {

  func testWhenItemIsNotSpicyTextIsItemNameOnly() {
    let item = MenuItem.fixture(name: "name", spicy: false)
    let viewModel = MenuRow.ViewModel(item: item)
    XCTAssertEqual(viewModel.text, "name")
  }
  
  func testWhenItemIsSpicyTextIsItemNameWithChiliEmoji() {
    let item = MenuItem.fixture(name: "name", spicy: true)
    let viewModel = MenuRow.ViewModel(item: item)
    XCTAssertEqual(viewModel.text, "name 🌶")
  }

}
