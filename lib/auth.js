import jwt from "jsonwebtoken";
import { prisma } from "./db";

export const generateToken = (user) => {
  return jwt.sign({ id: user.id }, process.env.JWT_SECRET, {
    expiresIn: "7d",
  });
};

export const verifyToken = async (req, res, next) => {
  const token = req.headers["authorization"]?.split(" ")[1];
  if (!token) {
    req.user = null;
    return next();
  }
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    let _user = await prisma.user.findUnique({ where: { id: decoded.id } });
    if (!_user) {
      req.user = null;
      return next();
    } else {
      req.user = _user;
    }
    return next();
  } catch (err) {
    req.user = null;
    return next();
  }
  return next();
};

export const a = async (req, res, next) => {
  if (!req.user) {
    return res.status(401).json({});
  }
  next();
};
