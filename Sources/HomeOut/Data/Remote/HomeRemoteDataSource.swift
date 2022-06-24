//
//  File.swift
//  
//
//  Created by Putra on 15/06/22.
//

import Foundation
import CoreFindOut
import Combine
import Alamofire

public struct HomeRemoteDataSource: RemoteDataSourceCore {
    
    public typealias Request = Any
    
    public typealias Response = [MovieListResult]
    
    private let endPoint: String
    
    public init(endPoint: String) {
        self.endPoint = endPoint
    }
    
    public func execute(request: Any?) -> AnyPublisher<[MovieListResult], Error> {
        return Future<[MovieListResult], Error> { completion in
            if let url = URL(string: endPoint) {
                AF.request(url)
                    .validate()
                    .responseDecodable(of: MovieHomeResponse.self, completionHandler: { response in
                        switch response.result {
                        case .success(let value):
                            completion(.success(value.results ?? []))
                        case .failure:
                            completion(.failure(URLError.invalidResponse))
                        }
                    })
            }
        }.eraseToAnyPublisher()
    }
    
}
