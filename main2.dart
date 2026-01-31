// création de la classe Etudiant
class Etudiant {
  int id;
  String nom;
  int age;
  List<double> notes;
//constructeur
  Etudiant(this.id, this.nom, this.age, this.notes);
//calcule de la moyenne
  double calculerMoyenne() {
    if (notes.isEmpty) return 0;

    double somme = 0;
    for (double n in notes) {
      somme += n;
    }
    return somme / notes.length;
  }
// instruction d'affichage
  void afficherInfos() {
    print("ID : $id");
    print("Nom : $nom");
    print("Âge : $age");
    print("Notes : $notes");
    print("Moyenne : ${calculerMoyenne().toStringAsFixed(2)}");
    print("--------------------");
  }
}

// A mettre au fichier main.dart
void main() {
  Etudiant e1 = Etudiant(1, "pascal", 25, [12, 14, 10]);
  Etudiant e2 = Etudiant(2, "david", 22, [15, 16, 14]);
  Etudiant e3 = Etudiant(3, "daguerre", 19, [15, 26, 10]);
  Etudiant e4 = Etudiant(4, "NGOY", 228, [18, 14, 12]);
  Etudiant e5 = Etudiant(5, "ilunga", 20, [10, 14, 16]);
  Etudiant e6 = Etudiant(6, "banza", 21, [19, 14, 13]);
  Etudiant e7 = Etudiant(7, "kalala", 23, [17, 15, 11]);

  List<Etudiant> etudiants = [e1, e2, e3, e4, e5, e6, e7];

  for (Etudiant e in etudiants) {
    e.afficherInfos();
  }
}
