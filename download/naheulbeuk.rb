class Pj
  attr_accessor :origine, :métier, :ev, :ea, :pr, :cou, :int, :cha, :ad, :fo, :comp1; :comp2
  
  def initialize(origine,métier,ev,ea,pr,cou,int,cha,ad,fo,comp1,comp2)
    @origine = origine
    @métier = métier
    @ev = ev
    @ea = ea
    @pr = pr
    @cou = cou
    @int = int
    @cha = cha
    @ad = ad
    @fo = fo
    @comp1 = comp1
    @comp2 = comp2
  end
  
  def magie
    if @métier == "Mage/Sorcier"
      puts "Energie astrale = " + @ea
      puts "Vous pouvez choisir une spécialité parmi les suivantes en plus de la magie généraliste:"
      puts "Magie de l'air / Magie de l'eau et de la glace / Magie de la thermodynamique / Magie de la terre / Magie de combat / Magie de feu / Nécromancie / Métamorphose"
      puts "Sinon vous pouvez être un sorcier noir de Tzinnch avec la magie généraliste en plus ou juste un mage invocateur sans autre spécialité"
    elsif @métier == "Prêtre"
      puts "Energie astrale karmique = " + @ea
      puts "Vous devez choisir l'un de ces dieux à vénérer:"
      puts "- Adathie, déésse de la justice et des merguez"
      puts "- Dlul, dieu du sommeil et de l'ennui"
      puts "- Slanoush, dieu des secrets, des vices, de la perversion, de la psychologie et des rêves"
      puts "- Youclidh, divinité de la bonne santé, du bien-être et de la guérison"
    elsif @métier == "Paladin"
      puts "Energie astrale karmique = " + @ea
      puts "Vous devez choisir l'un de ces dieux à vénérer:"
      puts "- Braav', dieu de la gentillesse, de la défense des opprimés, du bien et de la bonne action."
      puts "- Dlul, dieu du sommeil et de l'ennui"
      puts "- Slanoush, dieu des secrets, des vices, de la perversion, de la psychologie et des rêves"
      puts "- Khornettoh, dieu de la violence"
    end
  end
  
  def personnage
    puts "Quel nom voulez vous lui donner?"
    nom = gets.chomp.capitalize
    puts "Quel sexe aura votre personnage ? (F/M)"
    sexe = gets.chomp.upcase
    until sexe == "F" || sexe == "M"
      puts "Désole ce sexe n'existe pas, choisissez juste F ou M."
      sexe = gets.chomp.upcase
    end
    if sexe == "F"
      s = "Féminin"
    else 
      s = "Masculin"
    end
    puts " "
    if @origine == "Barbare" || @origine == "Orque" || @origine == "Ogre"
      if @métier == "Guerrier/Gladiateur"
        puts "Les valeurs de base en attaque et parade sont 8 et 10 mais en tant que guerrier vous pouvez échanger un point d'attaque pour un point de parade ou inversement."
        puts "Que voulez-vous faire?"
        puts "1 - Enlever un point d'attaque et rajouter un point de parade (8/10)"
        puts "2 - Enlever un point de parade et rajouter un point d'attaque (10/8)"
        puts "3 - Ne rien changer (9/9)"
        puts " "
        echange = gets.chomp.to_i
        until echange > 0 && echange < 4
          puts "Il faut choisir un chiffre entre 1 et 3."
          echange = gets.chomp.to_i
        end
        if echange == 1
          att = 8
          par = 10
        elsif echange == 2
          att = 10
          par = 8
        else
          att = 9
          par = 9
        end
      elsif @métier == "Ninja/Assassin"
        att = 11
        par = 8
      else 
        att = 9
        par = 9
      end
    elsif @origine == "Gnôme"
      att = 10
      par = 8
    else
      if @métier == "Guerrier/Gladiateur"
        puts "Les valeurs de base en attaque et parade sont 8 et 10 mais en tant que guerrier vous pouvez échanger un point d'attaque pour un point de parade ou inversement."
        puts "Que voulez-vous faire?"
        puts "1 - Enlever un point d'attaque et rajouter un point de parade (7/11)"
        puts "2 - Enlever un point de parade et rajouter un point d'attaque (9/9)"
        puts "3 - Ne rien changer (8/10)"
        puts " "
        echange = gets.chomp.to_i
        until echange > 0 && echange < 4
          puts "Il faut choisir un chiffre entre 1 et 3."
          echange = gets.chomp.to_i
        end
        if echange == 1
          att = 7
          par = 11
        elsif echange == 2
          att = 9
          par = 9
        else
          att = 8
          par = 10
        end
      elsif @métier == "Ninja/Assassin"
        att = 11
        par = 8
      elsif @métier == "Bourgeois/Noble"
        att = 7
        par = 9
      else
        att = 8
        par = 10
      end
    end
    puts "-------------------------------------------------"
    puts "Nom = " + nom + " / " + "Sexe = " + s
    puts "Origine = " + @origine + " / Métier = " + @métier
    puts "Energie vitale = " + @ev
    magie
    puts "Courage = " + @cou.to_s + "   Intelligence = " + @int.to_s + "   Charisme = " + @cha.to_s + + "   Adresse = " + @ad.to_s + "   Force = " + @fo.to_s
    puts "Attaque = " + att.to_s + "   Parade = " + par.to_s
    if @métier == "Marchand/Négociant"
      puts "Vous devez retirer un point de parade ou d'attaque pour l'ajouter en intelligence ou charisme. Si vous l'ajoutez à l'intelligence n'oubliez pas de modifier votre resistance magique"
    elsif @métier == "Ingénieur"
      puts "Vous devez retirer un point de parade ou d'attaque pour l'ajouter en intelligence ou adresse. Si vous l'ajoutez à l'intelligence n'oubliez pas de modifier votre resistance magique"
    end
    resist = (@cou+@int+@fo)/3
    if @métier == "Bourgeois/Noble"
      po = (rand(1..6) + rand(1..6) + rand(1..6) + rand(1..6))*10
    else
      po = (rand(1..6) + rand(1..6))*10
    end
    puts "Résistance magique = " + resist.to_s
    puts "Points de destin = " + rand(0..3).to_s
    puts "Or = " + po.to_s
    puts "PR max = " + @pr
    puts "Compétences de base = " + @comp1
    puts "Vous pouvez également choisir deux compétences supplémentaires parmi celles-ci:"
    puts @comp2
    puts "-------------------------------------------------"
    puts " "
    
  end
end  

class Pnj
  attr_accessor :rang, :nom, :courage, :intelligence, :charisme, :adresse, :force, :attaque, :parade
  
  def initialize(rang,nom,courage,intelligence,charisme,adresse,force,attaque,parade)
    @rang = rang
    @nom = nom
    @courage = courage
    @intelligence = intelligence
    @charisme = charisme
    @adresse = adresse
    @force = force
    @attaque = attaque
    @parade = parade
  end
  
  def infos
    if @force < 9
      puts "ARME = ARME COURTE A UNE MAIN 1D+2"
      puts "XP = 6"
    elsif 
      @force > 14
      puts "ARME = ARME A DEUX MAINS 1D+4"
      puts "XP = 12"
    elsif (@attaque < 8) && (@adresse > 13)
      puts "ARME = ARME A DISTANCE 1D+3"
      puts "XP = 10"
    else 
      puts "ARME = ARME A UNE MAIN 1D+3"
      puts "XP = 8"
    end
  end
  
  def race(n)
    puts "---------------------------------------------------"
    puts "NOM : #{nom} " + n.to_s
    puts "COU = " + @courage.to_s + " INT = " + @intelligence.to_s + " CHA = " + @charisme.to_s + " AD = " + @adresse.to_s + " FO = " + @force.to_s
    puts "ATTAQUE = " + @attaque.to_s + " PARADE = " + @parade.to_s
    puts "RESISTANCE MAGIQUE = " + ((@courage + @intelligence + @force)/3).to_s
    infos
  end
end  

