import { IUser } from "../types/user";
import { Customer } from "../services/database/schema/customer";

export const getUserByUsername = async (
  username: string
): Promise<IUser | undefined> => {
  console.log("finding user if exist");
  const isUserExist = await Customer.find({ username });
  if (isUserExist.length === 0) return undefined;
  return isUserExist[0];
};
