//
//  File.swift
//  
//
//  Created by Putra on 15/06/22.
//

import Foundation
import CoreFindOut
import Combine
import Kingfisher

public struct HomeModuleMovieRepo<HomeMovieLocaleDataSource: LocaleDataSourceCore, HomeRemoteDataSource: RemoteDataSourceCore, Transformer: Mapper>: Repository where HomeMovieLocaleDataSource.Response == HomeModuleMovieEntity, HomeRemoteDataSource.Response == [MovieListResult], Transformer.Response == [MovieListResult], Transformer.Entity == [HomeModuleMovieEntity], Transformer.Domain == [HomePlayingModel] {
    
    public typealias Request = Any
    public typealias Response = [HomePlayingModel]
    
    private let localeDataSource: HomeMovieLocaleDataSource
    private let remoteDataSource: HomeRemoteDataSource
    private let mapper: Transformer
    
    public init(localeDataSource: HomeMovieLocaleDataSource, remoteDataSource: HomeRemoteDataSource, mapper: Transformer) {
        self.mapper = mapper
        self.remoteDataSource = remoteDataSource
        self.localeDataSource = localeDataSource
    }
    
    public func execute(request: Any?) -> AnyPublisher<[HomePlayingModel], Error> {
        return localeDataSource.list(request: nil)
            .flatMap { result -> AnyPublisher<[HomePlayingModel], Error> in
                if result.isEmpty {
                    return remoteDataSource.execute(request: nil)
                        .map { mapper.transformResponseToEntity(response: $0)}
                        .catch { _ in localeDataSource.list(request: nil)}
                        .flatMap({ self.localeDataSource.add(entities: $0)})
                        .flatMap { _ in localeDataSource.list(request: nil)
                                .map { mapper.transformEntityToDomain(entity: $0)}
                        }.eraseToAnyPublisher()
                }else {
                    return localeDataSource.list(request: nil)
                        .map { mapper.transformEntityToDomain(entity: $0)}
                        .eraseToAnyPublisher()
                }
            }.eraseToAnyPublisher()
    }
    
}
