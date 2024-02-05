//
//  WorkoutDetailView.swift
//  FirstKlassFitness
//
//  Created by Alandis Seals on 2/4/24.
//

import SwiftUI

struct WorkoutDetailView: View {
    var body: some View {
        VStack{
            ScrollView {
                AsyncImage(url: URL(string: "https://images.pexels.com/photos/2014422/pexels-photo-2014422.jpeg?auto=compress&cs=tinysrgb&h=650&w=940")) { image in
                    image
                        .resizable()
                        .frame(width: .infinity ,height: 500)
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                
                Text("Est accusantium amet nam ipsam blanditiis ut voluptatibus dolorem. Eos obcaecati natus id perferendis quibusdam et explicabo omnis ab asperiores reprehenderit non libero dolore qui ullam dolorum et praesentium quia. Aut voluptatibus dignissimos et error sapiente hic ratione molestiae. Quo internos illo non quae sint nam nihil velit ex provident necessitatibus hic minima aliquam aut quas consectetur et quibusdam ratione.")
                    .font(.system(size: 18, weight: .medium))
                    .multilineTextAlignment(.leading)
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WorkoutDetailView()
}
