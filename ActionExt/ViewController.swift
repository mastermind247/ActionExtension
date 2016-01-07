//
//  ViewController.swift
//  ActionExt
//
//  Created by Parth Adroja on 1/7/16.
//  Copyright © 2016 Parth Adroja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var IBtxtView: UITextView!

    @IBAction func actionTap(sender: AnyObject) {
        
        let actVC = UIActivityViewController(activityItems: [IBtxtView.text], applicationActivities: nil)
        
        self.presentViewController(actVC, animated: true, completion: nil)
    }
}

