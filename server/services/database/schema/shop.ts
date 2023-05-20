import mongoose, { Schema } from "mongoose";
import { IBarberShop } from "../../../types/barber";

const shopSchema = new Schema({
  barberInfo: {
    type: Schema.Types.Mixed,
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
  },
  services: [{ type: String }],
  shop_name: { type: String, required: true, unique: true },
  phone_number: { type: String, unique: true },
  location: { type: String, unique: true },
  open_time: { type: String },
  closed_time: { type: String },
  account_number: { type: String, unique: true },
  review: [{ type: String }],
});

export default mongoose.model<IBarberShop>("BarberShop", shopSchema);
