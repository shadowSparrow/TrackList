//
//  DetailViewController.swift
//  TrackList
//
//  Created by mac on 24.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageCover: UIImageView!
    @IBOutlet weak var trackTitleLabel: UILabel!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageCover.image = UIImage(named: track.title)
        
        trackTitleLabel.text = track.title
        
        
        // Do any additional setup after loading the view.
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
