import { prisma } from "../../../lib/db";

export const get = async (req, res) => {
  const { id } = req.query;
  const question = await prisma.card.findFirst({
    where: {
      id,
    },
    include: {
      UserCardAnswers: true,
    },
  });
  if (!question) {
    return res.status(404).json({ error: "Question not found" });
  }
  if (!req.params.includeUserCardAnswers) {
    delete question.UserCardAnswers;
  }
  return res.status(200).json(question);
};
