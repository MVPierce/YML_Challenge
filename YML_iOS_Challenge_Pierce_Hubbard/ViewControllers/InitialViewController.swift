//
//  ViewController.swift
//  YML_iOS_Challenge_Pierce_Hubbard
//
//  Created by Pierce on 4/20/18.
//  Copyright © 2018 Pierce. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    var currentUser: UserViewModel?
    
    let manager = APIManager()
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var searchResponseLabel: UILabel!
    
    let errorText = "Yikes! We couldn't find that GitHub username. Please check and try again!"
    
    let searchingText = "Searching for followers..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchResponseLabel.isHidden = true
        
        manager.delegate = self
        manager.getGitHubData(for: "MVPierce")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension InitialViewController: APIManagerDelegate {
    func errorWithGETRequest() {
        print("Error with API GET request")
    }
    func userRetrieved(user: GitHubUser) {
        self.currentUser = UserViewModel(with: user)
    }
    func followersRetrieved(followers: [GitHubUser]) {
        self.currentUser?.followingUsers = followers
    }
}
