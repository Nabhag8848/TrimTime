import { NextFunction, Request, Response } from "express";
import { createBarber } from "../../lib/createBarber";

export class BarberController {
  static newBarber = async (req: Request, res: Response, next: NextFunction) => {
    let { username, password, email } = req.body;
    const user = await createBarber(username, email, password);
    res.status(201).type("json").send(user);
  };

  static test = async (req: Request, res: Response, next: NextFunction) => {
    res.status(200).type("json").send({ message: "test" });
  };
}
