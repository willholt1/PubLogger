import express from 'express';
import dotenv from 'dotenv';
import visitsRouter from './routes/visits.js';

dotenv.config();
const app = express();

app.get('/', (req, res) => {
  res.send('Pub Logger API is running 🚀');
});


app.use(express.json());
app.use('/visits', visitsRouter);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API running on port ${PORT}`));
