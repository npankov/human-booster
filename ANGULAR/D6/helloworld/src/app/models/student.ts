export type Citizen = 'Citizen' | 'No citizen';

export class Student {
  prenom: string;
  nom: string;
  age: number;
  citizen: Citizen;

  constructor(prenom: string, nom: string, age: number, citizen: Citizen) {
    this.prenom = prenom;
    this.nom = nom;
    this.age = age;
    this.citizen = citizen;
  }
}
