//
//  Post.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//
import UIKit


struct Post {
    
    let title: String
}

struct PostCartoon {
    let author: String
    let description: String
    var image: UIImage
    let likes: Int
    let views: Int
}

struct Storage {
    static let tableModel = [
        PostCartoon (author: "Мэтт Гроунинг",
                 description: "«Футура́ма» — американский научно-фантастический сатирический мультсериал, созданный в студии 20th Century Fox Мэттом Грейнингом и Дэвидом Коэном, авторами мультсериала «Симпсоны». В большинстве серий действие сериала происходит в Новом Нью-Йорке в XXXI веке",
                 image: #imageLiteral(resourceName: "futurama"),
                 likes: 1245,
                 views: 5300),
        PostCartoon (author: "Сет Макфарлейн",
                 description: "«Америка́нский папаша!» — американский комедийный мультсериал производства студии «Андердог» и «Фаззи Дор» по заказу 20th Century Fox. Он был придуман и разработан, в большей степени, Сетом Макфарлейном, создателем сериала «Гриффины».",
                 image: #imageLiteral(resourceName: "American Dad"),
                 likes: 990,
                 views: 4585),
        PostCartoon (author: " Джастин Ройланд, Дэн Хармон",
                 description: "«Рик и Морти» — американский комедийный научно-фантастический анимационный сериал, созданный Джастином Ройландом и Дэном Хармоном и выпускаемый в рамках блока Adult Swim на телеканале Cartoon Network",
                 image: #imageLiteral(resourceName: "Rick and Morty"),
                 likes: 4450,
                 views: 9479),
        PostCartoon (author: "Союзмультфильм",
                 description: "Знакомьтесь, это семейство оранжевых коров: телята Бо и Зо и их родители — Мама Корова и Папа Бык. В каждой серии дети самостоятельно или с друзьями решают какую-нибудь важную проблему, а родители поддерживают их и дают полезные советы.",
                 image: #imageLiteral(resourceName: "Orange Cow"),
                 likes: 10050,
                 views: 10050)
    ]
}
