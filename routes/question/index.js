/*
Create and implement an endpoint for `question`. It should return a question for a user to answer
The question should

- Be a card from a cardset that the user has access to
- Not be a card that the user has already answered
- Where possible, be a card that the user's partner has answered
- Where possible, be a random card that satisfies the above conditions and card returns should not necessarily be in the same order for both users
- If user has answered all cards, return `204 No Content`
*/

import { prisma } from "../../lib/db";

export const get = async (req, res) => {
  const userId = req.user?.id;
  if (!userId) return res.status(401).json({ error: "Unauthorized" });
  const user = await prisma.user.findUnique({
    where: { id: userId },
    include: {
      Cardsets: {
        include: {
          Cards: {
            include: {
              UserCardAnswers: {
                where: { userId },
              },
            },
          },
        },
      },
    },
  });

  if (!user) {
    return res.status(404).json({ error: "User not found" });
  }

  const cardsets = user.Cardsets;
  const eligibleCards = [];

  for (const cardset of cardsets) {
    for (const card of cardset.Cards) {
      if (card.UserCardAnswers.length === 0) {
        eligibleCards.push(card);
      }
    }
  }

  if (eligibleCards.length === 0) {
    return res.status(204).json();
  }

  const card = eligibleCards[Math.floor(Math.random() * eligibleCards.length)];
  delete card.UserCardAnswers;
  return res.status(200).json(card);
};
