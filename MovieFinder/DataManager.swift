//
//  DataManager.swift
//  MovieFinder
//
//  Created by Albert Avepa on 19/08/15.
//  Copyright (c) 2015 Albert Avepa. All rights reserved.
//


import Foundation
import Alamofire
import SwiftyJSON

let omdbBaseUrl = "http://www.omdbapi.com/?plot=short&r=json"
let imdbTitleBaseUrl = "http://www.imdb.com/title/"

class DataManager {
    
    class func getMoviesWithSuccess(query: String, success: (movie: Movie!) -> Void) {
        
        var url = omdbBaseUrl
        
        var parameters = ["plot":"short",
                          "r": "json",
                          "tomatoes": "true",
                          "t": query]
        
        Alamofire.request(.GET, url, parameters: parameters)
            .responseJSON {(request, response, json, error) in
                if(error != nil) {
                    NSLog("Error: \(error)")
                    println(request)
                    println(response)
                }
                else {
                    NSLog("Success: \(url)")
                    var json = JSON(json!)
                    
                    println(json)
                    
                    if json["Response"] == "False" {
                        success(movie: Movie())
                    }
                    else {
                        var movie = Movie(json: json)
                        
                        success(movie: movie)
                    }
                }
        }
    }
    
    static func openWebView(urlString: String) {
        UIApplication.sharedApplication().openURL(NSURL(string:urlString)!)
    }
    
    class func goToimdb(imdbId: String) {
        var url = imdbTitleBaseUrl + imdbId
        
        self.openWebView(url)
    }
}