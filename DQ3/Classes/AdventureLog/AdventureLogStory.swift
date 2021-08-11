//
//  AdventureLogStory.swift
//  DQ3
//
//  Created by aship on 2021/04/11.
//

import SpriteKit

class AdventureLogStory: NSObject,
                         NSCoding {
    
    init(name: String) {
        //  self.name = name
        //   self.date = date
    }
    
    func encode(with aCoder: NSCoder) {
        //   aCoder.encode(self.name, forKey: "name")
        //  aCoder.encode(self.date, forKey: "date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        // name = aDecoder.decodeObject(forKey: "name") as! String
        //   date = aDecoder.decodeObject(forKey: "date") as! String
    }
}
