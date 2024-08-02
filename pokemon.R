Pokemon<-read.csv("E:/kiran jangili/Data analysis/Datasets/Pokemon.csv")
View(Pokemon)

#checking for number of rows and columns
nrow(Pokemon)
ncol(Pokemon)

#tabulation of categorical columns
table(Pokemon$is_legendary)
table(Pokemon$generation)
table(Pokemon$type1)
table(Pokemon$type2)


#min-max HP

min(Pokemon$hp)
max(Pokemon$hp)

#min-max Speed
min(Pokemon$speed)
max(Pokemon$speed)


#checking for null values

is.na(Pokemon$abilities)
sum(is.na(Pokemon$abilities))


#Renaming Column Names

colnames(Pokemon)[colnames(Pokemon)=='type1'] <-"Primary_type"
colnames(Pokemon)[colnames(Pokemon)=='type2'] <-"Secondary_type"
colnames(Pokemon)[colnames(Pokemon)=='name'] <-"Pokemon_name"


#grass-Pokemon
library(dplyr)

Pokemon %>% 
  filter(Primary_type== "grass") -> grass_pokemon
View(grass_pokemon)

min(grass_pokemon$speed) #10
max(grass_pokemon$speed) #145

mean(grass_pokemon$sp_attack) #74.32051
mean(grass_pokemon$sp_defense) #69.23077

#Visualizing stats of grass Pokemon
library(ggplot2)

ggplot(data=grass_pokemon , aes(x=hp))+geom_histogram(fill="palegreen4")

#height

ggplot(data=grass_pokemon , aes(x=height_m))+geom_histogram()

#weight

ggplot(data=grass_pokemon , aes(x=weight_kg))+geom_histogram()


#legendary vs non_legendary

ggplot(data=grass_pokemon , aes(x=is_legendary))+geom_bar()


# fire Pokemon

Pokemon %>%
  filter(Primary_type=='fire')-> fire_pokemon
View(fire_pokemon)

min(fire_pokemon$speed) #20
max(fire_pokemon$speed) #126

mean(fire_pokemon$sp_attack)  #87
mean(fire_pokemon$sp_defense)  #71

#visualization of grass pokemon

ggplot(data=fire_pokemon , aes(x=hp))+geom_histogram(fill='orange1')

#generation

ggplot(data=fire_pokemon, aes(x=generation ,fill=as.factor(generation)))+ geom_bar()

#secondary_type

ggplot(data=fire_pokemon , aes(x=Secondary_type, fill = Secondary_type))+geom_bar()

#sp_attack vs sp_defence

ggplot(data=fire_pokemon, aes(x=sp_attack,y=sp_defense))+geom_point(col='coral')

#height vs weight

ggplot(data=fire_pokemon, aes(x=height_m,y=weight_kg))+geom_point(col='orange1')


#water pokemon

Pokemon %>%
  filter(Primary_type=='water')-> water_pokemon
View(water_pokemon)

#min-max speed

min(water_pokemon$speed)  #5
max(water_pokemon$speed)  #132

#mean sp

mean(water_pokemon$sp_attack) #74
mean(water_pokemon$sp_defense) #71

#visualization of water pokemon

#against ice 

ggplot(data=water_pokemon,aes(x=against_ice))+geom_histogram()

#against poison

ggplot(data=water_pokemon,aes(x=against_poison))+geom_histogram()

#against grass

ggplot(data=water_pokemon,aes(x=against_grass))+geom_histogram()

#physchic pokemon

Pokemon %>%
  filter(Primary_type=='psychic')-> psychic_pokemon
View(psychic_pokemon)

#min-max sp

min(psychic_pokemon$sp_attack)  #23
max(psychic_pokemon$sp_defense) #154

#min -max speed

min(psychic_pokemon$speed) #20
max(psychic_pokemon$speed) #180

#Visualizing psychic pokemon

ggplot(data=psychic_pokemon,aes(x=base_total))+geom_histogram(fill='hotpink')

ggplot(data = psychic_pokemon, aes(x=as.factor(generation), y=sp_defense , fill = generation))+geom_boxplot()

ggplot(data=psychic_pokemon,aes(x=is_legendary))+geom_bar()
