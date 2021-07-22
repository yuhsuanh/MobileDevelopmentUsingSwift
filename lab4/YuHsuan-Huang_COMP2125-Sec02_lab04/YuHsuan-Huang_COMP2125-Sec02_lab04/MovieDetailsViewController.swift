//
//  MovieDetailsViewController.swift
//  YuHsuan-Huang_COMP2125-Sec02_lab04
//
//  Created by Yu-Hsuan Huang on 2021/7/21.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieTitle: UILabel!
    
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    @IBOutlet weak var movieDirector: UILabel!
    
    @IBOutlet weak var movieRunTime: UILabel!
    
    var movieImg: UIImage!
    var movieTit: String!
    var movieRel: String!
    var movieDir: String!
    var movieTime: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieImage.image = movieImg
        movieTitle.text = movieTit
        movieReleaseDate.text = "Release Date: " + movieRel
        movieDirector.text = "Direcotr: " + movieDir
        movieRunTime.text = "Run Time: " + movieTime
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
