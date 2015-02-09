CREATE PROCEDURE [dbo].[Apu_Rubro_Tecnica_Select]
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
    Imagen, 
    Origen_Imagen, 
    Definicion,
    Especificacion,
    Medicion,
    Estado,

    '~/' + dbo._Par_Servidor_Ruta (@p_par_servidor_id) +  '/' + Id + Imagen Path_Imagen,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_rubro_Id) Apu_Rubro_Unidad,
  
    dbo.Estado ('APU_RUBRO_TECNICA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre
FROM         Apu_Rubro_Tecnica








