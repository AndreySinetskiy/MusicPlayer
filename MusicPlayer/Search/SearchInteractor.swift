//
//  SearchInteractor.swift
//  MusicPlayer
//
//  Created by 1 on 06.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
  func makeRequest(request: Search.Model.Request.RequestType)
}

class SearchInteractor: SearchBusinessLogic {
    
    var networkService = NetworkService()
    var presenter: SearchPresentationLogic?
    var service: SearchService?
    
    func makeRequest(request: Search.Model.Request.RequestType) {
        if service == nil {
            service = SearchService()
        }
        
        switch request {
        case .some:
            print("interactor.some")
        case .getTracks(let searchTerm):
            print("interactor.getTracks")
            networkService.fetchTracks(searchText: searchTerm) { [weak self ] searchResponse in
                self?.presenter?.presentData(response: .presentTracks(searchResponse: searchResponse))
            }
            
        }
    }
    
}
