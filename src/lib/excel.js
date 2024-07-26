import XlsxPopulate from 'xlsx-populate'

// Main function to create the Excel file
const generator = async (data, headers) => {
  const workbook = await XlsxPopulate.fromBlankAsync()
  const sheet = workbook.sheet(0)

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

export default generator
