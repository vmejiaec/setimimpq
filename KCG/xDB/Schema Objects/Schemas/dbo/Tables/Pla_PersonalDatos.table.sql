CREATE TABLE [dbo].[Pla_PersonalDatos] (
    [Id]                  INT           IDENTITY (1, 1) NOT NULL,
    [Per_Personal_Id]     VARCHAR (17)  NOT NULL,
    [Pie_Firma_Nombre]    VARCHAR (200) NOT NULL,
    [Pie_Firma_Cargo]     VARCHAR (200) NOT NULL,
    [Email_Inst]          VARCHAR (200) NOT NULL,
    [Pie_Firma_Iniciales] VARCHAR (200) NOT NULL
);

