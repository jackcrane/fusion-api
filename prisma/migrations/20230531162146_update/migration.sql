/*
  Warnings:

  - You are about to drop the column `question` on the `Card` table. All the data in the column will be lost.
  - Added the required column `questionBottom` to the `Card` table without a default value. This is not possible if the table is not empty.
  - Added the required column `questionTop` to the `Card` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `Card` DROP COLUMN `question`,
    ADD COLUMN `questionBottom` VARCHAR(191) NOT NULL,
    ADD COLUMN `questionTop` VARCHAR(191) NOT NULL;
