import express from 'express';
import pool from '../db.js';
// import { authenticateToken } from '../middleware/auth.js';

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    const userId = 1 // hardcoded for testing
    const result = await pool.query('SELECT * FROM get_total_user_visits($1);', [userId]);
    res.json(result.rows);
  } catch (err) {
    console.error('Error fetching visits:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

export default router;
