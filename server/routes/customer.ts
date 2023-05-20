import { Router } from "express";
import { CustomerController } from "./controller/customer";
import { asyncHandler } from "../middleware/asyncHandler";

const router = Router();

router.post("/signup", [], asyncHandler(CustomerController.newCust));
router.get("/", [], asyncHandler(CustomerController.test));

export { router as customerRouter };
