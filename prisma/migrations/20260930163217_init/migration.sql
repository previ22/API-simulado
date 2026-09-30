/*
  Warnings:

  - You are about to drop the `EventoPalestrante` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `dataEvento` on the `Evento` table. All the data in the column will be lost.
  - Added the required column `data` to the `Evento` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "EventoPalestrante";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Evento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "data" DATETIME NOT NULL,
    "descricao" TEXT NOT NULL,
    "local" TEXT NOT NULL DEFAULT 'A definir',
    "palestranteId" INTEGER,
    CONSTRAINT "Evento_palestranteId_fkey" FOREIGN KEY ("palestranteId") REFERENCES "Palestrante" ("id") ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "new_Evento" ("descricao", "id", "local", "nome") SELECT "descricao", "id", "local", "nome" FROM "Evento";
DROP TABLE "Evento";
ALTER TABLE "new_Evento" RENAME TO "Evento";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
