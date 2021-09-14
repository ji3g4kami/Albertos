//
//  MenuList.swift
//  Albertos
//
//  Created by 登秝吳 on 12/09/2021.
//

import SwiftUI
import Combine
import Foundation

struct MenuList: View {
  @ObservedObject var viewModel: ViewModel
  var body: some View {
    switch viewModel.sections {
    case .success(let sections):
      List {
        ForEach(sections) { section in
          Section(header: Text(section.category)) {
            ForEach(section.items) { item in
              MenuRow(viewModel: .init(item: item))
            }
          }
        }
      }
    case .failure(let error):
      VStack {
        Text("An error ocurred:")
        Text(error.localizedDescription).italic()
      }
    }
  }
}

extension MenuList {
  class ViewModel: ObservableObject {
    @Published var sections: Result<[MenuSection], Error> = .success([])
    private var cancellables = Set<AnyCancellable>()
    
    init(menuFetching: MenuFetching,
         menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
      menuFetching.fetchMenu()
        .map(menuGrouping)
        .sink { [weak self] completion in
          guard case .failure(let error) = completion else { return }
          self?.sections = .failure(error)
        } receiveValue: { [weak self] sections in
          self?.sections = .success(sections)
        }
        .store(in: &cancellables)

    }
  }
}
