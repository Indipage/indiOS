//
//  DetailTagModel.swift
//  PPPCLUB-iOS
//
//  Created by 박윤빈 on 2023/07/10.
//

import Foundation

struct Tag {
    let tagList: [String]
}

extension Tag {
    static func dummy() -> Tag {
        return Tag(tagList: ["# 독립서점", "# 인문학", "# 홍대인근"])
    }
}