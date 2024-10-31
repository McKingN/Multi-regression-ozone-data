# Récupérer les données csv et les afficher

#Question 1
ozone <- read.csv("C:\\Users\\McKing.DESKTOP-4Q7G3QP\\Documents\\GitHub\\3A Marseille\\Multi-regression-ozone-data\\ozone.csv", sep=";")


# Afficher les noms des variables
names(ozone)

# Afficher les premières lignes de la donnée pour observer les types
head(ozone)

#Question 2
# Afficher la structure et les types des variables du jeu de données
str(ozone)

#Question3
# Représenter maxO3 en fonction de T12
plot(ozone$T12, ozone$maxO3,
     xlab = "Température à 12h (T12)",
     ylab = "Maximum d'ozone (maxO3)",
     main = "Représentation de maxO3 en fonction de T12",
     pch = 19,       # Type de point
     col = "blue")   # Couleur des points

#Question4 : Representer le maximum de lozone en fonction du vent et de la pluie.

# Représenter maxO3 en fonction du vent
boxplot(ozone$maxO3 ~ ozone$vent,
        xlab = "Vent",
        ylab = "Max O3",
        main = "Représentation de maxO3 en fonction du vent",
        col = "lightblue")

# Représenter maxO3 en fonction de la pluie
boxplot(ozone$maxO3 ~ ozone$pluie,
        xlab = "Vent",
        ylab = "Max O3",
        main = "Représentation de maxO3 en fonction du vent",
        col = "red")


# Représenter le vent en fonction de la température
boxplot(ozone$T12 ~ ozone$vent,
        xlab = "Vent",
        ylab = "Température (T12)",
        main = "Température en fonction du vent",
        col = "yellow")

#Question5 : Obtenir les statistiques descriptives du jeu de données
summary(ozone)


#Question 6
#Etape1 : 
#Le Q-Q Plot (Quantile-Quantile Plot) permet de visualiser si les données suivent une distribution normale. 
#Voici comment le créer :
# Q-Q Plot de maxO3
qqnorm(ozone$maxO3)
qqline(ozone$maxO3, col = "red")

#Étape 2 : Test de Shapiro-Wilk
#Le test de Shapiro-Wilk permet de tester l'hypothèse nulle selon laquelle les données suivent une distribution normale. 
#Voici comment le faire :
# Test de Shapiro-Wilk
shapiro_test <- shapiro.test(ozone$maxO3)

# Afficher les résultats
print(shapiro_test)

#Question7

#(a) Statistiques élémentaires
#Pour obtenir les statistiques descriptives sur maxO3 et T12, nous pouvons utiliser la commande summary :
# Statistiques élémentaires sur maxO3 et T12
summary(ozone[, c("maxO3", "T12")])

#(b) Nuage de points
#Pour représenter le nuage de points de maxO3 en fonction de T12, utilisez la commande plot :
# Nuage de points
plot(ozone$T12, ozone$maxO3, 
     xlab = "Température (T12)", 
     ylab = "Maximum d'Ozone (maxO3)", 
     main = "Nuage de Points : maxO3 vs T12")

#(c) Modèle de régression
#Pour créer un modèle de régression de maxO3 par rapport à T12, utilisez la fonction lm :
# Modèle de régression
reg1 <- lm(maxO3 ~ T12, data = ozone)

# Résumé du modèle
summary(reg1)

#Question8
reg2 <- lm(maxO3 ~ Ne12 + maxO3v, data = ozone)
summary(reg2)

#Question9
#(a)A laide de la fonction lm estimer les parametres de la regression de maxO3 sur les autres
#variables et a cher les estimateurs.
# Modèle de régression complet
regc <- lm(maxO3 ~ ., data = ozone)

# Afficher les coefficients estimés
regc$coefficients


