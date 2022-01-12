export type Citizen = 'Citizen' | 'No citizen';

export class Student {
  name: string;
  lastName: string;
  age: number;
  citizen: Citizen;

  constructor(name: string, lastName: string, age: number, citizen: Citizen = "No citizen") {
    this.name = name;
    this.lastName = lastName;
    this.age = age;
    this.citizen = citizen;
  }
}