hguerrier = Pj.new("Humain","Guerrier/Gladiateur","35","0","Pas de limite",rand(12..13),rand(8..13),rand(8..13),rand(8..13),rand(12..13),"Armes de bourrin / Bourre-Pif","Ambidextrie / Chercher des noises / Chevaucher / Forgeron / Intimider / Tirer correctement / Truc de mauviette")
hninja = Pj.new("Humain","Ninja/Assassin","30","0","3",rand(8..13),rand(8..13),rand(8..13),13,rand(8..13),"Déplacement silencieux / Frapper lâchement / Tirer correctement","Ambidextrie / Chercher des noises / Chevaucher / Erudition / Escalader / Méfiance / Nager / Ressemble à rien")
hvoleur = Pj.new("Humain","Voleur","30","0","3",rand(8..13),rand(8..13),rand(8..13),rand(12..13),rand(8..13),"Appel des renforts / Chouraver / Déplacement silencieux / Détection / Serrurier","Arnaque et carambouille / Désamorcer / Erudition / Escalader / Fouiller dans les poubelles / Frapper lâchement / Méfiance / Ressemble à rien")
hpretre = Pj.new("Humain","Prêtre","30","20","Selon dieu choisi",rand(8..13),rand(8..13),rand(12..13),rand(8..13),rand(8..13),"Erudition / Méfiance / Récupération","Arnaque et carambouille / Chevaucher / Cuistot / Fariboles / Premiers soins / Radin / Runes bizarres")
hmage = Pj.new("Humain","Mage/Sorcier","20","30","2",rand(8..13),rand(12..13),rand(8..13),rand(8..13),rand(8..13),"Erudition / Récupération / Runes bizarres","Appel des renforts / Chef de groupe / Chevaucher / Fariboles / Langue des monstres / Premiers soins")
hpaladin = Pj.new("Humain","Paladin","32","10","Selon dieu choisi",rand(12..13),rand(10..13),rand(11..13),rand(8..13),rand(9..13),"Chevaucher / Intimider / Récupération","Armes de bourrins / Chercher des noises / Erudition / Fariboles / Premiers soins")
hranger = Pj.new("Humain","Ranger","30","0","4",rand(8..13),rand(8..13),rand(10..13),rand(10..13),rand(8..13),"Déplacement silencieux / Détection / Chevaucher / Nager / Pister","Ambidextrie / Chef de groupe / Comprendre le animaux / Désamorcer / Erudition / Escalader / Méfiance / Premiers soins / Tirer correctement")
hmenestrel = Pj.new("Humain","Ménestrel","30","0","2",rand(8..13),rand(8..13),rand(12..13),rand(11..13),rand(8..13),"Attire les monstres / Chevaucher / Erudition / Fariboles / Jonglage et danse / Naïveté touchante","Méfiance / Mendier et pleurnicher / Premiers soins / Runes bizzares / Tirer correctement")
hmarchand = Pj.new("Humain","Marchand/Négociant","30","0","3",rand(8..13),rand(12..13),rand(11..13),rand(8..13),rand(8..13),"Appel des renforts / Arnaque et carambouille / Erudition / Fariboles / Méfiance","Chef de groupe / Chevaucher / Cuistot / Forgeron / Instinct du trésor / Runes bizzares")
hingenieur = Pj.new("Humain","Ingénieur","30","0","3",rand(8..13),rand(8..13),rand(8..13),rand(11..13),rand(8..13),"Bricolo du dimanche / Désamorcer / Forgeron / Ressemble à rien / Serrurier","Appel des renforts / Cuistot / Chevaucher / Erudition / Nager / Premiers soins")
hpirate = Pj.new("Humain","Pirate","30","0","3",rand(11..13),rand(8..13),rand(8..13),rand(11..13),rand(8..13),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Chouraver / Escalader / Nager","Détection / Fouiller dans les poubelles / Instinc du trésor / Méfiance / Mendier et pleurnicher / Tirer correctement")
hnoble = Pj.new("Humain","Bourgeois/Noble","30","0","Pas de limite",rand(8..13),rand(10..13),rand(11..13),rand(8..13),rand(8..13),"Appel des renforts / Attire les monstres / Chevaucher / Erudition / Pénible","Arnaque et carambouille / Chef de groupe / Jonglage et danse / Méfiance / Nager / Runes bizzares")
bguerrier = Pj.new("Barbare","Guerrier/Gladiateur","35","0","Pas de limite",rand(12..13),rand(8..13),rand(8..13),rand(8..13),13,"Ambidextrie / Armes de bourrin / Bourre-Pif / Chercher des noises / Sentir des pieds / Tête vide","Chevaucher / Escalader / Forgeron / Intimider / Nager / Pister / Tirer correctement / Truc de mauviette")
branger = Pj.new("Barbare","Ranger","35","0","4",rand(12..13),rand(8..13),rand(10..13),rand(10..13),13,"Ambidextrie / Chercher des noises / Déplacement silencieux / Détection / Chevaucher / Nager / Pister /Sentir des pieds / Tête vide","Armes de bourrin / Bourre-pif / Chef de groupe / Comprendre les animaux / Désamorcer / Escalader / Intimider / Méfiance / Premiers soins / Tirer correctement")
bpirate = Pj.new("Barbare","Pirate","35","0","3",rand(11..13),rand(8..13),rand(8..13),rand(11..13),13,"Ambidextrie / Appel des renforts / Appel du tonneau / Arnaque et carambouille /  Chercher des noises / Chouraver / Escalader / Nager / Sentir des pieds / Tête vide","Armes de bourrin / Bourre-pif / Chevaucher / Détection / Fouiller dans les poubelles / Intimider / Instinct du trésor / Pister / Escalader / Intimider / Méfiance / Mendier et pleurnicher / Tirer correctement / Truc de mauviette")
nguerrier = Pj.new("Nain","Guerrier/Gladiateur","40","0","Pas de limite",rand(12..13),rand(8..13),rand(8..13),rand(8..13),rand(12..13),"Appel du tonneau / Armes de bourrin / Bourre-Pif / Instinct du trésor / Pénible / Radin","Appel des renforts / Arnaque et carambouille / Bricolo du dimanche / Chercher des noises / Chevaucher / Fariboles / Forgeron / Intimider / Médiance / Tirer correctement / Truc de mauviette")
nmenestrel = Pj.new("Nain","Ménestrel","35","0","2",rand(11..13),rand(8..13),rand(12..13),rand(11..13),rand(12..13),"Appel du tonneau / Attire les monstres / Chevaucher / Erudition / Fariboles / Instinct du trésor / Jonglage et danse / Pénible / Radin","Appel des renforts / Arnaque et carambouille / Bricolo du dimanche / Bourre-pif / Chercher des noises / Forgeron / Méfiance / Mendier et pleurnicher / Premiers soins / Runes bizzares / Truc de mauviette / Tirer correctement")
nmarchand = Pj.new("Nain","Marchand/Négociant","35","0","3",rand(11..13),rand(12..13),rand(11..13),rand(8..13),rand(12..13),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Erudition / Fariboles / Instinct du trésor / Méfiance / Pénible / Radin","Bricolo du dimanche / Bourre-pif / Chef de groupe / Chercher des noises / Chevaucher / Cuistot / Forgeron / Runes bizzares / Truc de mauviette / Tirer correctement")
npirate = Pj.new("Nain","Pirate","35","0","3",rand(11..13),rand(8..13),rand(8..13),rand(11..13),rand(12..13),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Chouraver / Escalader / Instinct du trésor / Nager / Pénible / Radin","Bricolo du dimanche / Bourre-pif / Chercher des noises / Détection / Fariboles / Forgeron / Fouiller dans les poubelles / Méfiance / Mendier et pleurnicher / Truc de mauviette / Tirer correctement")
nnoble = Pj.new("Nain","Bourgeois/Noble","35","0","Pas de limite",rand(11..13),rand(10..13),rand(11..13),rand(8..13),rand(12..13),"Appel des renforts / Appel du tonneau / Attire les monstres / Chevaucher / Erudition / Instinct du trésor / Pénible / Radin","Arnaque et carambouille / Bricolo du dimanche / Bourre-pif / Chef de groupe / Chercher des noises / Fariboles / Forgeron / Jonglage et danse / Méfiance / Nager / Runes bizarres / Truc de mauviette / Tirer correctement")
hepretre = Pj.new("Haut-Elfe","Prêtre","25","20","Selon dieu choisi",rand(8..13),rand(11..13),rand(12..13),rand(12..13),rand(8..12),"Erudition / Méfiance / Récupération / Runes bizarres / Tomber dans les pièges","Arnaque et carambouille / Chef de groupe / Chevaucher / Cuistot / Fariboles / Jonglage et danse / Nager / Premiers soins / Radin / Tirer correctement")
hemage = Pj.new("Haut-Elfe","Mage/Sorcier","18","30","2",rand(8..13),rand(12..13),rand(12..13),rand(12..13),rand(8..12),"Erudition / Récupération / Runes bizarres / Tomber dans les pièges","Appel des renforts / Chef de groupe / Chevaucher / Fariboles / Jonglage et danse / Langue des monstres / Nager / Premiers soins / Tirer correctement")
hepaladin = Pj.new("Haut-Elfe","Paladin","27","10","Selon dieu choisi",rand(12..13),rand(11..13),rand(12..13),rand(12..13),rand(9..12),"Chevaucher / Erudition / Intimider / Récupération / Runes bizarres / Tomber dans les pièges","Chef de groupe / Chercher des noises / Fariboles / Jonglage et danse / Nager / Premiers soins / Tirer correctement")
hemarchand = Pj.new("Haut-Elfe","Marchand/Négociant","25","0","3",rand(8..13),rand(12..13),rand(12..13),rand(12..13),rand(8..12),"Appel des renforts / Arnaque et carambouille / Erudition / Fariboles / Méfiance / Runes bizarres / Tomber dans les pièges","Chef de groupe / Chevaucher / Cuistot / Forgeron / Instinct du trésor / Jonglage et danse / Nager / Premiers soins / Tirer correctement")
heingenieur = Pj.new("Haut-Elfe","Ingénieur","25","0","3",rand(8..13),rand(11..13),rand(12..13),rand(12..13),rand(8..12),"Bricolo du dimanche / Désamorcer / Erudition / Forgeron / Ressemble à rien / Runes bizarres / Serrurier / Tomber dans les pièges","Appel des renforts / Chef de groupe / Chevaucher / Cuistot / Jonglage et danse / Nager / Premiers soins / Tirer correctement")
henoble = Pj.new("Haut-Elfe","Bourgeois/Noble","25","0","Pas de limite",rand(8..13),rand(11..13),rand(12..13),rand(12..13),rand(8..12),"Appel des renforts / Attire les monstres / Chevaucher / Erudition / Pénible / Runes bizarres / Tomber dans les pièges","Arnaque et carambouille / Chef de groupe / Jonglage et danse / Méfiance / Nager / Premiers soins / Tirer correctement")
deguerrier = Pj.new("Demi-Elfe","Guerrier/Gladiateur","33","0","5",rand(12..13),rand(8..13),rand(10..13),rand(11..13),rand(12..13),"Appel des renforts / Bourre-Pif / Détection / Chouraver / Méfiance","Ambidextrie / Bricolo du dimanche / Chercher des noises / Chevaucher / Erudition / Escalader / Forgeron /Fouiller dans les poubelles / Intimider / Mendier et pleurnicher / Nager / Tirer correctement")
deninja = Pj.new("Demi-Elfe","Ninja/Assassin","28","0","3",rand(8..13),rand(8..13),rand(10..13),13,rand(8..13),"Appel des renforts / Déplacement silencieux / Détection / Chouraver / Frapper lâchement / Méfiance / Tirer correctement","Ambidextrie / Bricolo du dimanche / Chercher des noises / Chevaucher / Erudition / Escalader / Fouiller dans les poubelles / Mendier et pleurnicher / Nager / Ressemble à rien")
devoleur = Pj.new("Demi-Elfe","Voleur","28","0","3",rand(8..13),rand(8..13),rand(10..13),rand(12..13),rand(8..13),"Appel des renforts / Détection / Chouraver / Déplacement silencieux / Serrurier / Méfiance","Arnaque et carambouille / Bricolo du dimanche / Chevaucher / Désamorcer / Erudition / Escalader / Fouiller dans les poubelles / Frapper lâchement / Mendier et pleurnicher / Nager / Ressemble à rien / Tirer correctement")
depretre = Pj.new("Demi-Elfe","Prêtre","28","20","Selon dieu choisi",rand(8..13),rand(8..13),rand(12..13),rand(11..13),rand(8..13),"Appel des renforts / Détection / Erudition / Chouraver / Méfiance / Récupération","Arnaque et carambouille / Bricolo du dimanche / Chevaucher / Cuistot / Escalader / Fariboles / Fouiller dans les poubelles / Mendier et pleurnicher / Nager / Premiers soins / Radin / Runes bizarres / Tirer correctement")
demage = Pj.new("Demi-Elfe","Mage/Sorcier","20","30","2",rand(8..13),rand(12..13),rand(10..13),rand(11..13),rand(8..13),"Appel des renforts / Détection / Chouraver / Erudition / Méfiance / Récupération","Bricolo du dimanche / Chef de groupe / Chevaucher / Escalader / Fariboles / Fouiller dans les poubelles / Langue des monstres / Mendier et pleurnicher / Nager / Premiers soins /Tirer correctement")
depaladin = Pj.new("Demi-Elfe","Paladin","30","10","Selon dieu choisi",rand(12..13),rand(10..13),rand(11..13),rand(11..13),rand(9..13),"Appel des renforts / Chevaucher / Détection / Chouraver / Intimider / Méfiance / Récupération","Bricolo du dimanche / Chercher des noises / Erudition / Escalader / Fariboles / Fouiller dans les poubelles / Mendier et pleurnicher / Nager / Premiers soins / Tirer correctement")
deranger = Pj.new("Demi-Elfe","Ranger","28","0","4",rand(8..13),rand(8..13),rand(10..13),rand(11..13),rand(8..13),"Appel des renforts / Déplacement silencieux / Détection / Chevaucher / Chouraver / Méfiance / Nager / Pister","Ambidextrie / Bricolo du dimanche / Chef de groupe / Comprendre les animaux / Désamorcer / Erudition / Escalader / Fouiller dans les poubelles / Mendier et pleurnicher / Premiers soins / Tirer correctement")
demenestrel = Pj.new("Demi-Elfe","Ménestrel","28","0","2",rand(8..13),rand(8..13),rand(12..13),rand(11..13),rand(8..13),"Appel des renforts / Attire les monstres / Chevaucher / Détection / Chouraver / Erudition / Fariboles / Jonglage et danse / Méfiance / Naïveté touchante","Bricolo du dimanche / Escalader / Fouiller dans les poubelles / Mendier et pleurnicher / Nager / Premiers soins / Runes bizarres / Tirer correctement")
demarchand = Pj.new("Demi-Elfe","Marchand/Négociant","28","0","3",rand(8..13),rand(12..13),rand(11..13),rand(11..13),rand(8..13),"Appel des renforts / Arnaque et carambouille / Détection / Erudition /  Chouraver / Fariboles / Méfiance","Bricolo du dimanche / Chef de groupe / Chevaucher / Cuistot / Escalader / Forgeron / Fouiller dans les poubelles / Instinct du trésor / Mendier et pleurnicher / Nager / Runes bizarres / Tirer correctement")
deingenieur = Pj.new("Demi-Elfe","Ingénieur","28","0","3",rand(8..13),rand(8..13),rand(10..13),rand(11..13),rand(8..13),"Appel des renforts / Bricolo du dimanche / Détection / Désamorcer / Chouraver / Forgeron / Méfiance / Ressemble à rien / Serrurier","Chevaucher / Cuistot / Erudition / Escalader / Fouiller dans les poubelles / Mendier et pleurnicher / Nager / Premiers soins / Tirer correctement")
depirate = Pj.new("Demi-Elfe","Pirate","28","0","3",rand(11..13),rand(8..13),rand(10..13),rand(11..13),rand(8..13),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Détection / Chouraver / Escalader / Nager / Méfiance","Bricolo du dimanche / Chevaucher / Erudition / Fouiller dans les poubelles / Instinct du trésor / Mendier et pleurnicher / Tirer correctement")
denoble = Pj.new("Demi-Elfe","Bourgeois/Noble","28","0","Pas de limite",rand(8..13),rand(10..13),rand(11..13),rand(11..13),rand(8..13),"Appel des renforts / Attire les monstres / Chevaucher / Détection / Erudition / Chouraver / Méfiance / Pénible","Arnaque et carambouille / Bricolo du dimanche /  Chef de groupe / Escalader / Fouiller dans les poubelles / Jonglage et danse / Mendier et pleurnicher / Nager / Runes bizarres / Tirer correctement")
esninja = Pj.new("Elfe sylvain","Ninja/Assassin","25","0","3",rand(8..13),rand(8..13),rand(12..13),13,rand(8..11),"Chevaucher / Déplacement silencieux / Frapper lâchement / Naïveté touchante / Premiers soins / Tirer correctement / Tomber dans les pièges","Ambidextrie / Chercher des noises / Comprendre les animaux / Erudition / Escalader / Jonglage et danse / Méfiance / Nager / Pister / Ressemble à rien / Tête vide")
esvoleur = Pj.new("Elfe sylvain","Voleur","25","0","3",rand(8..13),rand(8..13),rand(12..13),rand(12..13),rand(8..11),"Appel des renforts / Chevaucher / Chouraver / Déplacement silencieux / Détection / Naïveté touchante / Premiers soins / Serrurier / Tirer correctement / Tomber dans les pièges","Arnaque et carambouille / Comprendre les animaux / Désamorcer / Erudition / Escalader / Fouiller dans les poubelles / Frapper lâchement / Jonglage et danse / Méfiance / Nager / Pister / Ressemble à rien / Tête vide")
esranger = Pj.new("Elfe sylvain","Ranger","25","0","4",rand(8..13),rand(8..13),rand(12..13),rand(10..13),rand(8..11),"Chevaucher / Déplacement silencieux / Détection / Nager / Naïveté touchante / Pister / Premiers soins / Tirer correctement / Tomber dans les pièges","Ambidextrie / Chef de groupe / Comprendre les animaux / Désamorcer / Erudition / Escalader / Jonglage et danse / Méfiance / Tête vide")
esmenestrel = Pj.new("Elfe sylvain","Ménestrel","25","0","2",rand(8..13),rand(8..13),rand(12..13),rand(11..13),rand(8..11),"Attire les monstres / Chevaucher / Erudition / Fariboles / Jonglage et danse / Naïveté touchante / Premiers soins / Tirer correctement / Tomber dans les pièges","Comprendre les animaux / Déplacement silencieux / Méfiance / Mendier et pleurnicher / Nager / Pister / Runes bizarres / Tête vide")
esmarchand = Pj.new("Elfe sylvain","Marchand/Négociant","25","0","3",rand(8..13),rand(12..13),rand(12..13),rand(10..13),rand(8..11),"Appel des renforts / Arnaque et carambouille / Chevaucher / Erudition / Fariboles / Méfiance / Naïveté touchante / Premiers soins / Tirer correctement / Tomber dans les pièges","Chef de groupe / Comprendre les animaux / Cuistot / Déplacement silencieux / Forgeron / Instinct du trésor / Jonglage et danse / Nager / Pister / Runes bizarres / Tête vide")
esingenieur = Pj.new("Elfe sylvain","Ingénieur","25","0","3",rand(8..13),rand(8..13),rand(12..13),rand(11..13),rand(8..11),"Bricolo du dimanche / Chevaucher / Désamorcer / Forgeron / Naïveté touchante / Premiers soins / Ressemble à rien / Serrurier / Tirer correctement / Tomber dans les pièges","Appel des renforts / Comprendre les animaux / Cuistot / Déplacement silencieux / Erudition / Jonglage et danse / Nager / Pister / Tête vide")
espirate = Pj.new("Elfe sylvain","Pirate","25","0","3",rand(11..13),rand(8..13),rand(12..13),rand(10..13),rand(8..13),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Chevaucher / Chouraver / Escalader / Nager / Naïveté touchante / Premiers soins / Tirer correctement / Tomber dans les pièges","Comprendre les animaux / Déplacement silencieux / Détection / Fouiller dans les poubelles / Instinct du trésor / Jonglage et danse / Méfiance / Mendier et pleurnicher / Pister / Tête vide")
esnoble = Pj.new("Elfe sylvain","Bougeois/Noble","25","0","Pas de limite",rand(8..13),rand(10..13),rand(12..13),rand(10..13),rand(8..13),"Appel des renforts / Attire les monstres / Chevaucher / Erudition / Naïveté touchante / Pénible / Premiers soins / Tirer correctement / Tomber dans les pièges","Arnaque et carambouille / Chef de groupe / Comprendre les animaux / Déplacement silencieux / Jonglage et danse / Méfiance / Nager / Pister / Runes bizarres / Tête vide")
enguerrier = Pj.new("Elfe noir","Guerrier/Gladiateur","30","0","3",rand(12..13),rand(12..13),rand(8..13),13,rand(12..13),"Agoraphobe / Bourre-Pif / Déplacement silencieux / Détection / Tirer correctement","Ambidextrie / Chercher des noises / Chevaucher / Chouraver / Erudition / Escalader / Forgeron / Frapper lâchement / Intimider / Méfiance / Pister / Runes bizarres / Truc de mauviette")
enninja = Pj.new("Elfe noir","Ninja/Assassin","25","0","3",rand(8..13),rand(12..13),rand(8..13),13,rand(8..13),"Agoraphobe / Déplacement silencieux / Détection / Frapper lâchement /Tirer correctement","Ambidextrie / Chercher des noises / Chevaucher / Chouraver / Erudition / Escalader / Forgeron / Méfiance / Nager / Pister / Ressemble à rien / Runes bizarres")
envoleur = Pj.new("Elfe noir","Voleur","25","0","3",rand(8..13),rand(12..13),rand(8..13),13,rand(8..13),"Agoraphobe / Appel des renforts / Chouraver / Déplacement silencieux / Détection / Serrurier / Tirer correctement","Ambidextrie / Arnaque et carambouille / Désamorcer / Erudition / Escalader / Forgeron / Fouiller dans les poubelles / Frapper lâchement / Méfiance / Pister / Ressemble à rien / Runes bizarres")
enpretre = Pj.new("Elfe noir","Prêtre","25","20","Selon dieu choisi",rand(8..13),rand(12..13),rand(12..13),13,rand(8..13),"Agoraphobe / Déplacement silencieux / Détection / Erudition / Méfiance / Récupération / Tirer correctement","Ambidextrie / Arnaque et carambouille / Chevaucher / Chouraver / Cuistot / Escalader / Fariboles / Forgeron / Frapper lâchement / Pister / Premiers soins / Radin / Runes bizarres")
enmage = Pj.new("Elfe noir","Mage/Sorcier","18","30","2",rand(8..13),rand(12..13),rand(8..13),13,rand(8..13),"Agoraphobe / Déplacement silencieux / Détection / Erudition / Récupération / Runes bizarres / Tirer correctement","Ambidextrie / Appel des renforts / Chef de groupe / Chevaucher / Chouraver / Escalader / Fariboles / Forgeron / Frapper lâchement / Langue des monstres / Méfiance / Pister / Premiers soins")
enpaladin = Pj.new("Elfe noir","Paladin","27","10","Selon dieu choisi",rand(12..13),rand(12..13),rand(11..13),13,rand(9..13),"Agoraphobe / Chevaucher / Déplacement silencieux / Détection / Intimider / Récupération / Tirer correctement","Ambidextrie / Chercher des noises / Chouraver / Erudition / Escalader / Fariboles / Forgeron / Frapper lâchement / Méfiance / Pister / Premiers soins / Runes bizarres")
enranger = Pj.new("Elfe noir","Ranger","25","0","3",rand(8..13),rand(12..13),rand(10..13),13,rand(8..13),"Agoraphobe / Déplacement silencieux / Détection / Chevaucher / Nager / Pister / Tirer correctement","Ambidextrie / Chef de groupe / Chouraver / Comprendre les animaux / Désamorcer / Erudition / Escalader / Forgeron / Frapper lâchement / Méfiance / Premiers soins / Runes bizarres")
enmenestrel = Pj.new("Elfe noir","Ménestrel","25","0","2",rand(8..13),rand(12..13),rand(12..13),13,rand(8..13),"Agoraphobe / Attire les monstres / Chevaucher / Déplacement silencieux / Détection / Erudition / Fariboles / Jonglage et danse / Naïveté touchante / Tirer correctement","Ambidextrie / Chouraver / Escalader / Forgeron / Frapper lâchement / Méfiance / Mendier et pleurnicher / Pister / Premiers soins / Runes bizarres")
enmarchand = Pj.new("Elfe noir","Marchand/Négociant","25","0","3",rand(8..13),rand(12..13),rand(11..13),13,rand(8..13),"Agoraphobe / Appel des renforts / Arnaque et carambouille / Déplacement silencieux / Détection / Erudition / Fariboles / Méfiance / Tirer correctement","Ambidextrie / Chef de groupe / Chevaucher / Chouraver / Cuistot / Escalader / Forgeron / Frapper lâchement / Instinct du trésor / Pister / Runes bizarres")
eningenieur = Pj.new("Elfe noir","Ingénieur","25","0","3",rand(8..13),rand(12..13),rand(8..13),13,rand(8..13),"Agoraphobe / Bricolo du dimanche / Déplacement silencieux / Désamorcer / Détection / Forgeron / Ressemble à rien / Serrurier / Tirer correctement","Ambidextrie / Appel des renforts / Chevaucher / Chouraver / Cuistot / Erudition / Escalader / Frapper lâchement / Méfiance / Nager / Pister / Premiers soins / Runes bizarres")
enpirate = Pj.new("Elfe noir","Pirate","25","0","3",rand(11..13),rand(12..13),rand(8..13),13,rand(8..13),"Agoraphobe / Appel des renforts / Appel du tonneau / Arnaque et carambouille / Chouraver / Déplacement silencieux / Détection / Escalader / Nager / Tirer correctement","Ambidextrie / Erudition / Forgeron / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Méfiance / Mendier et pleurnicher / Pister / Runes bizarres")
orguerrier = Pj.new("Orque","Guerrier/Gladiateur","40","0","Pas de limite",rand(12..13),8,rand(8..10),rand(8..13),rand(12..13),"Agoraphobie / Appel du sauvage / Appel du tonneau / Armes de bourrin / Bourre-Pif / Instinct de survie / Sentir des pieds / Tête vide","Ambidextrie / Chercher des noises / Chevaucher / Forgeron / Fouiller dans les poubelles / Intimider / Tirer correctement / Truc de mauviette")
orninja = Pj.new("Orque","Ninja/Assassin","35","0","3",rand(8..13),8,rand(8..10),13,rand(12..13),"Agoraphobie / Appel du sauvage / Appel du tonneau / Bourre-Pif / Déplacement silencieux / Frapper lâchement / Instinct de survie / Sentir des pieds / Tête vide / Tirer correctement","Ambidextrie / Armes de bourrin / Chercher des noises / Chevaucher / Escalader / Fouiller dans les poubelles / Intimider / Méfiance / Nager / Ressemble à rien / Truc de mauviette")
orvoleur = Pj.new("Orque","Voleur","35","0","3",rand(8..13),8,rand(8..10),rand(12..13),rand(12..13),"Agoraphobie / Appel des renforts / Appel du sauvage / Appel du tonneau / Bourre-Pif / Chouraver / Déplacement silencieux / Détection / Instinct de survie / Sentir des pieds / Serrurier / Tête vide","Armes de bourrin / Arnaque et carambouille / Chercher des noises / Désamorcer / Escalader / Fouiller dans les poubelles / Frapper lâchement / Intimider / Méfiance / Ressemble à rien / Truc de mauviette")
orranger = Pj.new("Orque","Ranger","35","0","4",rand(8..13),8,10,rand(10..13),rand(12..13),"Agoraphobie / Appel du sauvage / Appel du tonneau / Bourre-Pif / Déplacement silencieux / Détection / Chevaucher / Instinct de survie / Nager / Pister / Sentir des pieds / Tête vide","Ambidextrie / Armes de bourrin / Chef de groupe / Chercher des noises / Comprendre les animaux / Désamorcer / Escalader / Fouiller dans les poubelles / Intimider / Méfiance / Premiers soins / Tirer correctement / Truc de mauviette")
orpirate = Pj.new("Orque","Pirate","35","0","3",rand(11..13),8,rand(8..10),rand(11..13),rand(12..13),"Agoraphobie / Appel des renforts / Appel du sauvage / Appel du tonneau / Arnaque et carambouille / Bourre-Pif / Chouraver / Escalader / Instinct de survie / Nager / Sentir des pieds / Tête vide","Armes de bourrin / Chercher des noises / Détection / Fouiller dans les poubelles / Instinct du trésor / Intimider / Méfiance / Mendier et pleurnicher / Tirer correctement / Truc de mauviette")
doguerrier = Pj.new("Demi-Orque","Guerrier/Gladiateur","40","0","Pas de limite",rand(12..13),rand(8..10),rand(8..13),rand(8..11),rand(12..13),"Agoraphobie / Armes de bourrin / Bourre-Pif / Chercher des noises / Instinct de survie / Sentir des pieds / Tête vide","Ambidextrie / Chevaucher / Escalader / Forgeron / Fouiller dans les poubelles / Intimider / Nager / Tirer correctement / Truc de mauviette")
doranger = Pj.new("Demi-Orque","Ranger","35","0","4",rand(8..13),rand(8..10),rand(10..13),rand(10..11),rand(12..13),"Agoraphobie / Déplacement silencieux / Détection / Chercher des noises / Chevaucher / Instinct de survie / Nager / Pister / Sentir des pieds / Tête vide","Ambidextrie / Armes de bourrin / Bourre-Pif / Chef de groupe / Comprendre les animaux / Désamorcer / Escalader / Fouiller dans les poubelles / Intimider / Méfiance / Premiers soins / Tirer correctement / Truc de mauviette")
domenestrel = Pj.new("Demi-orque","Ménestrel","35","0","2",rand(8..13),rand(8..10),rand(12..13),11,rand(12..13),"Agoraphobie / Attire les monstres / Chercher des noises / Chevaucher / Fariboles / Instinct de survie / Jonglage et danse / Naïveté touchante / Sentir des pieds / Tête vide","Armes de bourrin / Bourre-Pif / Escalader / Fouiller dans les poubelles / Intimider / Méfiance / Mendier et pleurnicher / Nager / Premiers soins / Runes bizarres / Tirer correctement / Truc de mauviette")
doingenieur = Pj.new("Demi-Orque","Ingénieur","35","0","3",rand(8..13),rand(8..10),rand(8..13),11,rand(12..13),"Agoraphobie / Bricolo du dimanche / Chercher des noises / Désamorcer / Forgeron / Instinct de survie / Ressemble à rien / Sentir des pieds / Serrurier / Tête vide","Appel des renforts / Armes de bourrin / Bourre-Pif / Chevaucher / Cuistot / Escalader / Fouiller dans les poubelles / Intimider / Nager / Premiers soins /Tirer correctement / Truc de mauviette")
dopirate = Pj.new("Demi-Orque","Pirate","35","0","3",rand(11..13),rand(8..10),rand(8..13),11,rand(12..13),"Agoraphobie / Appel des renforts / Appel du tonneau / Arnaque et carambouille / Chercher des noises / Chouraver / Escalader / Instinct de survie / Nager / Sentir des pieds / Tête vide","Armes de bourrin / Bourre-Pif / Détection / Fouiller dans les poubelles / Intimider / Instinct du trésor / Méfiance / Mendier et pleurnicher / Tirer correctement / Truc de mauviette")
gninja = Pj.new("Gobelin","Ninja/Assassin","20","0","3",rand(8..10),rand(8..10),8,13,rand(8..9),"Agoraphobie / Appel des renforts / Appel du sauvage / Attire les monstres / Déplacement silencieux / Frapper lâchement / Instinct de survie / Instict du trésor / Sentir des pieds / Tête vide / Tirer correctement","Ambidextrie / Bricolo du dimanche / Chercher des noises / Chevaucher / Désamorcer / Escalader / Forgeron / Méfiance / Nager / Ressemble à rien")
gvoleur = Pj.new("Gobelin","Voleur","20","0","3",rand(8..10),rand(8..10),8,rand(12..13),rand(8..9),"Agoraphobie / Appel des renforts / Appel du sauvage / Attire les monstres / Chouraver / Déplacement silencieux / Détection / Instinct de survie / Instict du trésor / Sentir des pieds / Serrurier / Tête vide","Arnaque et carambouille / Bricolo du dimanche / Désamorcer / Escalader / Forgeron / Fouiller dans les poubelles / Frapper lâchement / Méfiance / Ressemble à rien")
gingenieur = Pj.new("Gobelin","Ingénieur","20","0","3",rand(8..10),rand(8..10),8,rand(11..13),rand(8..9),"Agoraphobie / Appel des renforts / Appel du sauvage / Attire les monstres / Bricolo du dimanche / Désamorcer / Forgeron / Instinct de survie / Instict du trésor / Ressemble à rien / Sentir des pieds / Serrurier / Tête vide","Cuistot / Chevaucher / Escalader / Nager / Premiers soins")
ogguerrier = Pj.new("Ogre","Guerrier/Gladiateur","50","0","4",rand(12..13),rand(8..9),rand(8..10),rand(8..11),13,"Appel du ventre / Appel du tonneau / Armes de bourrin / Bourre-Pif / Instinct de survie / Intimider / Sentir des pieds / Tête vide","Ambidextrie / Chercher des noises / Forgeron / Fouiller dans les poubelles / Langue des monstres / Tirer correctement / Truc de mauviette")
ogranger = Pj.new("Ogre","Ranger","45","0","4",rand(8..13),rand(8..9),10,rand(10..11),13,"Appel du ventre / Appel du tonneau / Armes de bourrin / Déplacement silencieux / Détection / Instinct de survie / Intimider / Nager  / Pister / Sentir des pieds / Tête vide","Ambidextrie / Bourre-Pif / Chef de groupe / Chercher des noises / Comprendre les animaux / Désamorcer / Escalader / Fouiller dans les poubelles / Langue des monstres / Méfiance / Premiers soins / Tirer correctement / Truc de mauviette")
ogpirate = Pj.new("Ogre","Pirate","45","0","3",rand(11..13),rand(8..9),rand(8..10),11,13,"Appel des renforts / Appel du ventre / Appel du tonneau / Armes de bourrin / Arnaque et carambouille / Chouraver / Escalader / Instinct de survie / Intimider / Nager / Sentir des pieds / Tête vide","Bourre-Pif / Chercher des noises / Détection / Fouiller dans les poubelles / Instinct du trésor / Langue des monstres / Méfiance / Mendier et pleurnicher / Tirer correctement / Truc de mauviette")
honinja = Pj.new("Hobbit","Ninja/Assassin","25","0","3",rand(12..13),rand(10..13),rand(8..13),13,rand(8..10),"Appel du tonneau / Attire les monstres / Cuistot / Déplacement silencieux / Frapper lâchement / Instinct de survie / Ressemble à rien / Tirer correctement","Ambidextrie / Appel des renforts / Chercher des noises / Chevaucher / Chouraver / Erudition / Escalader / Fariboles / Fouiller dans les poubelles / Instinct du trésor / Méfiance / Mendier et pleurnicher / Nager")
hovoleur = Pj.new("Hobbit","Voleur","25","0","3",rand(12..13),rand(10..13),rand(8..13),rand(12..13),rand(8..10),"Appel des renforts / Appel du tonneau / Attire les monstres / Chouraver / Cuistot / Déplacement silencieux / Détection / Instinct de survie / Ressemble à rien / Serrurier","Arnaque et carambouille / Désamorcer / Erudition / Escalader / Fariboles / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Méfiance / Mendier et pleurnicher / Tirer correctement")
hopretre = Pj.new("Hobbit","Prêtre","25","20","Selon dieu choisi",rand(12..13),rand(10..13),rand(12..13),rand(8..13),rand(8..10),"Appel du tonneau / Attire les monstres / Cuistot / Erudition / Instinct de survie / Méfiance / Récupération / Ressemble à rien","Appel des renforts / Arnaque et carambouille / Chevaucher / Chouraver / Cuistot / Fariboles / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Mendier et pleurnicher / Premiers soins / Radin / Runes bizarres / Tirer correctement")
horanger = Pj.new("Hobbit","Ranger","25","0","3",rand(12..13),rand(10..13),rand(10..13),rand(10..13),rand(8..10),"Appel du tonneau / Attire les monstres / Cuistot / Déplacement silencieux / Détection / Chevaucher / Instinct de survie / Nager / Pister / Ressemble à rien","Ambidextrie / Appel des renforts / Chef de groupe / Chouraver / Comprendre les animaux / Désamorcer / Erudition / Escalader / Fariboles / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Méfiance / Mendier et pleurnicher / Premiers soins / Tirer correctement")
homenestrel = Pj.new("Hobbit","Ménestrel","25","0","2",rand(12..13),rand(10..13),rand(12..13),rand(11..13),rand(8..10),"Appel du tonneau / Attire les monstres / Chervaucher / Cuistot / Erudition / Fariboles / Instinct de survie / Jonglage et danse / Naïveté touchante / Ressemble à rien","Appel des renforts / Chouraver / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Méfiance / Mendier et pleurnicher / Premiers soins / Runes bizarres / Tirer correctement")
homarchand = Pj.new("Hobbit","Marchand/Négociant","25","0","3",rand(12..13),rand(12..13),rand(11..13),rand(8..13),rand(8..10),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Attire les monstres / Cuistot / Erudition / Fariboles / Instinct de survie / Méfiance / Ressemble à rien","Chef de groupe / Chevaucher / Chouraver / Forgeron / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Mendier et pleurnicher / Runes bizarres / Tirer correctement")
hoingenieur = Pj.new("Hobbit","Ingénieur","25","0","3",rand(12..13),rand(10..13),rand(8..13),rand(11..13),rand(8..10),"Appel du tonneau / Attire les monstres / Bricolo du dimanche / Cuistot / Désamorcer / Forgeron / Instinct de survie / Ressemble à rien / Serrurier","Appel des renforts / Chevaucher / Chouraver / Erudition / Fariboles / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Mendier et pleurnicher / Nager / Premiers soins / Tirer correctement")
hopirate = Pj.new("Hobbit","Pirate","25","0","3",rand(12..13),rand(10..13),rand(8..13),rand(11..13),rand(8..10),"Appel des renforts / Appel du tonneau / Arnaque et carambouille / Attire les monstres / Chevaucher / Cuistot / Escalader / Instinct de survie / Nager / Ressemble à rien","Détection / Erudition / Fariboles / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Méfiance / Mendier et pleurnicher / Tirer correctement")
honoble = Pj.new("Hobbit","Bourgeois/Noble","25","0","3",rand(12..13),rand(10..13),rand(11..13),rand(8..13),rand(8..10),"Appel des renforts / Appel du tonneau / Attire les monstres / Chef de groupe / Cuistot / Erudition / Instinct de survie / Ressemble à rien","Arnaque et carambouille / Chevaucher / Chouraver / Fariboles / Fouiller dans les poubelles / Frapper lâchement / Instinct du trésor / Jonglage et danse / Méfiance / Mendier et pleurnicher / Nager / Runes bizarres / Tirer correctement")
gnninja = Pj.new("Gnôme","Ninja/Assassin","15","0","2",rand(8..13),rand(10..13),rand(8..13),13,8,"Ambidextrie / Appel des renforts / Chevaucher / Chouraver / Déplacement silencieux / Frapper lâchement / Instinct du trésor / Tirer correctement","Chercher des noises / Comprendre les animaux / Désamorcer / Détection / Escalader / Jonglage et danse / Méfiance / Mendier et pleurnicher / Nager / Ressemble à rien / Serrurier")
gnvoleur = Pj.new("Gnôme","Voleur","15","0","2",rand(8..13),rand(10..13),rand(8..13),13,8,"Ambidextrie / Appel des renforts / Chevaucher / Chouraver / Déplacement silencieux / Détection / Instinct du trésor / Serrurier","Arnaque et carambouille / Comprendre les animaux / Désamorcer / Escalader / Fouiller dans les poubelles / Frapper lâchement / Jonglage et danse / Méfiance / Mendier et pleurnicher / Nager / Ressemble à rien")
gnranger = Pj.new("Gnôme","Ranger","15","0","2",rand(8..13),rand(10..13),rand(10..13),13,8,"Ambidextrie / Appel des renforts / Chevaucher / Chouraver / Déplacement silencieux / Détection / Instinct du trésor / Nager / Pister","Chef de groupe / Comprendre les animaux / Désamorcer / Escalader / Jonglage et danse / Méfiance / Mendier et pleurnicher / Premiers soins / Serrurier / Tirer correctement")
gnmenestrel = Pj.new("Gnôme","Ménestrel","15","0","2",rand(8..13),rand(10..13),rand(12..13),13,8,"Ambidextrie / Appel des renforts / Attire les monstres  / Chevaucher / Chouraver / Déplacement silencieux / Fariboles / Instinct du trésor / Jonglage et danse / Naïveté touchante","Comprendre les animaux / Désamorcer / Détection / Escalader / Méfiance / Mendier et pleurnicher / Nager / Premiers soins / Serrurier / Tirer correctement")
gningenieur = Pj.new("Gnôme","Ingénieur","15","0","2",rand(8..13),rand(10..13),rand(8..13),13,8,"Ambidextrie / Appel des renforts / Bricolo du dimanche / Chevaucher / Chouraver / Déplacement silencieux / Désamorcer / Forgeron / Instinct du trésor / Ressemble à rien / Serrurier","Comprendre les animaux / Cuistot / Détection / Escalader / Jonglage et danse / Mendier et pleurnicher / Nager / Premiers soins")
gnpirate = Pj.new("Gnôme","Pirate","15","0","2",rand(11..13),rand(10..13),rand(8..13),13,8,"Ambidextrie / Appel des renforts / Appel du tonneau / Arnaque et carambouille / Chevaucher / Chouraver / Déplacement silencieux / Escalader / Instinct du trésor / Nager","Comprendre les animaux / Désamorcer / Détection / Fouiller dans les poubelles / Jonglage et danse / Méfiance / Mendier et pleurnicher / Serrurier / Tirer correctement")




puts "Tagazok à toi ! Que veux-tu faire? (entrer le chiffre correspondant)"
loop do
  puts "1 - Créer des PNJ"
  puts "2 - Créer des PJ"
  puts "3 - Quitter"
  puts " "
  création = gets.chomp.to_i
  until création > 0 && création < 4
    puts "Choisis seulement un chiffre entre 1 et 3"
    création = gets.chomp.to_i
  end
  if création == 1
    puts "Que veux tu-créer? (entrer le chiffre correspondant)"
    loop do 
      puts "1 - Humain"
      puts "2 - Elfe"
      puts "3 - Orque"
      puts "4 - Gobelin"
      puts "5 - Revenir en arrière"
      b = gets.chomp.to_i
      until b > 0 && b < 6
        puts "Choisis seulement un chiffre entre 1 et 5"
        b = gets.chomp.to_i
      end
      n = 1
      if b > 0 && b < 5     
        puts "Tu en veux combien?"
        h = gets.chomp.to_i
        until h > 0
          puts "Par les tentacules de Gzor c'est impossible, entre un nombre supérieur à 0."
          h = gets.chomp.to_i
        end
        if b == 1
          h.times {
            humain = Pnj.new(1,"HUMAIN",rand(8..15),rand(7..15),rand(5..15),rand(6..15),rand(8..15),rand(5..11),rand(5..11))
            humain.race(n)
            n += 1
          }
        elsif b == 2
          h.times {
            elfe = Pnj.new(1,"ELFE",rand(5..12),rand(5..12),rand(9..17),rand(8..15),rand(6..12),rand(5..10),rand(4..10))
            elfe.race(n)
            n += 1
          }
        elsif b == 3
          h.times {
            orque = Pnj.new(2,"ORQUE",rand(9..16),rand(4..8),rand(4..10),rand(6..13),rand(12..16),rand(7..12),rand(6..12))
            orque.race(n)
            n += 1
          }
        else
          h.times {
            gobelin = Pnj.new(2,"GOBELIN",rand(4..8),rand(4..8),rand(4..8),rand(8..15),rand(5..9),rand(5..9),rand(4..9))
            gobelin.race(n)
            n += 1
          }
        end
        puts "---------------------------------------------------" 
        puts "Que veux-tu faire ensuite?"
      else
        puts "Que veux-tu faire?"
        break
      end
    end
  elsif création == 2 
    puts "Tout d'abord quelle origine souhaites-tu jouer ? (entrer le chiffre correspondant)"
    loop do
      puts " "
      puts "1 - Humain"
      puts "2 - Barbare"
      puts "3 - Nain"
      puts "4 - Haut-Elfe"
      puts "5 - Demi-Elfe"
      puts "6 - Elfe sylvain"
      puts "7 - Elfe noir"
      puts "8 - Orque"
      puts "9 - Demi-Orque"
      puts "10 - Gobelin"
      puts "11 - Ogre"
      puts "12 - Hobbit"
      puts "13 - Gnôme"
      puts "14 - Revenir en arrière"
      puts " " 
      race = gets.chomp.to_i
      until race > 0 && race < 15
        puts "Il faut choisir un nombre entre 1 et 14."
        race = gets.chomp.to_i
      end
      puts " "
      if race == 1
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ninja/Assassin"
        puts "3 - Voleur"
        puts "4 - Prêtre"
        puts "5 - Mage/Sorcier"
        puts "6 - Paladin"
        puts "7 - Ranger"
        puts "8 - Ménestrel"
        puts "9 - Marchand/Négociant"
        puts "10 - Ingénieur"
        puts "11 - Pirate"
        puts "12 - Bourgeois/Noble"
        puts "13 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 14      
          puts "Il faut choisir un nombre entre 1 et 13"
          classe = gets.chomp.to_i
        end
        if classe == 1
          hguerrier.personnage      
        elsif classe == 2
          hninja.personnage
        elsif classe == 3
          hvoleur.personnage
        elsif classe == 4
          hpretre.personnage
        elsif classe == 5
          hmage.personnage
        elsif classe == 6
          hpaladin.personnage
        elsif classe == 7
          hranger.personnage
        elsif classe == 8
          hmenestrel.personnage
        elsif classe == 9
          hmarchand.personnage
        elsif classe == 10
          hingenieur.personnage
        elsif classe == 11
          hpirate.personnage
        elsif classe == 12
          hnoble.personnage
        end    
      elsif race == 2
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ranger"
        puts "3 - Pirate"
        puts "4 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 5      
          puts "Il faut choisir un nombre entre 1 et 4"
          classe = gets.chomp.to_i
        end
        if classe == 1
          bguerrier.personnage
        elsif classe == 2
          branger.personnage
        elsif classe == 3
          bpirate.personnage
        end
      elsif race == 3
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ménestrel"
        puts "3 - Marchand/Négociant"
        puts "4 - Pirate"
        puts "5 - Bourgeois/Noble"
        puts "6 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 7      
          puts "Il faut choisir un nombre entre 1 et 6"
          classe = gets.chomp.to_i
        end
        if classe == 1
          nguerrier.personnage
        elsif classe == 2
          nmenestrel.personnage
        elsif classe == 3
          nmarchand.personnage
        elsif classe == 4
          npirate.personnage
        elsif classe == 5
          nnoble.personnage
        end
      elsif race == 4
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Prêtre"
        puts "2 - Mage/Sorcier"
        puts "3 - Paladin"
        puts "4 - Marchand/Négociant"
        puts "5 - Ingénieur"
        puts "6 - Bourgeois/Noble"
        puts "7 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 8      
          puts "Il faut choisir un nombre entre 1 et 7"
          classe = gets.chomp.to_i
        end
        if classe == 1
          hepretre.personnage
        elsif classe == 2
          hemage.personnage
        elsif classe == 3
          hepaladin.personnage
        elsif classe == 4
          hemarchand.personnage
        elsif classe == 5
          heingenieur.personnage
        elsif classe == 6
          henoble.personnage
        end
      elsif race == 5
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ninja/Assassin"
        puts "3 - Voleur"
        puts "4 - Prêtre"
        puts "5 - Mage/Sorcier"
        puts "6 - Paladin"
        puts "7 - Ranger"
        puts "8 - Ménestrel"
        puts "9 - Marchand/Négociant"
        puts "10 - Ingénieur"
        puts "11 - Pirate"
        puts "12 - Bourgeois/Noble"
        puts "13 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 14      
          puts "Il faut choisir un nombre entre 1 et 13"
          classe = gets.chomp.to_i
        end
        if classe == 1
          deguerrier.personnage
        elsif classe == 2
          deninja.personnage
        elsif classe == 3
          devoleur.personnage
        elsif classe == 4
          depretre.personnage
        elsif classe == 5
          demage.personnage
        elsif classe == 6
          depaladin.personnage
        elsif classe == 7
          deranger.personnage
        elsif classe == 8
          demenestrel.personnage
        elsif classe == 9
          demarchand.personnage
        elsif classe == 10
          deingenieur.personnage
        elsif classe == 11
          depirate.personnage
        elsif classe == 12
          denoble.personnage
        end
      elsif race == 6
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Ninja/Assassin"
        puts "2 - Voleur"
        puts "3 - Ranger"
        puts "4 - Ménestrel"
        puts "5 - Marchand/Négociant"
        puts "6 - Ingénieur"
        puts "7 - Pirate"
        puts "8 - Bourgeois/Noble"
        puts "9 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 10    
          puts "Il faut choisir un nombre entre 1 et 9"
          classe = gets.chomp.to_i
        end
        if classe == 1
          esninja.personnage
        elsif classe == 2
          esvoleur.personnage
        elsif classe == 3
          esranger.personnage
        elsif classe == 4
          esmenestrel.personnage
        elsif classe == 5
          esmarchand.personnage
        elsif classe == 6
          esingenieur.personnage
        elsif classe == 7
          espirate.personnage
        elsif classe == 8
          esnoble.personnage
        end
      elsif race == 7
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ninja/Assassin"
        puts "3 - Voleur"
        puts "4 - Prêtre"
        puts "5 - Mage/Sorcier"
        puts "6 - Paladin"
        puts "7 - Ranger"
        puts "8 - Ménestrel"
        puts "9 - Marchand/Négociant"
        puts "10 - Ingénieur"
        puts "11 - Pirate"
        puts "12 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 13    
          puts "Il faut choisir un nombre entre 1 et 12"
          classe = gets.chomp.to_i
        end
        if classe == 1
          enguerrier.personnage
        elsif classe == 2
          enninja.personnage
        elsif classe == 3
          envoleur.personnage
        elsif classe == 4
          enpretre.personnage
        elsif classe == 5
          enmage.personnage
        elsif classe == 6
          enpaladin.personnage
        elsif classe == 7
          enranger.personnage
        elsif classe == 8
          enmenestrel.personnage
        elsif classe == 9
          enmarchand.personnage
        elsif classe == 10
          eningenieur.personnage
        elsif classe == 11
          enpirate.personnage
        end
      elsif race == 8
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ninja/Assassin"
        puts "3 - Voleur"
        puts "4 - Ranger"
        puts "5 - Pirate"
        puts "6 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 7    
          puts "Il faut choisir un nombre entre 1 et 6"
          classe = gets.chomp.to_i
        end
        if classe == 1
          orguerrier.personnage
        elsif classe == 2
          orninja.personnage
        elsif classe == 3
          orvoleur.personnage
        elsif classe == 4
          orranger.personnage
        elsif classe == 5
          orpirate.personnage
        end
      elsif race == 9
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ranger"
        puts "3 - Ménestrel"
        puts "4 - Ingénieur"
        puts "5 - Pirate"
        puts "6 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 7    
          puts "Il faut choisir un nombre entre 1 et 6"
          classe = gets.chomp.to_i
        end
        if classe == 1
          doguerrier.personnage
        elsif classe == 2
          doranger.personnage
        elsif classe == 3
          domenestrel.personnage
        elsif classe == 4
          doingenieur.personnage
        elsif classe == 5
          dopirate.personnage
        end
      elsif race == 10
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Ninja/Assassin"
        puts "2 - Voleur"
        puts "3 - Ingénieur"
        puts "4 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 5    
          puts "Il faut choisir un nombre entre 1 et 4"
          classe = gets.chomp.to_i
        end
        if classe == 1
          gninja.personnage
        elsif classe == 2
          gvoleur.personnage
        elsif classe == 3
          gingenieur.personnage
        end
      elsif race == 11
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Guerrier/Gladiateur"
        puts "2 - Ranger"
        puts "3 - Pirate"
        puts "4 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 5    
          puts "Il faut choisir un nombre entre 1 et 4"
          classe = gets.chomp.to_i
        end
        if classe == 1
          ogguerrier.personnage
        elsif classe == 2
          ogranger.personnage
        elsif classe == 3
          ogpirate.personnage
        end
      elsif race == 12
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Ninja/Assassin"
        puts "2 - Voleur"
        puts "3 - Prêtre"
        puts "4 - Ranger"
        puts "5 - Ménestrel"
        puts "6 - Marchand/Négociant"
        puts "7 - Ingénieur"
        puts "8 - Pirate"
        puts "9 - Bourgeois/Noble"
        puts "10 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 11    
          puts "Il faut choisir un nombre entre 1 et 10"
          classe = gets.chomp.to_i
        end
        if classe == 1
          honinja.personnage
        elsif classe == 2
          hovoleur.personnage
        elsif classe == 3
          hopretre.personnage
        elsif classe == 4
          horanger.personnage
        elsif classe == 5
          homenestrel.personnage
        elsif classe == 6
          homarchand.personnage
        elsif classe == 7
          hoingenieur.personnage
        elsif classe == 8
          hopirate.personnage
        elsif classe == 9
          honoble.personnage
        end
      elsif race == 13
        puts "Avec cette origine tu peux accéder à ces métiers, lequel veux-tu ?(entrer le chiffre correspondant)"
        puts " "
        puts "1 - Ninja/Assassin"
        puts "2 - Voleur"
        puts "3 - Ranger"
        puts "4 - Ménestrel"
        puts "5 - Ingénieur"
        puts "6 - Pirate"
        puts "7 - Revenir en arrière"
        puts " "
        classe = gets.chomp.to_i
        until classe > 0 && classe < 8    
          puts "Il faut choisir un nombre entre 1 et 7"
         classe = gets.chomp.to_i
        end
        if classe == 1
          gnninja.personnage
        elsif classe == 2
          gnvoleur.personnage
        elsif classe == 3
          gnranger.personnage
        elsif classe == 4
          gnmenestrel.personnage
        elsif classe == 5
          gningenieur.personnage
        elsif classe == 6
          gnpirate.personnage
        end
      else
        puts "Que veux-tu faire ?"
        break
      end
      puts "Veux-tu créer un autre personnage?"
      autre = gets.chomp.capitalize
      until autre == "Oui" || autre == "Non"
        puts "Il faut répondre par oui ou par non."
        autre = gets.chomp.capitalize
      end
      if autre == "Oui"
        puts "Quelle origine veux-tu? (entrer le chiffre correspondant)"
      else
        puts "Que veux-tu faire?"
        break
      end
    end
  else
    puts "A la prochaine l'ami !"
    break
  end
end