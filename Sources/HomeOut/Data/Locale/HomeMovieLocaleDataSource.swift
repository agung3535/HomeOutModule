//
//  File.swift
//  
//
//  Created by Putra on 15/06/22.
//

import Foundation
import Combine
import RealmSwift
import CoreFindOut

public struct HomeMovieLocaleDataSource: LocaleDataSourceCore {
    
    
    
    
    
    public typealias Request = Any
    public typealias Response = HomeModuleMovieEntity
    
    private let realm: Realm
    
    public init(realm: Realm) {
        self.realm = realm
    }
    
    public func list(request: Any?) -> AnyPublisher<[HomeModuleMovieEntity], Error> {
        return Future<[HomeModuleMovieEntity], Error> { completion in
//            if let realm = self.realm {
                let moviePlay = realm.objects(HomeModuleMovieEntity.self)
                completion(.success(moviePlay.toArray(ofType: HomeModuleMovieEntity.self)))
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
        }.eraseToAnyPublisher()
    }
                                    
                                   
    public func add(entities: [HomeModuleMovieEntity]) -> AnyPublisher<Bool, Error> {
        return Future<Bool, Error> { completion in
//            if let realm = self.realm {
                do {
                    try realm.write {
                        for data in entities {
                            realm.add(data, update: .all)
                        }
                        completion(.success(true))
                    }
                }catch {
                    completion(.failure(DatabaseError.requestFailed))
                }
//            }else {
//                completion(.failure(DatabaseError.invalidInstance))
//            }
        }.eraseToAnyPublisher()
    }
    
    public func cek(id: String) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
                                    
    public func get(id: String) -> AnyPublisher<HomeModuleMovieEntity, Error> {
       fatalError()
    }
                                    
    public func update(id: Int, entity: HomeModuleMovieEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    public func delete(object: HomeModuleMovieEntity) -> AnyPublisher<Bool, Error> {
        fatalError()
    }
    
    
    
    
}
