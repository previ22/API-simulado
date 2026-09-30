-- CreateTable
CREATE TABLE "Evento" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT NOT NULL,
    "local" TEXT NOT NULL,
    "dataEvento" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Palestrante" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "EventoPalestrante" (
    "idEvento" INTEGER NOT NULL,
    "idPalestrante" INTEGER NOT NULL,

    PRIMARY KEY ("idEvento", "idPalestrante"),
    CONSTRAINT "EventoPalestrante_idEvento_fkey" FOREIGN KEY ("idEvento") REFERENCES "Evento" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "EventoPalestrante_idPalestrante_fkey" FOREIGN KEY ("idPalestrante") REFERENCES "Palestrante" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Palestrante_email_key" ON "Palestrante"("email");
