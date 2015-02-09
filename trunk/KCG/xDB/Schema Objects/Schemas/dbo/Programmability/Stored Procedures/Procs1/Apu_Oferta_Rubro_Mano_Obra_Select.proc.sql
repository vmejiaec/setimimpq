CREATE PROCEDURE [dbo].[Apu_Oferta_Rubro_Mano_Obra_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Oferta_Rubro_Id,
    Apu_Mano_Obra_Id,
    Costo, 
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Fecha_Update,
    Update_Per_Personal_Id,
    Estado,

    dbo._Apu_Oferta_Rubro_Codigo (Apu_Oferta_Rubro_Id) Apu_Oferta_Rubro_Codigo,
    
    dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_Rubro_Id) Apu_Oferta_Id,
    dbo._Apu_Oferta_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Codigo,
    dbo._Apu_Oferta_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Nombre,
    dbo._Apu_Oferta_Etapa ( dbo._Apu_Oferta_Rubro_Apu_Oferta_Id (Apu_Oferta_rubro_Id)) Apu_Oferta_Etapa,
    
    dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Rubro_Codigo ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad ( dbo._Apu_Oferta_Rubro_Apu_Rubro_Id (Apu_Oferta_Rubro_Id)) Apu_Rubro_Unidad,

    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Mano_Obra_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Mano_Obra_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,
    
    dbo._Apu_Oferta_Rubro_Int_Moneda_Simbolo (apu_Oferta_rubro_id) int_moneda_simbolo,
              
    dbo.Estado ('APU_OFERTA_RUBRO_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM  Apu_Oferta_Rubro_Mano_Obra

