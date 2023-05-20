import { Roles } from "../enum/roles";
import { Document } from "mongoose";

export interface IBarberShop extends Document {
  barberInfo: IBarber;
  services?: string[];
  shop_name: string;
  phone_number?: string;
  location?: string;
  open_time?: string;
  closed_time?: string;
  account_number?: string;
  review?: string[];
}

export interface IBarber extends Document {
  id: string;
  username: string;
  email: string;
  password: string;
  role: Roles.BARBER;
}
