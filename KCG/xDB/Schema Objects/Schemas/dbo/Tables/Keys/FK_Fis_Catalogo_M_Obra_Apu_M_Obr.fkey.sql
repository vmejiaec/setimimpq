ALTER TABLE [dbo].[Fis_Catalogo_Mano_Obra]
    ADD CONSTRAINT [FK_Fis_Catalogo_M_Obra_Apu_M_Obr] FOREIGN KEY ([Apu_Mano_Obra_Id]) REFERENCES [dbo].[Apu_Mano_Obra] ([Id]) ON DELETE NO ACTION ON UPDATE NO ACTION;

