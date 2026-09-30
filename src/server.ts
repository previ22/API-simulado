import express from 'express'
import eventosRoutes from "./Routes/eventosRoutes"
import palestrantesRoutes from "./Routes/pelestrantesRoutes"
 
const app = express()
 
app.use(express.json())
app.use("/api/eventos", eventosRoutes)
app.use("/api/palestrantes", palestrantesRoutes)
 
app.listen(3000, () => {
    console.log("Servidor rodando na porta 3000")
})    