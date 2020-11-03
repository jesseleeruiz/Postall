//
//  FontsViewController.swift
//  Postall
//
//  Created by Jesse Ruiz on 11/2/20.
//

import UIKit

class FontsViewController: UITableViewController {
    
    // MARK: - Properties
    let fonts = UIFont.familyNames.sorted()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fonts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let fontName = fonts[indexPath.row]
        cell.textLabel?.text = fontName
        cell.textLabel?.font = UIFont(name: fontName, size: 18)
        return cell
    }
}
