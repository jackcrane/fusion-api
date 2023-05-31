import { generateToken } from "../../lib/auth";
import { prisma } from "../../lib/db";

export const post = async (req, res) => {
  const { name } = req.body;
  const user = await prisma.user.create({
    data: {
      name,
    },
  });
  const token = generateToken(user);
  return res.json({ token });
};
