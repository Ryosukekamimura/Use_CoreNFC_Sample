//
//  WriteView.swift
//  UseCoreNFC
//
//  Created by 神村亮佑 on 2020/11/28.
//

import SwiftUI

struct WriteView: View {
    var reader: GeometryProxy
    var sessionWrite: NFCSessionWrite
    
    
    @Binding var isSheetPresented: Bool
    
    
    var body: some View {
        VStack{
            Text("あしあとを書きこみましよう！")
                .font(.title2)
                .foregroundColor(.orange)
                .padding()
            
            
            // Write Button
            Button(action: {
                self.sessionWrite.beginScanning()
            }, label: {
                Text("①あしあとを書きこむ")
                    .font(.title)
                    .frame(width: reader.size.width * 0.9, height: reader.size.height * 0.15)
                    .foregroundColor(.white)
                    .background(Color(.orange))
            })
            .foregroundColor(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding()
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    @State static var sessionWrite = NFCSessionWrite()
    @State static var isSheetPresented: Bool = false
    
    static var previews: some View {
        GeometryReader{ reader in
            WriteView(reader: reader, sessionWrite: sessionWrite, isSheetPresented: $isSheetPresented)
        }
    }
}
