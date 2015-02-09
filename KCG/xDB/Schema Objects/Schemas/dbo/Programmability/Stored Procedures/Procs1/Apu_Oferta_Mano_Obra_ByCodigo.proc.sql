CREATE PROCEDURE [dbo].[Apu_Oferta_Mano_Obra_ByCodigo]
(
  @p_Ver_Version_Id VARCHAR(17),
  @p_Codigo varchar (200)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Apu_Oferta_Id,
    Apu_Mano_Obra_Id,
    Apu_Indice_Id,
    Apu_Categoria_Id,
    Estado,
	Costo_Diario,

    dbo._Apu_Oferta_Codigo (Apu_Oferta_Id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (Apu_Oferta_Id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa (Apu_Oferta_Id) Apu_Oferta_Etapa,
    
    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Mano_Obra_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Mano_Obra_Nombre,

    dbo._Apu_Categoria_Codigo(Apu_Categoria_Id) Apu_Categoria_Codigo,
    dbo._Apu_Categoria_Nombre(Apu_Categoria_Id) Apu_Categoria_Nombre, 
     
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
	dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,
   
    dbo._Apu_Oferta_Rubro_Costo_Mano_Obra1 (apu_oferta_id, apu_mano_obra_id) Costo,
    dbo._Apu_Oferta_Int_Moneda_Simbolo (Apu_Oferta_Id) Int_Moneda_Simbolo,
   
    dbo.Estado ('APU_OFERTA_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    dbo._Apu_Mano_Obra_Costo_Diario(Apu_Mano_Obra_Id) Apu_Mano_Obra_Costo_Diario, 
    dbo._Apu_Oferta_Mano_Obra_Costo_Hora (id) Costo_Hora,

	0.0000 Cantidad_Mano_Obra, 
    0.0000 Cantidad_Mano_Obra_X_Costo

FROM         Apu_Oferta_Mano_Obra
where Codigo = @p_Codigo



