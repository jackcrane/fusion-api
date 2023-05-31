import { prisma } from "../../lib/db";

export const post = async (req, res) => {
  const { code } = req.body;
  const invitation = await prisma.invitation.findUnique({ where: { code } });
  if (!invitation) {
    res.status(400).json({ message: "Invalid code" });
    return;
  }

  await prisma.user.update({
    where: { id: req.user.id },
    data: { partnerId: invitation.inviterId },
  });

  // Update inviter's partnerId as well
  await prisma.user.update({
    where: { id: invitation.inviterId },
    data: { partnerId: req.user.id },
  });

  return res.json({ message: "Invitation accepted" });
};
