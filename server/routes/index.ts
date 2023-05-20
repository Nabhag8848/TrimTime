import { Router } from "express";
import { customerRouter } from "./customer";
const routes = Router();

routes.use("/customer", customerRouter);

export { routes }
