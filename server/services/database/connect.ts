import mongoose from "mongoose";
import dotenv from "dotenv";
dotenv.config();

class Database {
  _connect() {
    mongoose
      .connect(`${process.env.MONGO_URL}`)
      .then(() => {
        console.log("Database connection successful");
      })
      .catch((err) => {
        console.error("Database connection error");
      });
  }
}

export const db = new Database();
