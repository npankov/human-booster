export type RegionAPI = {
  nom: string,
  code: number
}

export type DepartementAPI = {
  nom: string,
  code: number,
  codeRegion: string
}

export type Region = {
  nom: string,
  code: number,
  listDepartements?: Departement[]
}

export type Departement = {
  nom: string,
  code: number
}
