import { Router } from "express";
import { asyncHandler } from "../middleware/asyncHandler";
import { BarberController } from "./controller/barber";

const router = Router();

router.post("/signup", [], asyncHandler(BarberController.newBarber));
router.get("/", [], asyncHandler(BarberController.test));

export { router as barberRouter };
