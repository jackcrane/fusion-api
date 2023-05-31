/*
  Warnings:

  - You are about to alter the column `status` on the `Dare` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(1))`.
  - You are about to alter the column `answer` on the `UserCardAnswer` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Enum(EnumId(0))`.

*/
-- AlterTable
ALTER TABLE `Dare` MODIFY `status` ENUM('Pending', 'Accepted', 'Declined', 'Completed') NOT NULL;

-- AlterTable
ALTER TABLE `UserCardAnswer` MODIFY `answer` ENUM('Yes', 'No', 'Maybe') NOT NULL;
