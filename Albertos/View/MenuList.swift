//
//  MenuList.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import SwiftUI
import Combine

struct MenuList: View {
  @ObservedObject var viewModel: ViewModel
  var body: some View {
    List {
      ForEach(viewModel.sections) { section in
        Section(header: Text(section.category)) {
          ForEach(section.items) { item in
            MenuRow(viewModel: .init(item: item))
          }
        }
      }
    }
  }
}

extension MenuList {
  class ViewModel: ObservableObject {
    @Published private(set) var sections: [MenuSection]
    private var cancellables = Set<AnyCancellable>()
    init(menuFetching: MenuFetching,
         menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
      self.sections = []
      menuFetching.fetchMenu()
        .sink { _ in
          
        } receiveValue: { [weak self] menuItems in
          self?.sections = menuGrouping(menuItems)
        }
        .store(in: &cancellables)

    }
  }
}
