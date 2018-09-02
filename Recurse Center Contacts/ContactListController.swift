//
//  ViewController.swift
//  Recurse Center Contacts
//
//  Created by David Albert on 9/1/18.
//  Copyright © 2018 David Albert. All rights reserved.
//

import UIKit

class ContactListController: UITableViewController {
    var contacts: [String: [Contact]] = [:]
    var sections: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        contacts = makeContacts()
        sections = contacts.keys.sorted()
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    // replace with array.randomElement() in Swift 4.2
    func randomElement<T>(_ a: Array<T>) -> T {
        let i = Int(arc4random_uniform(UInt32(a.count)))
        return a[i]
    }

    func makeContacts() -> [String: [Contact]] {
        let path = Bundle.main.path(forResource: "nouns", ofType: "txt")!
        let nouns = try! String(contentsOfFile: path).split(separator: "\n")

        let cs = (0...999).map { _ in
            Contact(firstName: String(randomElement(nouns)), lastName: String(randomElement(nouns)))

        }

        return Dictionary(grouping: cs, by: {
            String($0.lastName.first!).uppercased()
        }).mapValues { $0.sorted() }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return contacts[sections[section]]!.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if let l = cell.textLabel {
            let c = contact(for: indexPath)
            l.attributedText = displayName(c, withSize: l.font.pointSize)
        }

        return cell
    }

    func displayName(_ contact: Contact, withSize size: CGFloat) -> NSAttributedString {
        let s = NSMutableAttributedString(string: "\(contact.firstName) ", attributes: [
            .font: UIFont.systemFont(ofSize: size)
            ])

        let formattedLastName = NSMutableAttributedString(string: contact.lastName, attributes: [
            .font: UIFont.boldSystemFont(ofSize: size)
            ])

        s.append(formattedLastName)

        return s
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cvc = segue.destination as! ContactViewController
        cvc.contact = contact(for: tableView.indexPathForSelectedRow!)
    }

    func contact(for indexPath: IndexPath) -> Contact {
        return contacts[sections[indexPath.section]]![indexPath.row]
    }
}

