//
//  ContentView.swift
//  hw1
//
//  Created by James.Lai on 23/09/2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 25.057437, longitude: 121.509699), // 旗艦店
            span: MKCoordinateSpan(latitudeDelta: 0.00001, longitudeDelta: 0.00001) // 放大/縮小級別
        )
    @State private var showMap = false // 控制地圖顯示的布爾值
    var body: some View {
        ScrollView{
            VStack{
                ZStack(alignment: .top){
                    ZStack(alignment: .bottom){
                        Image("camera1")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom,10)
                            .cornerRadius(9)
                        Text("人生にもっと冒険を")
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                            .font(.custom("IPAPMincho", size: 24))
                            .tracking(7.5)
                            .fontWeight(.bold)
                    }
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 45)
                        //.border(.white)
                        .frame(maxWidth:.infinity,alignment:.leading)//使內層Vstack靠左
                        .padding(.leading,10)
                        
                }
                
                ExtractedPicleftView(
                    picturename: "compact",
                    title: "小巧、輕便的系統",
                    description: "攜帶更輕的裝備，拍攝靈活性更大，您可擁有更多自己表達的方式。我們輕巧的拍攝系統可讓您更快地做出反應並融入場景，讓您可以更加享受攝影的樂趣。")
                ExtractedPicleftView(
                    picturename: "stabilization",
                    title: "5 軸防震系統",
                    description: "手持拍攝清晰的相片和超流暢的 4K 影片從未如此簡單。我們的 5 軸同步防震系統，提供高達 7.5 級*快門速度補償，是世界上最有效的影像防震統。")
                ExtractedPicleftView(
                    picturename: "focusing",
                    title: "對比度檢測自動對焦",
                    description: "以完美對焦捕捉精彩瞬間。部分 OM I OM-D 相機具有相位檢測 + 對比度檢測混合式自動對焦功能。使用方便的自動對焦目標模式選項，快速鎖定主體。")
                ExtractedPicleftView(
                    picturename: "Dust_Reduction",
                    title: "減少灰塵",
                    description: "OM SYSTEM 擁有令人難以置信的除塵系統，感光元件和快門之間設有超聲波除塵系統，能以每秒 30,000 次的驚人振動頻率，振掉每一粒灰塵和污垢，讓您獲得完美影像。")
                ExtractedPicleftView(
                    picturename: "weathersealing",
                    title: "三防，更強悍。",
                    description: "抓住每一個拍攝機會，永遠不用擔心您的裝備。選擇 OM | OM-D 相機和鏡頭，它採用業界最好的 IPX1 全天候密封結構，具有防水滴、防塵和耐寒（低至 14°F／-10°C）能力。")
                
           
                

                Text("LENSES")
                    .font(.title)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .monospaced()
                    .bold()
                  
                ScrollView(.horizontal){
                    HStack{
                        ExtractedlensesView(picname: "lense8", lencesname: "M.ZUIKO DIGITAL 17MM F1.8   ")
                            .padding(.horizontal, 50)
                        ExtractedlensesView(picname: "lense2", lencesname: "M.ZUIKO DIGITAL ED 25MM F1.2 PRO")
                        ExtractedlensesView(picname: "lense3", lencesname: "M.ZUIKO DIGITAL ED 40-150MM F4.0-5.6 R")
                        ExtractedlensesView(picname: "lense4", lencesname: "M.ZUIKO DIGITAL ED 7-14MM F2.8 PRO")
                        ExtractedlensesView(picname: "lense5", lencesname: "M.ZUIKO DIGITAL ED 40-150MM F2.8 PRO")
                        ExtractedlensesView(picname: "lense6", lencesname: "M.ZUIKO DIGITAL ED 300MM F4.0 IS PRO")
                        ExtractedlensesView(picname: "lense7", lencesname: "M.ZUIKO DIGITAL ED 12-200MM F3.5-6.3")
                        ExtractedlensesView(picname: "lense1", lencesname: "M.ZUIKO DIGITAL ED 14-42MM F3.5-5.6 EZ")
                    }
                    .padding(.bottom,40)
                }
                .scrollIndicators(.hidden)
                VStack {
                    HStack{
                        Image(systemName: "link")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                            .symbolEffect(.pulse, options: .repeat(100))
                        Text("[More about Em1 Original](https://blog.mingthein.com/2013/09/10/olympus-om-d-e-m1-review-1/)")
                            .font(.system(size: 15))
                        Image(systemName: "link")
                            .resizable()
                            .frame(width: 15, height: 10)
                            .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                            .symbolEffect(.pulse, options: .repeat(100))
                    }
                    
                        Toggle(isOn: $showMap) {// 添加一個 Toggle 來控制地圖顯示與否
                            Text("Show Map")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(.horizontal,10)
                        }
                        .padding(.horizontal, 120)

                                // 根據 Toggle 的狀態來顯示或隱藏地圖
                        if showMap {
                            Map(coordinateRegion: $region)
                                .frame(height: 200)
                                .cornerRadius(15)
                                .padding(.bottom,10)
                                .padding(.horizontal,10)
                        }
                }
                Image("bottom")
                    .resizable()
                    .scaledToFit()
            }
            .frame(maxWidth: .infinity)
            //.padding()
        }
        .background(Color(#colorLiteral(red: 0.01215638034, green: 0.03203316405, blue: 0.04873348027, alpha: 1)))
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}

struct ExtractedPicleftView: View {
    let picturename: String
    let title: String
    let description: String
    
    @State private var viewOffset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Image(picturename)
                    .resizable()
                    //.scaledToFit()
                    .clipped()
                    .cornerRadius(9)
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 3)
                        .padding(.bottom, 1)
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.white,Color.brown]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                            .mask(
                                Text(title)
                                    .font(.title)
                                    .bold()
                                    .padding(.horizontal, 3)
                                    .padding(.bottom, 1)
                            ), alignment: .center
                        )
                    
                    Text(description)
                        .minimumScaleFactor(0.5)
                        .lineLimit(4)
                        .foregroundColor(Color(#colorLiteral(red: 0.9597414136, green: 0.9632393718, blue: 0.9631775022, alpha: 1)))
                        .padding(.leading, 40)
                }
                .padding(.bottom,20)
                .padding(.top,5)
            }
            .padding(.horizontal, 20)
            //.padding(.bottom, 10)
            .opacity(viewOffset > 750 ? 0 : 1)  // 控制淡入
            .offset(y: viewOffset > 750 ? 20 : 0)  // 向上滑动时的偏移
            .onAppear {
                viewOffset = geometry.frame(in: .global).minY
            }
            .onChange(of: geometry.frame(in: .global).minY) { newValue in
                viewOffset = newValue
            }
            .animation(.easeInOut(duration: 0.8), value: viewOffset)
        }
        .frame(height: 380) // 保持高度，避免图片和文字被挤压
    }
}


struct ExtractedlensesView: View {
    let picname:String
    let lencesname:String
    var body: some View {
        VStack(alignment: .center){
            Image(picname)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 200)
            Text(lencesname)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                //.tracking(2)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 30)
    }
}
