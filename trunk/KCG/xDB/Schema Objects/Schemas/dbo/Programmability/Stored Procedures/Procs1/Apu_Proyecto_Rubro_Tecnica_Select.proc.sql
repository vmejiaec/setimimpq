CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Tecnica_Select]
(
   @p_Ver_Version_Id varchar (17),
   @p_par_servidor_Id varchar(17)
)
AS
	SET NOCOUNT ON;
SELECT    
    Id,
    Codigo,
    Apu_Proyecto_Rubro_Id,
    Imagen,
    Origen_Imagen, 
    Definicion,
    Especificacion,
    Medicion,
    Estado,

    dbo._Apu_Proyecto_Rubro_Codigo (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Codigo,
        
    '~/' + dbo._Par_Servidor_Ruta (@p_par_servidor_id) +  '/' + id + Imagen Path_Imagen,
    '~/' + dbo._Par_Servidor_Ruta (@p_par_servidor_id) +  '/' + id + Origen_Imagen Path_Origen_Imagen, 
    
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Id,
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id)) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_Rubro_Id)) Apu_Proyecto_Nombre,
    
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
    dbo._Apu_Proyecto_Rubro_Apu_Rubro_Unidad (dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,    

    dbo._Apu_Proyecto_Rubro_Apu_SubTitulo_Id (Apu_Proyecto_Rubro_Id) Apu_Subtitulo_Id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Proyecto_Rubro_Apu_SubTitulo_Id (Apu_Proyecto_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Proyecto_Rubro_Apu_SubTitulo_Id (Apu_Proyecto_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Proyecto_Rubro_Apu_SubTitulo_Id (Apu_Proyecto_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Proyecto_Rubro_Apu_SubTitulo_Id (Apu_Proyecto_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Proyecto_Rubro_Apu_SubTitulo_Id (Apu_Proyecto_Rubro_Id))) Apu_Titulo_Nombre,

    dbo.Estado ('APU_PROYECTO_RUBRO_TECNICA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Proyecto_Rubro_Tecnica







