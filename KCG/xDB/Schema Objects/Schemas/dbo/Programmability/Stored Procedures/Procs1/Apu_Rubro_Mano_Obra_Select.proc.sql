CREATE PROCEDURE [dbo].[Apu_Rubro_Mano_Obra_Select]
(
   @p_Ver_Version_Id varchar (17)
)
AS
	SET NOCOUNT ON;
SELECT     
    Id,
    Codigo, 
    Apu_Rubro_Id,
    Apu_Mano_Obra_Id,
    Cantidad, 
    Fecha_Update,
    Update_Per_Personal_Id,
    Fecha_Creacion,
    Creacion_Per_Personal_Id,
    Estado,

    dbo._Apu_Rubro_Codigo (Apu_Rubro_Id) Apu_Rubro_Codigo,
    dbo._Apu_Rubro_Nombre (Apu_Rubro_Id) Apu_Rubro_Nombre,
    dbo._Apu_Rubro_Unidad (Apu_Rubro_Id) Apu_Rubro_Unidad,

    dbo._Apu_Mano_Obra_Apu_Categoria_Id (Apu_Mano_Obra_Id) Apu_Categoria_Id,
    dbo._Apu_Categoria_Codigo (dbo._Apu_Mano_Obra_Apu_Categoria_Id (Apu_Mano_Obra_Id)) Apu_Categoria_Codigo,
    dbo._Apu_Categoria_Nombre (dbo._Apu_Mano_Obra_Apu_Categoria_Id (Apu_Mano_Obra_Id)) Apu_Categoria_Nombre,

    dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Mano_Obra_Codigo,
    dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Mano_Obra_Nombre,
  
    dbo._Per_Personal_Codigo (Creacion_Per_Personal_Id) Creacion_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Creacion_Per_Personal_Id) Creacion_Per_Personal_Nombre,
    
    dbo._Per_Personal_Codigo (Update_Per_Personal_Id) Update_Per_Personal_Codigo,
    dbo._Per_Personal_Nombre (Update_Per_Personal_Id) Update_Per_Personal_Nombre,

    dbo._Apu_Mano_Obra_Costo_total					(apu_mano_obra_id)  costo_diario,
    dbo._Apu_Rubro_Mano_Obra_Costo_Hora				(id)				costo_hora,
    dbo._Apu_Rubro_Mano_Obra_Costo_Hora_X_Cantidad	(id)				costo_hora_x_cantidad,
    dbo._Apu_Rubro_Mano_Obra_Costo_X_Rendimiento	(id)				costo_x_rendimiento_hora,

    dbo._Apu_Rubro_Mano_Obra_Rendimiento_Hora (id)	apu_rubro_rendimiento_mano_obra_hora,
    
    dbo._Apu_Rubro_Int_Moneda_Simbolo (apu_rubro_id) int_moneda_simbolo,
              
    dbo.Estado ('APU_RUBRO_MANO_OBRA', 'ESTADO', Estado, @p_Ver_Version_Id ) Estado_Nombre,

    dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id) Apu_Subtitulo_id,
    dbo._Apu_Subtitulo_Codigo (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Codigo,
    dbo._Apu_Subtitulo_Nombre (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Subtitulo_Nombre,

    dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id)) Apu_Titulo_Id,
    dbo._Apu_Titulo_Codigo (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Codigo,
    dbo._Apu_Titulo_Nombre (dbo._Apu_Subtitulo_Apu_Titulo_Id (dbo._Apu_Rubro_Apu_Subtitulo_Id (Apu_Rubro_Id))) Apu_Titulo_Nombre


FROM         Apu_Rubro_Mano_Obra







