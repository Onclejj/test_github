import 'dart:io';
import 'main3.dart';


//main principal
void main(){
  // je déclare les variable string: nom du cour, entier :nombre des étudiants, double: la moyen minimale 
String nom_cours="informatique";
int nombre_et=7;
double moye_min_val=50;
//j'affiche le nom du cour, nombre d'étudiant et la moyenne de validation
print("");
print("INFORMATIONS DE BASE");
print("");
print("le cours d'$nom_cours est enseigné à $nombre_et étudiants, mais qui peut reussi que celui qui aura au moins $moye_min_val %");
//je crée une liste de mes 7 étudiant
List<String> et= ["banza","ilunga","jean","daguerre","jacques","ngoy","mulobe"];
//j'affiche la liste de mes étudiant
print("");
print("VOICI LES NOMS DE MES ETUDIANTS:");
print("les étudiant sont :");
//j'affiche les étudiants avec la boucle "for"
for(var et in et){
print (et);}
//j'ajoute l'étudiant "kalala" à la liste
print("");
print("j'ajoute un étudiant nommé kalala à la liste.");
et.add("kalala");
//j'affiche de nouveau la liste des étudiants mis à jour
print(et);
//j'insere le map pour les étudiants et leurs moyennes
print("");
print("la moyenne par étudiant:");
Map<String ,int> moyennes={
    "banza":71,
    "ilunga":66,
    "jean":58,
    "daguerre":60,
    "jacques":61,
     "ngoy":56,
    "mulobe":45,
    "kalala":69 
  };
  moyennes.forEach((a,b){
    print("$a:$b");
    
    
  });
  
print("");
// Appel de la classe qui vien de main2
print("liste des etudiants, leurs âge et leurs cotes :");
  Etudiant e1 = Etudiant(1, "pascal", 25, [12, 14, 10]);
  Etudiant e2 = Etudiant(2, "david", 22, [15, 16, 14]);
  Etudiant e3 = Etudiant(3, "DAGUERRE", 19, [15, 26, 10]);
  Etudiant e4 = Etudiant(4, "NGOY", 228, [18, 14, 12]);
  Etudiant e5 = Etudiant(5, "ilunga", 20, [10, 14, 16]);
  Etudiant e6 = Etudiant(6, "banza", 21, [19, 14, 13]);
  Etudiant e7 = Etudiant(7, "kalala", 23, [17, 15, 11]);
  List<Etudiant> etudiants = [e1, e2, e3, e4, e5, e6, e7];

  for (Etudiant e in etudiants) {
    e.afficherInfos();
  }
  //affichage du meilleur éetudiant de la classe
  Etudiant? meilleur = meilleurEtudiant(etudiants);
  if (meilleur != null) {
    print(
        "dans votre classe le meilleur étudiant c'est ${meilleur.nom} avec la  moyenne de ${meilleur.calculerMoyenne().toStringAsFixed(2)}");
  }
  double moyenneClasseValeur = moyenneClasse(etudiants);
  print("La moyenne de la classe est de ${moyenneClasseValeur.toStringAsFixed(2)}");
 
 //la liste des étudiants à choisir à parir du MENU
 List<Etudiant> classe = [];
  int choix;
//le MENU
  do {
    print("\n     MENU PRINCIPAL ");
    print("1. Ajouter un étudiant");
    print("2. Afficher tous les étudiants");
    print("3. Afficher le meilleur étudiant");
    print("4. Afficher la moyenne de la classe");
    print("5. Rechercher l'étudiant par ID");
    print("0. Quitter");
    stdout.write("Votre choix : ");
// le choix sur le Menu avec la structure des cas.
    choix = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

    switch (choix) {
      case 1:
        ajouterEtudiant(classe);
        break;

      case 2:
        afficherTous(classe);
        break;

      case 3:
        afficherMeilleur(classe);
        break;

      case 4:
        afficherMoyenneClasse(classe);
        break;
      case 5:
       rechercherEtudiantParId(classe);
      break;

      case 0:
        print("👋 Programme terminé");
        break;

      default:
        print("❌ Choix invalide !");
    }
  } while (choix != 0);
  
}

// le fonctionnement du MENU qui vient de main3.dart
void ajouterEtudiant(List<Etudiant> classe) {
  stdout.write("Entrez l'ID de l'étudiant : ");
  int id = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  stdout.write("Entrez le nom de l'étudiant : ");
  String nom = stdin.readLineSync() ?? "";

  stdout.write("Entrez l'âge de l'étudiant : ");
  int age = int.tryParse(stdin.readLineSync() ?? "") ?? 0;

  List<double> notes = [];
  
  do {
    stdout.write("Entrez une note (ou tapez 'stop' pour terminer) : ");
    String input = stdin.readLineSync() ?? "";
    if (input.toLowerCase() == 'stop') {
      break;
    }
    double note = double.tryParse(input) ?? -1;
    if (note >= 0) {
      notes.add(note);
    } else {
      print("❌ Note invalide !");
    }
  } while (true);

  Etudiant nouvelEtudiant = Etudiant(id, nom, age, notes);
  classe.add(nouvelEtudiant);
  print("✅ Étudiant ajouté avec succès !");
}
void rechercherEtudiantParId(List<Etudiant> etudiants) {
  if (etudiants.isEmpty) {
    print("Aucun étudiant enregistré ❌");
    return;
  }

  stdout.write("Entrer l'ID de l'étudiant : ");
  int idRecherche = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  for (Etudiant e in etudiants) {
    if (e.id == idRecherche) {
      print("\n--- ÉTUDIANT TROUVÉ ---");
      e.afficherInfos();
      return; // stop dès qu'on trouve
    }
  }

  print("Aucun étudiant trouvé avec l'ID $idRecherche ❌");
}



