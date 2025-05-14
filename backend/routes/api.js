import express from 'express';
import { db } from '../db.js';

const router = express.Router();

router.get('/total-students', async (req, res) => {
  const [rows] = await db.execute('SELECT COUNT(*) AS total FROM students');
  res.json(rows[0]);
});

router.get('/total-female', async (req, res) => {
  const [rows] = await db.execute("SELECT COUNT(*) AS total FROM students WHERE gender = 'female'");
  res.json(rows[0]);
});

router.get('/total-male', async (req, res) => {
  const [rows] = await db.execute("SELECT COUNT(*) AS total FROM students WHERE gender = 'male'");
  res.json(rows[0]);
});

router.get('/attendance-rate', async (req, res) => {
  const [rows] = await db.execute(`SELECT status, COUNT(*) AS count FROM attendance GROUP BY status`);
  res.json(rows);
});

router.get('/grades-trend', async (req, res) => {
  const [rows] = await db.execute(`SELECT name, grade FROM students`);
  res.json(rows);
});

router.get('/pass-fail', async (req, res) => {
  const [rows] = await db.execute(`SELECT passed, COUNT(*) AS count FROM students GROUP BY passed`);
  res.json(rows);
});

router.get('/student-subject', async (req, res) => {
  const [rows] = await db.execute(`SELECT subject, COUNT(*) AS count FROM students GROUP BY subject`);
  res.json(rows);
});

export default router;
