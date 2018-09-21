//
//  SearchResultsPresenter.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import Foundation

protocol SearchResultsViewPresenter {
    func convertToOriginalData(state: Bool)
    func loadDataSuccessful(state: Bool)
}

class SearchResultsPresenter {
    var delegate: SearchResultsViewPresenter!
    func LoadData() {
        RequestData.shared.request{ (success, response, error) in
            if success {
                let loadGroup = DispatchGroup()
                loadGroup.enter()
                displayData = response as? managerData
                self.delegate.convertToOriginalData(state: true)
              
                loadGroup.leave()
                loadGroup.notify(queue: DispatchQueue.main) {
                    print("successfully")
                }
                self.delegate.loadDataSuccessful(state: true)
            } else {
                if let error = error {
                    print(error)
                }
            }
        }
    }
}
