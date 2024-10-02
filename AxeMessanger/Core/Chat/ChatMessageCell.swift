//
//  ChatMessageCell.swift
//  AxeMessanger
//
//  Created by Alexey Larionov on 05.06.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    let isFromCurrent: Bool
    
    var body: some View {
        HStack {
            if isFromCurrent {
                Spacer()
                Text("test meassage test meassagetest meassagetest meassagetest meassagetest meassagetest meassage")
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrent))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                                
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                }
                
                Text("test meassage")
                    .font(.subheadline)
                    .padding()
                    .background(Color(.systemGray5))
                    .foregroundColor(.black)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrent))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.7, alignment: .leading)

                
                Spacer()
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrent: true)
}
