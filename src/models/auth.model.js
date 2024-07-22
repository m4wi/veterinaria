import sequelize from '../config/db.js'

const model = {}

model.isValidArete = async (arete) => {
  return sequelize.query(`SELECT COUNT(*) AS state FROM Tbl_animal WHERE ID_arete = "${arete}";`, { raw: true})
  .then(([result, metadata]) => {
    return result[0].state
  })
  .catch((error) => {
    throw error
  })
}
model.saveAnimal = async (data) => {
  // CALL saveAnimal(${arete}, ${sexo},${especie},${raza},${padre},${madre},${t_ingreso},${t_fecha})
  const { arete, sexo, especie, raza, padre, madre, t_ingreso, t_fecha } = data
  return sequelize.query(`CALL saveAnimal("${arete}", "${sexo}",${especie},${raza},"${padre}","${madre}","${t_ingreso}","${t_fecha}");`,{raw: true})
  .then(([result, metadata]) => {

  })
  .catch((error) => {
    throw error
  })
}


/*
console.log(
await model.saveAnimal({
  arete: 'HS-10',
  sexo: 'Macho',
  especie: 1,
  raza: 1,
  padre: "HS-1",
  madre: "HS-2",
  t_ingreso: 'Trazlado',
  t_fecha: '20-05-01'
}))*/

export default model;