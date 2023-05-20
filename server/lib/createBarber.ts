import { ClientError } from "../middleware/exception/clientError";
import { v4 as uuidv4 } from "uuid";
import bcrypt from "bcrypt";
import { getBarberByUsername } from "./getBarberByUsername";
import { IBarber } from "../types/barber";
import { Barber } from "../services/database/schema/barber";
export const createBarber = async (
  username: string,
  email: string,
  password: string
): Promise<IBarber> => {
  username = username.trim();
  password = password.trim();
  email = email.trim();

  // Reader: Add checks according to your custom use case.
  if (username.length === 0) throw new ClientError("Invalid username");
  if (password.length === 0) throw new ClientError("Invalid password");
  if (email.length === 0) throw new ClientError("Invalid email");

  // Check for duplicates.
  if ((await getBarberByUsername(username, email)) != undefined)
    throw new ClientError("Username is taken");

  const hashPassword = await bcrypt.hash(password, 12);

  const user = new Barber({
    id: uuidv4(),
    username,
    email,
    password: hashPassword,
  });

  await user.save();
  return user;
};
