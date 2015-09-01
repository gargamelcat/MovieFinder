//
//  ViewController.swift
//  MovieFinder
//
//  Created by Albert Avepa on 19/08/15.
//  Copyright (c) 2015 Albert Avepa. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var plotLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var runtimeLabels: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var metaLabel: UILabel!
    @IBOutlet weak var ratingView: UIView!
    
    @IBOutlet weak var imdbButton: UIButton!
    
    var query: String = ""
    
    var movieMatch = Movie()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.updateViews()
        
        self.titleLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateViews() {
        if  self.movieMatch.Response == "False" {
            self.titleLabel.text = self.movieMatch.Error
            self.plotLabel.text = ""
            self.metaLabel.text = ""
            self.directorLabel.text = ""
            self.actorsLabel.text = ""
            self.runtimeLabels.text = ""
            self.rating.text = ""
            
            self.posterImageView.image = nil
            self.ratingView.hidden = true
            
            self.imdbButton.hidden = true
        }
        else {
            self.titleLabel.text = self.movieMatch.Title
            self.plotLabel.text = self.movieMatch.Plot
            self.metaLabel.text = self.getMetaString(self.movieMatch)
            self.directorLabel.text = self.movieMatch.Director
            self.actorsLabel.text = self.movieMatch.Actors
            self.runtimeLabels.text = self.movieMatch.Runtime
            self.rating.text = self.movieMatch.imdbRating
            
            self.ratingView.hidden = false
            
            self.imdbButton.hidden = false

            if let checkedUrl = NSURL(string: self.movieMatch.Poster!) {
                self.downloadImage(checkedUrl)
            }
        }
    }
    
    func getMetaString(movie: Movie) -> String {
        var string = ""
        
        string += movie.Year! + " - "
        string += movie.Country! + " - "
        string += movie.Genre!
        
        return string
    }
    
    
    // MARK: Image Download Methods
    
    func getDataFromUrl(urL:NSURL, completion: ((data: NSData?) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(urL) { (data, response, error) in
            completion(data: data)
            }.resume()
    }
    
    func downloadImage(url:NSURL){
        getDataFromUrl(url) { data in
            dispatch_async(dispatch_get_main_queue()) {
                self.posterImageView.image = UIImage(data: data!)
            }
        }
    }
    
    
    // MARK: SearchBarDelegate
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        query = searchText
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        DataManager.getMoviesWithSuccess(query, success: { (movie) -> Void in
            
            self.movieMatch = movie as Movie
            
            self.updateViews()
            
        })
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
        self.searchBar.text = ""
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = false
    }

    // MARK: buttons delegates
    
    @IBAction func imdbButtonClicked(sender: AnyObject) {
        DataManager.goToimdb(self.movieMatch.imdbID!)
    }

}