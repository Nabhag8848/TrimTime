import mongoose, { Schema } from "mongoose";
import { IBarber } from "../../../types/barber";

const barberSchema = new Schema({
  id: { type: String, required: true, unique: true },
  username: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  role: {
    type: String,
    enum: ["BARBER"],
    required: true,
    default: "BARBER",
  },
});

export const Barber =  mongoose.model<IBarber>("Barber", barberSchema);
