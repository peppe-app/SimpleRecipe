//
//  Recipe+Mock.swift
//  SimpleRecipe
//
//  Created by Giuseppe Sapienza on 15/3/2024.
//

import Foundation

extension Recipe {
    static func mocks() -> [Recipe] {
        [
            Recipe(
                title: "Pasta alla Carbonara",
                description: "Autentico piatto di pasta italiano fatto con uova, formaggio, guanciale e pepe nero.",
                time: 900, // 15 minuti
                ingredients: [
                    Ingredient(name: "Spaghetti", quantity: "400g"),
                    Ingredient(name: "Uova", quantity: "4"),
                    Ingredient(name: "Guanciale", quantity: "200g"),
                    Ingredient(name: "Parmigiano", quantity: "100g"),
                    Ingredient(name: "Pepe Nero", quantity: "A piacere"),
                    Ingredient(name: "Sale", quantity: "A piacere")
                ],
                steps: [
                    RecipeStep(description: "Portare a ebollizione una grande pentola d'acqua salata."),
                    RecipeStep(description: "Cuocere gli spaghetti secondo le istruzioni della confezione fino a che sono al dente."),
                    RecipeStep(description: "In una padella separata, cuocere la guanciale fino a renderla croccante. Togliere dal fuoco e mettere da parte."),
                    RecipeStep(description: "In una ciotola, sbattere insieme le uova, il formaggio Parmigiano grattugiato e il pepe nero."),
                    RecipeStep(description: "Una volta cotta la pasta, scolarla e rimetterla nella pentola mentre è ancora calda."),
                    RecipeStep(description: "Versare immediatamente il composto di uova sulla pasta calda e mescolare rapidamente per rivestirla. Il calore della pasta cuocerà le uova, creando una salsa cremosa."),
                    RecipeStep(description: "Aggiungere la guanciale cotta alla pasta e mescolare per combinare."),
                    RecipeStep(description: "Condire con sale e altro pepe nero a piacere."),
                    RecipeStep(description: "Servire caldo, guarnendo con ulteriore formaggio Parmigiano e pepe nero se desiderato.")
                ]
            )
        ]
    }
}
