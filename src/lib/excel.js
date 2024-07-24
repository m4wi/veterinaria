import XlsxPopulate from 'xlsx-populate';

const headers = {
  "ARETE": "id_arete",
  "EDAD": "bio_fecha",
  "PESO": "bio_peso",
  "C_CORPORAL": "bio_condicioncorporal",
  "RAZA": "raza_tipo",
  "ESPECIE": "especie_tipo",
  "C. DENTARIA": "bio_cantdentaria",
  "CANINOS": "bio_caninos",
  "ALTURA_CRUZ": "bio_alturacruz",
  "ALTURA_GRUPA": "bio_altogrupa",
  "LONG_CUERPO": "bio_largocuerpo",
  "ANCHO_GRUPA": "bio_anchogrupa",
  "CIR_CUERPO": "bio_circunferenciacuerpo",
  "AMP_PECHO": "bio_circunferenciacuerpo",
  "ANCHO_CABEZA": "bio_anchocabeza",
  "LARGO_CABEZA": "bio_largocabeza",
  "ISQUIONES": "bio_isquiones",
  "OREJAS": "bio_largoorejas",
  "LARGO_CUELLO": "bio_largocuello",
  "COMISURA_VULVAR": "bio_comisuravulvar",
  "TREN_ANTERIOR": "bio_aplomoanterior",
  "DENSIDAD": "vellon_densidad",
  "DEFINICION": "vellon_definicion",
  "LON_MECHA": "vellon_longitudmecha",
  "CALCE": "vellon_calce",
  "UNIFORMIDAD": "vellon_uniformidad",
  "TUCO": "vellon_tuco",
  "COLOR": "vellon_color",
  "CLASE": "vellon_clase"
};

// Main function to create the Excel file
const downloader = async (data) => {
  const workbook = await XlsxPopulate.fromBlankAsync();
  const sheet = workbook.sheet(0);

  // Set the headers
  Object.keys(headers).forEach((header, index) => {
    sheet.cell(1, index + 1).value(header)
  })
  // Set the data
  data.forEach((row, rowIndex) => {
    Object.values(headers).forEach((field, colIndex) => {
      sheet.cell(rowIndex + 2, colIndex + 1).value(row[field])
    })
  })

  return workbook.outputAsync()
}

export default downloader
