CREATE PROCEDURE dbo.Apu_Parametros_Insert
(
	@Id varchar(17),
	@Codigo varchar(200),
	@Equipo_Apu_Indice_Id varchar(17),
	@ManoObra_Apu_Indice_Id varchar(17),
	@Porcentaje_Costo_Indirecto numeric(5, 2),
	@Int_Sucursal_Id varchar(17),
	@Apu_Mano_Obra_Id varchar(17),
	@Estado char(3),
	@Apu_Subtitulo_Id_Oferta_Rubro_Pred varchar(17)
)
AS
	SET NOCOUNT OFF;
INSERT INTO [Apu_Parametros] ([Id], [Codigo], [Equipo_Apu_Indice_Id], [ManoObra_Apu_Indice_Id], [Porcentaje_Costo_Indirecto], [Int_Sucursal_Id], [Apu_Mano_Obra_Id], [Estado], [Apu_Subtitulo_Id_Oferta_Rubro_Pred]) VALUES (@Id, @Codigo, @Equipo_Apu_Indice_Id, @ManoObra_Apu_Indice_Id, @Porcentaje_Costo_Indirecto, @Int_Sucursal_Id, @Apu_Mano_Obra_Id, @Estado, @Apu_Subtitulo_Id_Oferta_Rubro_Pred);
	
SELECT Id, Codigo, Equipo_Apu_Indice_Id, ManoObra_Apu_Indice_Id, Porcentaje_Costo_Indirecto, Int_Sucursal_Id, Apu_Mano_Obra_Id, Estado, Apu_Subtitulo_Id_Oferta_Rubro_Pred FROM Apu_Parametros WHERE (Id = @Id)