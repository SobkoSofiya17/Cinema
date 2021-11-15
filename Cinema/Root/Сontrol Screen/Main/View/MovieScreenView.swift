//
//  MovieScreenView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI
struct MovieScreenView: View {
    @Binding var movieId: String
    @Binding var showMovie: Bool
    @StateObject var episodes = Episodes()
    @StateObject var currentMovie = CurrentMovie()
    var body: some View {
        ZStack{
            Color("background")
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0){
                    ZStack{
                        WebImage(url: URL(string: "http://cinema.areas.su/up/images/\(currentMovie.movie.first?.poster ?? "")"))
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width, height: 400)
                        VStack{
                            ZStack{
                            HStack(spacing: 18){
                                Button(action: {
                                    showMovie.toggle()
                                }, label: {
                                    Image("Arrow")
                                })
                                Spacer()
                                Image(currentMovie.movie.first?.age == "18" ? "18+" : currentMovie.movie.first?.age == "16" ? "16+" : currentMovie.movie.first?.age == "12" ? "12+" : currentMovie.movie.first?.age == "6" ? "6+" : currentMovie.movie.first?.age == "0" ? "0+" : "0+")
                                Button(action: {
                                    
                                }, label: {
                                    Image("chat")
                                })
                            }
                                Text(currentMovie.movie.first?.name ?? "name")
                                    .font(.system(size: 17))
                                    .foregroundColor(Color.white)
                            }
                            .padding(.leading, 8.5)
                            .padding(.trailing, 18)
                            .padding(.top, 55)
                            Spacer()
                            
                            HStack(spacing: 9){
                                
                                ForEach(currentMovie.tags, id: \.self){ item in
                                    
                                    Text(item.tagName)
                                    .font(.system(size: 14))
                                    .foregroundColor(Color.white)
                                    .frame(height: 24)
                                    .padding(.horizontal)
                                    .background(Color.init(#colorLiteral(red: 0.9355326295, green: 0.2277310789, blue: 0, alpha: 1)))
                                    .cornerRadius(4)
                                    
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 24)
                            
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 400)
                    HStack{
                        Text("Смотреть")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.vertical, 16)
                    Video(urlString: "http://cinema.areas.su/up/video/videoplayback%20(2).mp4")
                            .frame(width: UIScreen.main.bounds.width, height: 210)

                    HStack{
                        Text("Описание")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    Text(currentMovie.movie.first?.description ?? "description")
                        .font(.system(size: 14))
                        .foregroundColor(Color.white)
                        .padding(.top, 8)
                        .padding(.horizontal, 16)
                    HStack{
                        Text("Кадры")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                  
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack{
                            ForEach(currentMovie.movie.first?.images ?? [""], id: \.self){item in
                            
                                WebImage(url: URL(string: "http://cinema.areas.su/up/images/\(item)"))
                                .resizable()
                                .frame(width: 128, height: 72)
                        
                    }
                        }
                        .padding(.horizontal, 16)
                    })
                    HStack{
                        Text("Эпизоды")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    VStack(spacing: 16){
                        ForEach(0..<episodes.episodes.count, id: \.self){item in
                        HStack(spacing: 16){
                            Video(urlString: "http://cinema.areas.su/up/video/\(episodes.episodes[item].preview)")

                                .frame(width: 128, height: 72)
                            VStack(alignment: .leading, spacing: 0){
                                Text(episodes.episodes[item].name)
                                    .font(.system(size: 14))
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                    .padding(.bottom,6)
                                Text(episodes.episodes[item].description)
                                    .lineLimit(2)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.init(#colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)))
                                    
                                Text(episodes.episodes[item].year)
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.init(#colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)))
                                    .padding(.top, 6)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    }
                    .padding(.bottom)
                }
            })
            

        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            currentMovie.getCurrentMovie(movieId: movieId)
            episodes.getEpisode(movieId: movieId)
            
            
        })
    }
}

struct MovieScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MovieScreenView(movieId: .constant("2"), showMovie: .constant(true))
    }
}
