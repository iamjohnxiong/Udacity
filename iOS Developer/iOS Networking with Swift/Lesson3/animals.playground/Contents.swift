//
//  animals.playground
//  iOS Networking
//
//  Created by Jarrod Parkes on 09/30/15.
//  Copyright (c) 2015 Udacity. All rights reserved.
//

import Foundation

/* Path for JSON files bundled with the Playground */
var pathForAnimalsJSON = Bundle.main.path(forResource: "animals", ofType: "json")

/* Raw JSON data (...simliar to the format you might receive from the network) */
var rawAnimalsJSON = try? Data(contentsOf: URL(fileURLWithPath: pathForAnimalsJSON!))

/* Error object */
var parsingAnimalsError: NSError? = nil

/* Parse the data into usable form */
var parsedAnimalsJSON = try! JSONSerialization.jsonObject(with: rawAnimalsJSON!, options: .allowFragments) as! NSDictionary

func parseJSONAsDictionary(_ dictionary: NSDictionary) {
    /* Start playing with JSON here... */
    
    /*
    guard let photosDictionary = parsedAnimalsJSON["photos"] as? NSDictionary else {
        print("Cannot find key 'photos' in \(parsedAnimalsJSON)")
        return
    }
    
    guard let numAnimalsPhotos = photosDictionary["total"] as? Int else {
        print("Cannot find key 'total' in \(photosDictionary)")
        return
    }
    
    /* How many photos are in the JSON data set? */
    print(numAnimalsPhotos)
    
    guard let arrayOfPhotoDictionaries = photosDictionary["photo"] as? [[String:AnyObject]] else {
        print("Cannot find key 'photo' in \(photosDictionary)")
        return
    }
    */
    
    guard let photosDictionary = parsedAnimalsJSON["photos"] as? [String: AnyObject] else {
        return
    }
    //print(photosDictionary)
    
    guard let photoTotal = photosDictionary["total"] as? Int else {
        return
    }
    print("Photo total: \(photoTotal)")
    
    guard let photoArray = photosDictionary["photo"] as? [[String: AnyObject]] else {
        return
    }
    //print(photoArray)
    
    for (index, photo) in photoArray.enumerated() {
        
        guard let comment = photo["comment"] as? [String: AnyObject] else {
            return
        }
        
        guard let content = comment["_content"] as? String else {
            return
        }
        
        if content.contains("interrufftion") {
            print("Interrufftion in index: \(index)")
        }
        
        if let photoURL = photo["url_m"] as? String, index == 2 {
            print(photoURL)
        }
        
    }
    
}

parseJSONAsDictionary(parsedAnimalsJSON)
