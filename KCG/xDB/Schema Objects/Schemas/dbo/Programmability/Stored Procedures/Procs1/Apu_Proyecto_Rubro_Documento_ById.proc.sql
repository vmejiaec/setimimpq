CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Documento_ById]
(
   @p_Ver_Version_Id varchar (17),
   @p_Id varchar (17),
   @p_par_servidor_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Proyecto_Rubro_Id,
    Nombre,
    Ruta,
    Descripcion,
    Estado,

    dbo._Apu_Proyecto_Rubro_Codigo (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Codigo,
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id)) Apu_Proyecto_Nombre,
    
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Unidad (dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,  

    '~\' + dbo._Par_Servidor_Ruta (@p_par_servidor_id) +  '\' + id + Nombre Path_Nombre,
    
    dbo.Estado ('APU_PROYECTO_RUBRO_DOCUMENTO', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
    
FROM         Apu_Proyecto_Rubro_Documento
Where  Id = @p_Id


