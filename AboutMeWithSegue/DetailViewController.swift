//
//  ViewController.swift
//  AboutMeWithSegue
//
//  Created by Lee McCormick on 12/28/20.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    var person: Person?  {
        didSet {
            loadViewIfNeeded()
            updateView()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        // Do any additional setup after loading the view.
        
        updateView()
        
    }
    
    func updateView() {
        
        nameLabel.text = person?.name
        
        titleLabel.text = person?.title
        
        ageLabel.text = "Age: \(String(describing: person!.age))"
        
        profileImageView.image = person?.profilePicture
        
        bioLabel.text = person?.bio
        
    }
    
}

