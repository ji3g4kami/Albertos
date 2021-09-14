//
//  MenuFetchingStub.swift
//  AlbertosTests
//
//  Created by 登秝吳 on 14/09/2021.
//

@testable import Albertos
import Combine
import Foundation

class MenuFetchingStub: MenuFetching {
  let result: Result<[MenuItem], Error>
  init(returning result: Result<[MenuItem], Error>) {
    self.result = result
  }
  
  func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
    return result.publisher
    // Use a delay tp simulate the real world world async behavior
      .delay(for: 0.1, scheduler: RunLoop.main)
      .eraseToAnyPublisher()
  }
}
