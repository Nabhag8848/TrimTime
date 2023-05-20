import { Router } from "express";
import { customerRouter } from "./customer";
import { barberRouter } from "./barber";
const routes = Router();

routes.use("/customer", customerRouter);
routes.use("/barber", barberRouter);

export { routes }
