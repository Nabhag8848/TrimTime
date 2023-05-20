import mongoose, { Schema } from "mongoose";
import { IUser } from "../../../types/user";

const customerSchema = new Schema({
  id: { type: String, required: true, unique: true },
  username: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  role: {
    type: String,
    enum: ["CUSTOMER"],
    required: true,
    default: "CUSTOMER",
  },
});

export const Customer = mongoose.model<IUser>("Customer", customerSchema);
