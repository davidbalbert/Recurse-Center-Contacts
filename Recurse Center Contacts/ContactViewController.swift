//
//  ContactViewController.swift
//  Recurse Center Contacts
//
//  Created by David Albert on 9/2/18.
//  Copyright © 2018 David Albert. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet var name: UILabel!
    var contact: Contact!

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = contact.name
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let navBar = navigationController!.navigationBar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        let navBar = navigationController!.navigationBar
        navBar.setBackgroundImage(nil, for: .default)
        navBar.shadowImage = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
