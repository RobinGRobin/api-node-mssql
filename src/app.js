import express from "express";
import config from "./config";
import routesOne from "./routes/routes";;

const app = express();

app.set('port', config.port);

// Routes
app.get("/", (req,res) => {
    res.send("WELCOME");
});
app.use(routesOne);

export default app;