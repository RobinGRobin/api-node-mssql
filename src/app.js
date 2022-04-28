import express from "express";
import config from "./config";

const app = express();

app.set('port', config.port);

// Routes
app.get("/", (req,res) => {
    res.send("WELCOME");
});

export default app;