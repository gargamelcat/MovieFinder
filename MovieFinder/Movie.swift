//
//  Movie.swift
//  MovieFinder
//
//  Created by Albert Avepa on 19/08/15.
//  Copyright (c) 2015 Albert Avepa. All rights reserved.
//

import UIKit
import SwiftyJSON

class Movie: NSObject {
   
    var Title: String?
    var Year: String?
    var Rated: String?
    var Released: String?
    var Runtime: String?
    var Genre: String?
    var Country: String?
    var Director: String?
    var Writer: String?
    var Actors: String?
    var Plot: String?
    var Poster: String?
    var Language: String?
    var imdbRating: String?
    var imdbID: String?
    var Response: String!
    var Error: String?
    
    override init() {
        self.Title = ""
        self.Year = ""
        self.Rated = ""
        self.Released = ""
        self.Runtime = ""
        self.Genre = ""
        self.Country = ""
        self.Director = ""
        self.Writer = ""
        self.Actors = ""
        self.Plot = ""
        self.Poster = ""
        self.Language = ""
        self.imdbRating = ""
        self.imdbID = ""
        self.Response = "False"
        self.Error = "Movie not found!"
    }
    
    init(json: JSON) {
        self.Title = json["Title"].string
        self.Year = json["Year"].string
        self.Rated = json["Rated"].string
        self.Released = json["Released"].string
        self.Runtime = json["Runtime"].string
        self.Genre = json["Genre"].string
        self.Country = json["Country"].string
        self.Director = json["Director"].string
        self.Writer = json["Writer"].string
        self.Actors = json["Actors"].string
        self.Plot = json["Plot"].string
        self.Poster = json["Poster"].string
        self.Language = json["Language"].string
        self.imdbRating = json["imdbRating"].string
        self.imdbID = json["imdbID"].string
        self.Response = json["Response"].string
        self.Error = json["Error"].string
    }
}
