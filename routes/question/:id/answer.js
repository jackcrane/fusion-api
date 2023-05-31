import { prisma } from "../../../lib/db";

export const put = async (req, res) => {
  const { id } = req.params;
  const { answer } = req.body; // ["Yes", "No", "Maybe"]
  const userId = req.user?.id;
  if (!userId) return res.status(401).json({ error: "Unauthorized" });
  await prisma.userCardAnswer.create({
    data: {
      userId,
      cardId: id,
      answer,
    },
  });
  return res.status(200).json({ success: true });
};
