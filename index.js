import app from './src/app.js'

app.listen(app.get('port'), () => {
  console.log(`Server listen on port ${app.get('port')}`)
})