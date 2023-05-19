import express, {
  ErrorRequestHandler,
  Express,
  Request,
  Response,
} from "express";
import dotenv from "dotenv";
import bodyParser from "body-parser";
import cors from "cors";

dotenv.config();

const app: Express = express();
const port = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(cors());

app.get("/", (req: Request, res: Response) => {
  res.send("Express + TypeScript Server");
});
app.use(((err, req, res, next) => {
  if (res.headersSent) {
    return next(err);
  }
  res.status(500).send({
    statusCode: 500,
    response: {
      error: err,
    },
  });
}) as ErrorRequestHandler);

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});
