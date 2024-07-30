import XlsxPopulate from 'xlsx-populate'

// Main function to create the Excel file
const generator = async (data, headers) => {
  const workbook = await XlsxPopulate.fromBlankAsync()
  const sheet = workbook.sheet(0)

  let currentCol = 1
  const headerRow1 = 4
  const headerRow2 = 5

  headers.categories.forEach(category => {
    const subHeader = category.name
    const fields = category.fields

    // Merge cells for the sub-header
    const fieldsLength = Object.keys(fields).length
    const startCol = currentCol
    const endCol = currentCol + fieldsLength - 1

    sheet.range(headerRow1, startCol, headerRow1, endCol).merged(true).value(subHeader).style({ horizontalAlignment: 'center' })

    Object.keys(fields).forEach(field => {
      sheet.cell(headerRow2, currentCol).value(field).style({
        wrapText: true,
        horizontalAlignment: 'center'
      })
      currentCol++
    })
  })
  sheet.range(1, 1, 1, currentCol).merged(true).value(headers.tableName).style({
    wrapText: true,
    horizontalAlignment: 'center'
  })
  sheet.range(2, 3, 2, currentCol).merged(true).value(headers.text1).style({ verticalAlignment: 'center' })
  const now = new Date()
  const formatedDate = now.toLocaleDateString('es-ES')
  sheet.range(3, 3, 3, currentCol).merged(true).value(headers.text2 + formatedDate).style({ verticalAlignment: 'center' })

  // set width
  for (let col = 1; col <= currentCol; col++) {
    sheet.column(col).width(15)
  }

  data.forEach((row, rowIndex) => {
    let currentCol = 1
    headers.categories.forEach(category => {
      const fields = category.fields
      Object.values(fields).forEach(field => {
        sheet.cell(rowIndex + 6, currentCol).value(row[field]).style({
          wrapText: true,
          horizontalAlignment: 'center',
          verticalAlignment: 'center'
        })
        currentCol++
      })
    })
  })

  return workbook.outputAsync()
}

export default generator
