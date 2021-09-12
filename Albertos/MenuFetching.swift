//
//  MenuFetching.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import Combine

protocol MenuFetching {
  func fetchMenu() -> AnyPublisher<[MenuItem], Error>
}
