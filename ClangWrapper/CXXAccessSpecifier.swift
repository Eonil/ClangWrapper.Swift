//
//  CXXAccessSpecifier.swift
//  ClangWrapper
//
//  Created by Hoon H. on 2015/01/21.
//  Copyright (c) 2015 Eonil. All rights reserved.
//



public enum CXXAccessSpecifier {
	case InvalidAccessSpecifier
	case Public
	case Protected
	case Private
}

extension CXXAccessSpecifier: CustomStringConvertible {
	public var description:String {
		get {
			switch self {
			case .InvalidAccessSpecifier:	return	"InvalidAccessSpecifier"
			case .Public:					return	"Public"
			case .Protected:				return	"Protected"
			case .Private:					return	"Private"
			}
		}
	}
}

internal extension CXXAccessSpecifier {
	init(raw: CX_CXXAccessSpecifier) {
		self	=	select(raw)
	}
	var	raw:CX_CXXAccessSpecifier {
		get {
			switch self {
			case InvalidAccessSpecifier:	return	CX_CXXInvalidAccessSpecifier
			case Public:					return	CX_CXXPublic
			case Protected:					return	CX_CXXProtected
			case Private:					return	CX_CXXPrivate
			}
		}
	}
}




private func select(v:CX_CXXAccessSpecifier) -> CXXAccessSpecifier {
	switch v.rawValue {
	case CX_CXXInvalidAccessSpecifier.rawValue:		return	CXXAccessSpecifier.InvalidAccessSpecifier
	case CX_CXXPublic.rawValue:						return	CXXAccessSpecifier.Public
	case CX_CXXProtected.rawValue:						return	CXXAccessSpecifier.Protected
	case CX_CXXPrivate.rawValue:						return	CXXAccessSpecifier.Private
	default:
		fatalError("Unknown value for `CX_CXXAccessSpecifier` enum.")
	}
}
