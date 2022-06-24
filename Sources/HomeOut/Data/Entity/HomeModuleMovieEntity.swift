//
//  File.swift
//  
//
//  Created by Putra on 15/06/22.
//

import Foundation
import RealmSwift

public class HomeModuleMovieEntity: Object {
    @Persisted var id: String
    @Persisted var title: String
    @Persisted var rating: String
    @Persisted var image: String
    @Persisted var overview: String
    @Persisted var originalLanguage: String
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}
