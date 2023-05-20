import express, {
  ErrorRequestHandler,
  Express,
  Request,
  Response,
} from "express";
import dotenv from "dotenv";
import bodyParser from "body-parser";
import cors from "cors";
import { errorHandler } from "./middleware/errorHandler";
import { routes } from "./routes";
import { db } from "./services/database/connect";

dotenv.config();
db._connect();
const app: Express = express();
const port = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(cors());
app.use(errorHandler);
app.use(routes);

app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
