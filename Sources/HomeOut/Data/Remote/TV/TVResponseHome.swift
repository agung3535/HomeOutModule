//
//  File.swift
//  
//
//  Created by Putra on 15/06/22.
//

import Foundation

public struct TvListResponse: Codable {
    public let page: Int?
    public let results: [TvListResult]?
    public let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

public struct TvListResult: Codable {
    public let backdropPath: String?
    public let firstAirDate: String?
    public let genreIDS: [Int]?
    public let id: Int?
    public let name: String?
    public let originCountry: [String]?
    public let originalLanguage, originalName, overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let voteAverage: Double?
    public let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genreIDS = "genre_ids"
        case id, name
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview, popularity
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
