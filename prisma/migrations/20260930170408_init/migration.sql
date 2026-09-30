/*
  Warnings:

  - You are about to drop the `Evento` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `nome` on the `Palestrante` table. All the data in the column will be lost.
  - Added the required column `name` to the `Palestrante` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Evento";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Eventos" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "local" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "palestranteId" INTEGER,
    CONSTRAINT "Eventos_palestranteId_fkey" FOREIGN KEY ("palestranteId") REFERENCES "Palestrante" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Palestrante" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL
);
INSERT INTO "new_Palestrante" ("email", "id") SELECT "email", "id" FROM "Palestrante";
DROP TABLE "Palestrante";
ALTER TABLE "new_Palestrante" RENAME TO "Palestrante";
CREATE UNIQUE INDEX "Palestrante_email_key" ON "Palestrante"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
