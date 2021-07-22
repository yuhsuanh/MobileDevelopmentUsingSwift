//
//  ViewController.swift
//  YuHsuan-Huang_COMP2125-Sec02_lab04
//
//  Created by Yu-Hsuan Huang on 2021/7/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    let movieTitleList = ["The Godfather", "The Intouchables", "3 Idiots", "Back to the Future", "About Time"]
    let movieReleaseDateList = ["1972", "2011", "2009", "1985", "2013"]
    let movieImageList = ["the godfather.jpeg", "the intouchables.jpeg", "3 idiots.png", "back to the future.jpeg", "about time.jpeg"]
    let movieDirectorList = ["Francis Ford Coppola", "Olivier Nakache & Éric Toledano", "Rajkumar Hirani", "Robert Zemeckis", "Richard Curtis"]
    let movieRunTimeList = ["2h 55min", "1h 52min", "2h 50min", "1h 56min", "2h 3min"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempCell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! MovieTableViewCell
        tempCell.movieImage.image = UIImage(named: movieImageList[indexPath.row])
        tempCell.movieTitle.text = movieTitleList[indexPath.row]
        tempCell.movieReleaseDate.text = movieReleaseDateList[indexPath.row]
        
        return tempCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsViewController: MovieDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailsViewController
        movieDetailsViewController.movieImg = UIImage(named: movieImageList[indexPath.row])!
        movieDetailsViewController.movieTit = movieTitleList[indexPath.row]
        movieDetailsViewController.movieRel = movieReleaseDateList[indexPath.row]
        movieDetailsViewController.movieDir = movieDirectorList[indexPath.row]
        movieDetailsViewController.movieTime = movieRunTimeList[indexPath.row]
        
        self.navigationController?.pushViewController(movieDetailsViewController, animated: true)
        
        
    }

}

