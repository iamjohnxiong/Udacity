//
//  ViewController.swift
//  FavoriteThings
//
//  Created by Jason Schatz on 11/18/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Model
    
    let favoriteThings: [String] = [
        "Hello",
        "World"
    ]

    // MARK: Table View Data Source Methods
    
    // number of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let placeholderCount = favoriteThings.count
        return placeholderCount
    }
    
    // cell for row at index path
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteThingCell")!
        cell.textLabel?.text = self.favoriteThings[indexPath.row]
        return cell
    }
}
