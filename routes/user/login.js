import { generateToken } from "../../lib/auth";
import { prisma } from "../../lib/db";

export const post = async (req, res) => {
  console.log(req.user);
  const { userId } = req.body;
  console.log(userId);
  const user = await prisma.user.findUnique({ where: { id: userId } });
  console.log(user);
  if (!user) {
    res.status(400).json({ message: "Invalid user" });
    return;
  }
  const token = generateToken(user);
  return res.json({ token });
};
