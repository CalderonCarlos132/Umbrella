//
//  GlobalCache.swift
//  Umbrella
//
//  Created by Carlos C. on 10/23/17.
//  Copyright © 2017 UmbrellaCorp. All rights reserved.
//

import UIKit

class GlobalCache{
    static let shared = GlobalCache()
    var imageCache = NSCache<NSString,UIImage>()
}
