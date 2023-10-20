//
//  HStackAdjustment.swift
//  SwiftUISample
//
//  Created by Saurav Nagpal on 05/10/23.
//

import Foundation
import SwiftUI

public struct HStackAdjustment: View {
    public var body: some View {
        self.screenWidthFillStack()
        
    }
    
    @ViewBuilder
    func screenWidthFillStack() -> some View {
        HStack(spacing: 0){
            Text("Baharat").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            Text("India").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            Text("Trivandrumpuram").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
    
    @ViewBuilder
    func equalWidthStack() -> some View {
        EqualWidthHStack(){
            Text("Baharat").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            Text("India").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            Text("Trivandrumpuram").frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }.fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
    }
}


struct EqualWidthHStack: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxSize = maxSize(subviews: subviews)
        let spacing = spacing(subviews: subviews)
        let totalSpacing = spacing.reduce(0.0, +)
        
        return CGSize(width: maxSize.width * CGFloat(subviews.count) + totalSpacing, height: maxSize.height)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        
        
    }
    
    fileprivate func maxSize(subviews: Subviews) -> CGSize {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        let maxSize: CGSize = subviewSizes.reduce(.zero, { result, size in
               CGSize(width: max(result.width, size.width),
                      height: max(result.height, size.height))
           })
        return maxSize
    }
    
    private func spacing(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0.0 }
            return subviews[index].spacing.distance(to: subviews[index + 1].spacing,
                                                    along: .horizontal)
        }
    }
}
