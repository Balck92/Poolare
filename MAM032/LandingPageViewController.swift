//
//  LandingPageViewController.swift
//  MAM032
//
//  Created by Michal Stypa on 2016-11-12.
//  Copyright © 2016 test. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {
    
    @IBOutlet weak var loginButtonOutlet: UIButton!
    @IBOutlet weak var signUpButtonOutlet: UIButton!
    
    @IBOutlet var webBG: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let htmlPath = Bundle.main.path(forResource: "CarPoolersGif", ofType: "html")
        let htmlURL = URL(fileURLWithPath: htmlPath!)
        let html = try? Data(contentsOf: htmlURL)
        webBG.isUserInteractionEnabled = false
        
        self.webBG.load(html!, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: htmlURL.deletingLastPathComponent())
        
        setViewProperties()

        // Do any additional setup after loading the view.
    }

    private func setViewProperties(){
        loginButtonOutlet.layer.cornerRadius = 5
        loginButtonOutlet.layer.masksToBounds = true
        signUpButtonOutlet.layer.cornerRadius = 5
        signUpButtonOutlet.layer.masksToBounds = true
    }


}
