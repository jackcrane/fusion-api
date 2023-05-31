import cryptoRandomString from "crypto-random-string";
import { prisma } from "../../lib/db";
import { a } from "../../lib/auth";

export const post = [
  a,
  async (req, res) => {
    const { userId } = req.body;
    const code = cryptoRandomString({ length: 6, type: "numeric" });
    const invitation = await prisma.invitation.create({
      data: {
        inviterId: userId,
        code,
        User: { connect: { id: req.user.id } },
      },
    });
    return res.json(invitation);
  },
];
