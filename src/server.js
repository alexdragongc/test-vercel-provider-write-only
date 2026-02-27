import express, { json } from "express";
const app = express();

app.use(json());

app.get("/", (_req, res) => {
  res.send("Hello, World!");
});

app.get("/api/hello", (_, res) => {
  res.json({ message: "Hello from the API!" });
});

export default app; // Export for Vercel serverless function
