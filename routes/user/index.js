import { prisma } from "../../lib/db";

export const get = async (req, res) => {
  const user = await prisma.user.findUnique({
    where: { id: req.user.id },
    include: { partner: true },
  });
  return res.json(user);
};
