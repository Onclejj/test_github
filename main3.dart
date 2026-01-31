import 'dart:io';

// la création de la classe Etudiant
class Etudiant {
  int id;
  String nom;
  int age;
  List<double> notes;
//constructeur
  Etudiant(this.id, this.nom, this.age, this.notes);

  double calculerMoyenne() {
    if (notes.isEmpty) return 0.0;
    double somme = 0.0;
    for (double note in notes) {
      somme += note;
    }
    return somme / notes.length;
  }
// Affichage de mention Admis ou ajourné
  String get mention => calculerMoyenne() < 10 ? "Ajourné" : "Admis";

  void afficherInfos() {
    print("ID: $id | Nom: $nom | Âge: $age");
    print("Notes: $notes");
    print("Moyenne: ${calculerMoyenne().toStringAsFixed(2)} | Mention: $mention");
    print("------------------------------------");
  }
}

// ===================== FONCTIONS =====================
Etudiant? meilleurEtudiant(List<Etudiant> etudiants) {
  if (etudiants.isEmpty) return null;

  Etudiant meilleur = etudiants[0];
  for (Etudiant e in etudiants) {
    if (e.calculerMoyenne() > meilleur.calculerMoyenne()) {
      meilleur = e;
    }
  }
  return meilleur;
}

double moyenneClasse(List<Etudiant> etudiants) {
  if (etudiants.isEmpty) return 0.0;
  double somme = 0.0;

  for (Etudiant e in etudiants) {
    somme += e.calculerMoyenne();
  }
  return somme / etudiants.length;
}

// menu qu'on peut importé sur le fichier main.dart
void main() {
  List<Etudiant> classe = [];
  int choix;
// affichage du Menu
  do {
    print("\n====== MENU ======");
    print("1. Ajouter un étudiant");
    print("2. Afficher tous les étudiants");
    print("3. Afficher le meilleur étudiant");
    print("4. Afficher la moyenne de la classe");
    print("0. Quitter");
    stdout.write("Votre choix : ");
// choix sur le menu
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

// action du menu
void ajouterEtudiant(List<Etudiant> classe) {
  //ajout de l'étudiant
  stdout.write("ID : ");
  int id = int.parse(stdin.readLineSync()!);

  stdout.write("Nom : ");
  String nom = stdin.readLineSync()!;

  stdout.write("Âge : ");
  int age = int.parse(stdin.readLineSync()!);

  stdout.write("Nombre de notes : ");
  int nbNotes = int.parse(stdin.readLineSync()!);

  List<double> notes = [];
  for (int i = 0; i < nbNotes; i++) {
    stdout.write("Note ${i + 1} : ");
    notes.add(double.parse(stdin.readLineSync()!));
  }

  classe.add(Etudiant(id, nom, age, notes));
  print("✅ Étudiant ajouté avec succès !");
}

void afficherTous(List<Etudiant> classe) {
  if (classe.isEmpty) {
    print("⚠️ Aucun étudiant enregistré.");
    return;
  }

  print("\nLISTE DES ÉTUDIANTS ENREGISTRE ");
  for (Etudiant e in classe) {
    e.afficherInfos();
  }
}

void afficherMeilleur(List<Etudiant> classe) {
  Etudiant? meilleur = meilleurEtudiant(classe);
  if (meilleur == null) {
    print("⚠️ Aucun étudiant enregistré.");
    return;
  }

  print("\n🏆 MEILLEUR ÉTUDIANT");
  meilleur.afficherInfos();
}

void afficherMoyenneClasse(List<Etudiant> classe) {
  if (classe.isEmpty) {
    print("⚠️ Aucun étudiant enregistré.");
    return;
  }

  double moyenne = moyenneClasse(classe);
  print(
      "\n📊 Moyenne générale de la classe : ${moyenne.toStringAsFixed(2)}");
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
   
