//
//  PostView.swift
//  URound-iOS
//
//  Created by Ivan Niukanen on 01.06.2022.
//

import SwiftUI


struct ListPost: View {
    var post: Post;
    
    var title: String {
        guard let Title = post.title else { return "" }
        return Title
    }
    
    var shortText: String {
        guard let text = post.shortText else { return "" }
        return text
    }
    
    var titleImageUrl: String {
        guard let url = post.images[0] else { return "" }
        return url
    }
    var namespace: Namespace.ID
    var id: String;
    var body: some View {
        ZStack {
            Color.blue
                .matchedGeometryEffect(id: "background\(id)", in: namespace)
            VStack(alignment: .leading) {
                URLImageView(url: titleImageUrl)
                    .matchedGeometryEffect(id: "titleImage\(id)", in: namespace)
                    .cornerRadius(12)
                    .padding(.top)
                Text(title)
                    .foregroundColor(.white)
                    .matchedGeometryEffect(id: "title\(id)", in: namespace)
                    .font(.title2)
                Text(shortText)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .matchedGeometryEffect(id: "main\(id)", in: namespace)
        .cornerRadius(20)
        .padding(.horizontal)
    }
}

struct FullListPost: View {
    var post: Post;
    
    var title: String {
        guard let Title = post.title else { return "" }
        return Title
    }
    
    var shortText: String {
        guard let text = post.shortText else { return "" }
        return text
    }
    
    var titleImageUrl: String {
        guard let url = post.images[0] else { return "" }
        return url
    }
    
    var namespace: Namespace.ID
    var id: String
    @State private var showFullText = false;
    @Binding var isShowing: Bool;
    var body: some View {
        ZStack {
            Color.blue
                .matchedGeometryEffect(id: "background\(id)", in: namespace)
            ScrollView {
//                LazyVStack(alignment: .leading) {
                    URLImageView(url: titleImageUrl)
                        .matchedGeometryEffect(id: "titleImage\(id)", in: namespace)
                        .cornerRadius(20)
                VStack(alignment: .leading) {
                        Text(title)
                            .foregroundColor(.white)
                            .matchedGeometryEffect(id: "title\(id)", in: namespace)
                            .font(.title)
                        if showFullText && isShowing {
                            Text(post.fullText ?? "")
                                .foregroundColor(.white)
                        }
                    }
                .padding(.horizontal)
//                }
            }
            .padding(.bottom)
        }
        .matchedGeometryEffect(id: "main\(id)", in: namespace)
        .ignoresSafeArea(edges: .top)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now()+0.2) {
                showFullText = true;
            }
        }
        .onDisappear {
            showFullText = false;
        }
    }
}

struct PostView: View {
    @Namespace private var namespace;
    var post: Post;
    
    var title: String {
        guard let Title = post.title else { return "" }
        return Title
    }
    
    var shortText: String {
        guard let text = post.shortText else { return "" }
        return text
    }
    
    var titleImageUrl: String {
        guard let url = post.images[0] else { return "" }
        return url
    }
    
