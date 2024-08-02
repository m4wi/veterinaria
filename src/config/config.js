import dotenv from 'dotenv'
dotenv.config()

export const PSQL_URL = process.env.PSQL
export const PORT = process.env.PORT || 3000
