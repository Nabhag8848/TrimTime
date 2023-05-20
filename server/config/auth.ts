import * as dotenv from "dotenv";
dotenv.config();

const config = {
  jwt: {
    secret: process.env.JWT_SECRET,
    audience: process.env.JWT_AUDIENCE,
    issuer: process.env.JWT_ISSUER,
  },
  port: process.env.PORT || 5000,
  prefix: process.env.API_PREFIX || "api",
};

export default config;
