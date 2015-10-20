//
//  ExtString.swift
//  omni
//
//  Created by Ryan on 2015/10/15.
//  Copyright © 2015年 Ryan. All rights reserved.
//

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    var isBlank: Bool {
        return ((self as? String) ?? "").isEmpty
    }
    
    var isExist: Bool {
        return !((self as? String) ?? "").isEmpty
    }
    

}