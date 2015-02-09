CREATE PROCEDURE [dbo].[Apu_Proyecto_Mano_Obra_ByProyectoManoObra]
(
   @p_Ver_Version_Id VARCHAR(17),
   @p_apu_proyecto_id varchar(17),
   @p_Apu_Mano_Obra_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT   
    Id,
    Codigo,
    Costo_Diario,
    Apu_Proyecto_Id,
    Apu_Mano_Obra_Id,
    Apu_Indice_Id,
    Apu_Categoria_Id,
    Estado,

    dbo._Apu_Proyecto_Codigo (Apu_Proyecto_Id) Apu_Proyecto_Codigo,
    dbo._Apu_Proyecto_Nombre (Apu_Proyecto_Id) Apu_Proyecto_Nombre,
    dbo._Apu_Proyecto_Etapa (Apu_Proyecto_Id) Apu_Proyecto_Etapa,
    
    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Mano_Obra_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Mano_Obra_Nombre,
    
    dbo._Apu_Mano_Obra_Costo_Total (Apu_Mano_Obra_Id) Costo_Total,

    dbo._Apu_Categoria_Codigo(Apu_Categoria_Id) Apu_Categoria_Codigo,
    dbo._Apu_Categoria_Nombre(Apu_Categoria_Id) Apu_Categoria_Nombre, 
     
    dbo._Apu_Proyecto_Int_Moneda_Simbolo (Apu_Proyecto_Id) Int_Moneda_Simbolo,

    dbo._Apu_Proyecto_Mano_Obra_Cantidad_Mano_Obra (apu_proyecto_id, apu_mano_obra_id) Cantidad_Mano_Obra, 
    dbo._Apu_Proyecto_Mano_Obra_Cantidad_Mano_Obra_X_Costo (apu_proyecto_id, apu_mano_obra_id) Cantidad_Mano_Obra_X_Costo, 
    
    dbo._Apu_Indice_Codigo (Apu_Indice_Id) Apu_Indice_Codigo,
	dbo._Apu_Indice_Nombre (Apu_Indice_Id) Apu_Indice_Nombre,
    
    dbo._Apu_Mano_Obra_Costo_Diario(Apu_Mano_Obra_Id) Apu_Mano_Obra_Costo_Diario, 
    
    dbo._Apu_Proyecto_Mano_Obra_Costo_Hora (id) Costo_Hora,
       
    dbo.Estado ('APU_PROYECTO_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre

FROM         Apu_Proyecto_Mano_Obra
Where  Apu_Mano_Obra_Id = @p_Apu_Mano_Obra_Id
and apu_proyecto_id = @p_apu_proyecto_id















