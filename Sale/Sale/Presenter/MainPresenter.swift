//
//  Protocol.swift
//  Sale
//
//  Created by Thai Thi Tu Trinh on 9/5/18.
//  Copyright © 2018 Trinh Thai. All rights reserved.
//

import Foundation

protocol MainViewPresenter {
    func loadDataSuccessful(state: Bool)
}

class MainPresenter {
    var delegate: MainViewPresenter!
    func LoadData() {
        RequestData.shared.request{ (success, response, error) in
            if success {
                let loadGroup = DispatchGroup()
                loadGroup.enter()
                displayData = response as? managerData
                countKindProduct = displayData!.data.category.count
                loadGroup.leave()
                loadGroup.notify(queue: DispatchQueue.main) {
                    print("loaded")
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
