CREATE PROCEDURE [dbo].[Apu_Oferta_Material_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Oferta_Id,
    Apu_Indice_Id,
    Apu_Material_Id,
    Estado,

    dbo._Apu_Oferta_Codigo (Apu_Oferta_Id) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre (Apu_Oferta_Id) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa (Apu_Oferta_Id) Apu_Oferta_Etapa,

	dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Material_Codigo,
	dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Material_Nombre,
    dbo._Apu_Material_Unidad (Apu_Material_Id) Apu_Material_Unidad,
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
	dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,
    
    dbo._Apu_Oferta_Rubro_Costo_Material1 (apu_oferta_id, apu_material_id) Costo,
    dbo._Apu_Oferta_Int_Moneda_Simbolo (apu_Oferta_id) Int_Moneda_Simbolo,
          
    dbo.Estado ('APU_OFERTA_MATERIAL', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Oferta_Material
where id = @p_Id





















