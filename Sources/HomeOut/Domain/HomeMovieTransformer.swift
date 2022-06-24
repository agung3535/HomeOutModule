//
//  File.swift
//  
//
//  Created by Putra on 16/06/22.
//

import Foundation
import CoreFindOut

public struct HomeMovieTransformer: Mapper {
    
    
    public typealias Response = [MovieListResult]
    
    public typealias Entity = [HomeModuleMovieEntity]
    
    public typealias Domain = [HomePlayingModel]
    
    public init(){}
    
    
    public func transformResponseToEntity(response: [MovieListResult]) -> [HomeModuleMovieEntity] {
        return response.map { result in
            let newMovie = HomeModuleMovieEntity()
            newMovie.id = "\(result.id ?? 0)"
            newMovie.title = result.title ?? ""
            newMovie.image = result.backdropPath ?? ""
            newMovie.rating = "\(result.voteAverage ?? 0.0)"
            newMovie.overview = result.overview ?? "No description"
            newMovie.originalLanguage = result.originalLanguage ?? "unknown"
            return newMovie
        }
    }
    
    public func transformEntityToDomain(entity: [HomeModuleMovieEntity]) -> [HomePlayingModel] {
        return entity.map { result in
            return HomePlayingModel(id: Int(result.id) ?? 0, title: result.title, image: result.image, rating: Double(result.rating) ?? 0.0, overview: result.overview, originalLanguage: result.originalLanguage)
        }
    }
    
    
    
   
}