    @State private var show = false;
    @State private var showFullText = false;
    var body: some View {
        ZStack {
            if !show {
                ScrollView {
                    ZStack {
                        Color.blue
                            .matchedGeometryEffect(id: "background", in: namespace)
                        VStack {
                            URLImageView(url: titleImageUrl)
                                .matchedGeometryEffect(id: "titleImage", in: namespace)
                            Text(title)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .font(.title)
                            Text(shortText)
                                .foregroundColor(.white)
                        }
                        .onTapGesture {
                            switchItems()
                        }
                    }.padding()
                }
            } else  {
                ZStack {
                    Color.blue
                        .matchedGeometryEffect(id: "background", in: namespace)
                    ScrollView() {
                        LazyVStack(alignment: .leading) {
                            URLImageView(url: titleImageUrl)
                                .matchedGeometryEffect(id: "titleImage", in: namespace)
                                .cornerRadius(20)
                            VStack {
                                Text(title)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .matchedGeometryEffect(id: "title", in: namespace)
                                if showFullText && show {
                                    Text(post.fullText ?? "")
                                        .foregroundColor(.white)
                                }
                                
                                
                            }.padding()
                        }
                    }
                    
                }
                .cornerRadius(20)
                .padding()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                        showFullText = true
                    }
                }
                .onTapGesture {
                    switchItems()
                }
            }
            
        }
    }
    func switchItems(num: Int? = nil) {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.8)) {
            show.toggle()
        }
        if show {
            showFullText = false
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(_id: "some", categories: ["asd"], title: "Today is a remarkable day for Estonia", shortText: "К сожалению, у меня нет хороших новостей для потребителей, потому что…", fullText: "К сожалению, у меня нет хороших новостей для потребителей, потому что глобально цены на энергию очень высокие, в том числе, на газ, нефтепродукты и так далее. Кроме того, в нашем регионе кончились поставки электроэнергии и газа из России\", - сказал председатель правления Eesti Energia Хандо Суттер.\"Сейчас прогнозы показывают: хорошо, если цены останутся на теперешнем уровне, а они и сейчас довольно высокие. Но предсказывать цены на энергию в нынешней ситуации, когда в Европе идет война, очень рискованно. Предвидеть что-либо на рынке энергетики можно только на очень короткое время\", - отметил вице-канцлер Министерства экономики и коммуникаций Тимо Татар.\"Даже если завтра война закончится, санкции все равно останутся, все равно Европа приняла решение отказаться от российского газа и нефти, и это толкает цены вверх. Проблема Эстонии еще в том, что мы находимся в определенном пятачке, и этот пятачок энергетический. То есть у нас есть связь с Финляндией, газовый кабель и энергокабель, и есть с Польшей, но других источников нет\", - заявил экономический эксперт Рон Лувищук.\"К счастью, у нас достаточно своих производственных мощностей, чтобы покрыть свои потребности в энергии, в том числе и зимой в самую холодную погоду. Но какой будет цена этого электричества на рынке это уже зависит от общего рынка. В хорошем положении те, у кого центральное отопление, потому что в Эстонии уже более половины объема тепла в центральном отоплении получают из биомассы, сжигаемой в котельных или на тепловых электростанциях. Это, к счастью, местный ресурс, цена на который не так сильно зависит от мирового рынка\", - пояснил Татар.Надежда на СПГ-терминал и возобновляемую энергиюEesti Energia на этой неделе рассказала о планах увеличить объемы возобновляемой энергии более чем в четыре раза за десять лет. Для этого компания инвестирует полтора миллиарда евро в ветряные парки и солнечные станции: их сочетание даст стабильную выработку электричества в любое время года. Это вряд ли утешит тех, кто с ужасом ждет наступления этой, ближайшей осени.Однако, говорит глава Eesti Energia, на самом деле доля возобновляемой энергии в Эстонии уже сейчас не так уж ничтожна. \"В Эстонии это где-то 25-30%, но по нашему прогнозу производства генерации уже в 2024 году это будет более, чем 50%. Думаю, это хорошая новость для наших потребителей\", - отметил Суттер.Но самый срочный проект по обеспечению энергетической безопасности Эстонии - это, конечно, строительство терминала по приему сжиженного природного газа. По плану все должно быть готово к 30 ноября.\"Мы готовимся к тому, что сроки строительства СПГ-терминала могут немного затянуться, потому речь идет о мировом рекорде. Так быстро такие терминалы не строятся, обычно это занимает два-три года. Эстония хочет завершить все за считанные месяцы. Так что риск есть. Для этого государство создает запас газа. Для тех, кто отапливает газом свои дома, у Elering уже есть запас, который находится в хранилище в Латвии\", - заверил Татар.Газ же, привозимый в Эстонию по морю, дороже российского не будет, заверяют эксперты: это свободный, более гибкий и мобильный рынок.\"Нет привязки к одному поставщику. Например, Болгария заключила контракт с США на поставку сжиженного газа, и он по цене дешевле, чем газ, который шел из России\", - пояснил Лувищук.Но все же сумму в счетах во многом определяет ситуация на глобальном рынке. Эксперты единодушно советуют перейти на фиксированный тариф на электричество, а также проверить, не дует ли в окна и задуматься, не тратите ли вы энергию впустую.Правительство: при выплате компенсаций нужно сосредоточиться на нуждающихсяМногим удержаться на плаву в прошлом сезоне помогли компенсации государства. К середине июня Министерство экономики и коммуникаций должно представить правительству план действий на случай, если цены на энергию взлетят до такой степени, что людям потребуется поддержка.На этой неделе премьер Кая Каллас заявила: прежняя система, когда государство покрывало всем потребителям расходы выше определенного уровня, нежизнеспособна, денег не хватит и нужно сосредоточиться только на помощи нуждающимся. Но тут возникает вопрос: а кого считать нуждающимися?\"Возможно, действительно не нужна такая абсолютная раздача денег с вертолета всем поголовно. С другой стороны, а вдруг цены взлетят в три раза еще и то, что может сейчас, при нынешнем уровне цен, средний житель Эстонии позволить себе, то тогда уже 90% людей не смогут платить за электричество и энергоносители. То есть должна быть очень большая гибкость и должны быть планы А, В и С. Говорить же, кому мы будем компенсировать, а кому нет, сейчас слишком рано\", - отметил Лувищук", images: ["https://s.err.ee/photo/crop/2022/05/29/1493698h1024t4.png"], videos: ["asda"], date: "asd", owner: PostOwner(username: "asdad"), href: "asdasd"))
    }
}
