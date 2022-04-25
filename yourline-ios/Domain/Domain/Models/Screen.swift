import Foundation
import Utility

public struct Screen: Decodable {
    
    // MARK: Configuration properties
    let id: String?
    let title: String?
    let sections: [Rows]?
    let type: String?
    
    // MARK: Content
    
    let content: String?
    let headerImage: String?
    let headerText: String?
    let footerImage: String?
    let footerText: String?
    
    // MARK: UI properties
    
    let topContentInset: PaddingSize?
    let bottomContentInset: PaddingSize?
    let hasSeparators: Bool?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case sections
        case content
        case type
        case headerImage = "header_image"
        case headerText = "header_text"
        case footerImage = "footer_image"
        case footerText = "footer_text"
        case topContentInset = "top_content_inset"
        case bottomContentInset = "bottom_content_inset"
        case hasSeparators = "has_seperators"
    }
    
    public func updateSections(_ sections: [Rows]?) -> Screen {
        
        return self.updateValues(id: nil, title: nil, sections: sections, content: nil, type: nil, headerImage: nil, headerText: nil, footerImage: nil, footerText: nil, topContentInset: nil, bottomContentInset: nil, hasSeparators: nil)
    }
    
    public func updateValues(id: String?, title: String?, sections: [Rows]?, content: String?, type: String?, headerImage: String?, headerText: String?, footerImage: String?, footerText: String?, topContentInset: PaddingSize?, bottomContentInset: PaddingSize?, hasSeparators: Bool?) -> Screen {
        
        
        return Screen(
            id: id ?? self.id,
            title: title ?? self.title,
            sections: sections ?? self.sections,
            type: type ?? self.type,
            content: content ?? self.content,
            headerImage: headerImage ?? self.headerImage,
            headerText: headerText ?? self.headerText,
            footerImage: footerText ?? self.footerImage,
            footerText: footerText ?? self.footerText,
            topContentInset: topContentInset ?? self.topContentInset,
            bottomContentInset: bottomContentInset ?? self.bottomContentInset,
            hasSeparators: hasSeparators ?? self.hasSeparators
        )
    }
}
