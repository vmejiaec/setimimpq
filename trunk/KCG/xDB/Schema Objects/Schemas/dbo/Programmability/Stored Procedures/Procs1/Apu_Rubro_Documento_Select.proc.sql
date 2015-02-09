CREATE PROCEDURE [dbo].[Apu_Rubro_Documento_Select]
(
   @p_Ver_Version_Id varchar (17),
   @p_par_servidor_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Rubro_Id,
    Nombre, 
    Ruta,
    Descripcion,
    Estado,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_rubro_Id) Apu_Rubro_Unidad,

    '~/' + dbo._Par_Servidor_Ruta (@p_par_servidor_id) +  '/' + id + Nombre Path_Nombre,
  
    dbo.Estado ('APU_RUBRO_DOCUMENTO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Rubro_Documento







