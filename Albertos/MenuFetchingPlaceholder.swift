//
//  MenuFetchingPlaceholder.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import Combine
import Foundation

class MenuFetchingPlaceholder: MenuFetching {
  func fetchMenu() -> AnyPublisher<[MenuItem], Error> {
    return Future { $0(.success(menu)) }
      .delay(for: 0.5, scheduler: RunLoop.main) // Use a delay to simulate async fetch
      .eraseToAnyPublisher()
  }
}
