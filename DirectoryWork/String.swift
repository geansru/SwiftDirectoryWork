//
//  String.swift
//  DirectoryWork
//
//  Created by Dmitriy Roytman on 09.10.15.
//  Copyright © 2015 Dmitriy Roytman. All rights reserved.
//

import Foundation

extension String {
    func stringByAppendingPathComponent(path: String) -> String {
        
        let nsSt = self as NSString
        
        return nsSt.stringByAppendingPathComponent(path)
    }
}