-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `partner_id` VARCHAR(191) NULL,

    UNIQUE INDEX `User_partner_id_key`(`partner_id`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Card` (
    `id` VARCHAR(191) NOT NULL,
    `question` VARCHAR(191) NOT NULL,
    `card_set_id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserCardAnswer` (
    `userId` VARCHAR(191) NOT NULL,
    `cardId` VARCHAR(191) NOT NULL,
    `answer` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`userId`, `cardId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CardSet` (
    `id` VARCHAR(191) NOT NULL,
    `theme` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Dare` (
    `id` VARCHAR(191) NOT NULL,
    `status` VARCHAR(191) NOT NULL,
    `due` DATETIME(3) NOT NULL,
    `points` INTEGER NOT NULL,
    `card_id` VARCHAR(191) NOT NULL,
    `user_id` VARCHAR(191) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_CardSetPurchases` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_CardSetPurchases_AB_unique`(`A`, `B`),
    INDEX `_CardSetPurchases_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `User` ADD CONSTRAINT `User_partner_id_fkey` FOREIGN KEY (`partner_id`) REFERENCES `User`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Card` ADD CONSTRAINT `Card_card_set_id_fkey` FOREIGN KEY (`card_set_id`) REFERENCES `CardSet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserCardAnswer` ADD CONSTRAINT `UserCardAnswer_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserCardAnswer` ADD CONSTRAINT `UserCardAnswer_cardId_fkey` FOREIGN KEY (`cardId`) REFERENCES `Card`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dare` ADD CONSTRAINT `Dare_card_id_fkey` FOREIGN KEY (`card_id`) REFERENCES `Card`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Dare` ADD CONSTRAINT `Dare_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CardSetPurchases` ADD CONSTRAINT `_CardSetPurchases_A_fkey` FOREIGN KEY (`A`) REFERENCES `CardSet`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CardSetPurchases` ADD CONSTRAINT `_CardSetPurchases_B_fkey` FOREIGN KEY (`B`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
