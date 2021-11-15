//
//  MainView.swift
//  Cinema
//
//  Created by Тест on 14.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI
import VideoPlayer
import AVKit


struct MainView: View {
    @State var play = false
    @State var movieId = "0"
    @StateObject var new = Movie()
    @StateObject var inTrend = Movie()
    @StateObject var forMe = Movie()
    @StateObject var cover = Cover()
    @StateObject var episodes = Episodes()

    @State var showMovie = false
    var body: some View {
        ZStack{
            Color("background")
       
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 0){
                ZStack{
                    WebImage(url: URL(string: "http://cinema.areas.su/up/images/\(cover.cover.first?.backgroundImage ?? "")"))
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 400)
                    VStack{
                        Spacer()
                        Button(action: {
                            showMovie.toggle()
                            movieId = cover.cover.first?.movieId ?? "0"
                        }, label: {
                            Text("Смотреть")
                                .font(.system(size: 14))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .frame(width: 134, height: 44)
                                .background(Color("red"))
                                .cornerRadius(4)
                        })
                    }
                    .padding(.bottom, 63)
                }
                .frame(width: UIScreen.main.bounds.width, height: 400)
                    HStack{
                        Text("В тренде")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color("red"))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack(spacing: 16){
                            ForEach(0..<inTrend.inTrend.count, id: \.self){item in
                                CardMovieView(image: inTrend.inTrend[item].poster)
                                    .onTapGesture{
                                        movieId = inTrend.inTrend[item].movieId
                                        showMovie.toggle()
                                    }
                            }
                        }
                        .padding(.leading, 16)
                    })
                 
                    HStack{
                        Text("Вы смотрели")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color("red"))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    ZStack{
                        Video(urlString: "http://cinema.areas.su/up/video/videoplayback%20(2).mp4")
                        .frame(width: UIScreen.main.bounds.width, height: 240)

                    }
                        
                    HStack{
                        Text("Новое")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color("red"))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack(spacing: 16){
                            ForEach(0..<new.new.count, id: \.self){item in
                                CardMovieView(image: new.new[item].poster)
                                    .onTapGesture{
                                        movieId = new.new[item].movieId
                                        showMovie.toggle()
                                    }
                            }
                        }
                        .padding(.leading, 16)
                    })
                    
                    HStack{
                        Text("Для вас")
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .foregroundColor(Color("red"))
                        Spacer()
                    }
                    .padding(.leading, 16)
                    .padding(.top, 32)
                    .padding(.bottom, 16)
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack(spacing: 16){
                            ForEach(0..<forMe.forMe.count, id: \.self){item in
                                CardMovieView(image: forMe.forMe[item].poster)
                                    .onTapGesture{
                                        movieId = forMe.forMe[item].movieId
                                        showMovie.toggle()
                                    }
                            }
                        }
                        .padding(.leading, 16)
                    })
                    Button(action: {
           
                    }, label: {
                        Text("Указать интересы")
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width - 32, height: 44)
                            .background(Color("red"))
                            .cornerRadius(4)
                    })
                    .padding(.vertical, 44)
                }
            })
            .padding(.bottom, 85)
            .fullScreenCover(isPresented: $showMovie, content: {
                MovieScreenView(movieId: $movieId, showMovie: $showMovie)
            })
        
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {

            new.getMovie(filter: "new")
            inTrend.getMovie(filter: "inTrend")
            forMe.getMovie(filter: "forMe")

            print(new.new)
            cover.getCover()
        })

    }
}



//struct CardMovieVideoView: View{
//    var video: String
//    @Binding var play: Bool
//    var body: some View{
//        ZStack{
//           VideoPlayer(url: URL(string: "http://cinema.areas.su/up/video/\(video)")!, play: $play)
//
//                .frame(width: UIScreen.main.bounds.width, height: 240)
//            Button(action: {
//                play.toggle()
//            }, label: {
//                Image(systemName: play ? "pause.fill" : "play.fill")
//                    .foregroundColor(Color("red"))
//                    .font(.system(size: 64))
//            })
//        }
//        .frame(width: UIScreen.main.bounds.width, height: 240)
//    }
//}

struct Video:UIViewControllerRepresentable {
     var urlString:String
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        
        print(urlString)
        let url = URL(string: urlString)
        let controller = AVPlayerViewController()
        
        let VideoConreoller = AVPlayer(url: url!)
        
        controller.player = VideoConreoller
        
        return controller
    }
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}

struct CardMovieView: View{
    var image: String
    var body: some View{
        ZStack{
            WebImage(url: URL(string: "http://cinema.areas.su/up/images/\(image)"))
                .resizable()
                .frame(width: 100, height: 144)
        }
        .frame(width: 100, height: 144)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
