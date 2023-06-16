import express from "express";
import createRouter from "express-file-routing";
import { verifyToken } from "./lib/auth";

const app = express();
app.use(express.json());
app.use(verifyToken);
await createRouter(app);

app.listen(3000, () => {
  console.log("Listening on port 3000");
});
