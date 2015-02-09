
CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Insumo_BySucursal]
(
   @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17),
   @p_Numero_Registros int,
   @p_Pagina_Actual int,
   @p_Apu_Proyecto_Codigo varchar(200) ,
   @p_Apu_Proyecto_Nombre varchar(500) ,
   @p_Apu_Rubro_Nombre varchar(500),
   @p_Apu_Insumo_Nombre varchar(200),
   @p_Tipo varchar(3)

)
AS
	SET NOCOUNT ON;

if ( @p_Apu_Proyecto_Codigo is null)
	set @p_Apu_Proyecto_Codigo='%'
if ( @p_Apu_Proyecto_Nombre is null)
	set @p_Apu_Proyecto_Nombre='%'
if (@p_Apu_Rubro_Nombre is null)
	set @p_Apu_Rubro_Nombre='%'
if (@p_Apu_Insumo_Nombre is null)
	set @p_Apu_Insumo_Nombre='%'
if (@p_Tipo ='%' )
	set @p_Tipo=null


IF (@p_Tipo IS NULL)
  BEGIN
  SELECT 
			Tipo,
			Tipo_Nombre,
			Apu_Insumo_Id,
		    Apu_Proyecto_Id,
			Apu_Proyecto_Codigo,
			Apu_Proyecto_Nombre,
			Apu_Proyecto_Etapa,
			Apu_Rubro_Id,
			Apu_Rubro_Codigo,
			Apu_Rubro_Nombre,
			Apu_Rubro_Unidad,
			Apu_Insumo_Codigo,
			Apu_Insumo_Nombre,
			Costo_Insumo,
			Cantidad_Insumo,
			Costo_x_Cantidad,
			Int_Sucursal_Id,
			Apu_Proyecto_Rubro_Cantidad,
			Apu_Proyecto_Rubro_Costo_Directo,
			Apu_Proyecto_Rubro_Costo_Indirecto,
			Apu_Proyecto_Rubro_Costo,
			Apu_Proyecto_Rubro_Costo_Unitario,
			Apu_Proyecto_Rubro_Id
    FROM (
		SELECT 
				Tipo,
				Tipo_Nombre,
				Apu_Insumo_Id,
				Apu_Proyecto_Id,
				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,
				Apu_Rubro_Id,
				Apu_Rubro_Codigo,
				Apu_Rubro_Nombre,
				Apu_Rubro_Unidad,
				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,
				Costo_Insumo,
				Cantidad_Insumo,
				Costo_x_Cantidad,
				Int_Sucursal_Id,
				Apu_Proyecto_Rubro_Cantidad,
				Apu_Proyecto_Rubro_Costo_Directo,
				Apu_Proyecto_Rubro_Costo_Indirecto,
				Apu_Proyecto_Rubro_Costo,
				Apu_Proyecto_Rubro_Costo_Unitario,
				Apu_Proyecto_Rubro_Id,
				ROW_NUMBER() OVER (ORDER BY Apu_Proyecto_Codigo) AS RowNumber 
			FROM (
				SELECT     
					'MAT' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Material_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
					dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Material_Costo_Diario (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Material_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Material_Costo_Diario_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,
				    
					dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Unitario (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,
					Apu_Proyecto_Rubro_Id


				FROM         Apu_Proyecto_Rubro_Material
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%' OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%' OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )

				UNION

				SELECT     
					'TRA' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Material_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
					dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Material_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

					dbo. _Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario  ,
					Apu_Proyecto_Rubro_Id   


				FROM         Apu_Proyecto_Rubro_Material
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )

				UNION
				SELECT     
					'MAN' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Mano_Obra_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
					dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Mano_Obra_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

					dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo   ,

					dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind   (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,
					Apu_Proyecto_Rubro_Id


				FROM         Apu_Proyecto_Rubro_Mano_Obra
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) like @p_Apu_Insumo_Nombre )
				
				UNION
				SELECT     
					'EQU' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Equipo_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
					dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Equipo_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

					dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind   (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario  ,
					Apu_Proyecto_Rubro_Id


				FROM         Apu_Proyecto_Rubro_Equipo
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre )
				
				) Apu_Proyecto_Rubro_Mat_Man_Equ_Aux
	) Apu_Proyecto_Rubro_Mat_Man_Equ
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

END


IF (@p_Tipo ='MAT')
BEGIN


		SELECT 
				Tipo,
				Tipo_Nombre,
				Apu_Insumo_Id,
				Apu_Proyecto_Id,
				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,
				Apu_Rubro_Id,
				Apu_Rubro_Codigo,
				Apu_Rubro_Nombre,
				Apu_Rubro_Unidad,
				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,
				Costo_Insumo,
				Cantidad_Insumo,
				Costo_x_Cantidad,
				Int_Sucursal_Id,
				Apu_Proyecto_Rubro_Cantidad,
				Apu_Proyecto_Rubro_Costo_Directo,
				Apu_Proyecto_Rubro_Costo_Indirecto,
				Apu_Proyecto_Rubro_Costo,
				Apu_Proyecto_Rubro_Costo_Unitario,
				Apu_Proyecto_Rubro_Id

			FROM (
				SELECT     
					'MAT' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'MAT', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Material_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
					dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Material_Costo_Diario (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Material_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Material_Costo_Diario_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,
				    
					dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Unitario (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,
					Apu_Proyecto_Rubro_Id,
					ROW_NUMBER() OVER (ORDER BY Apu_Material_Id) AS RowNumber 

				FROM         Apu_Proyecto_Rubro_Material
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )
	)Apu_Proyecto_Rubro_Material
	WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
	and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

END

IF (@p_Tipo ='TRA')
BEGIN
		SELECT 
				Tipo,
				Tipo_Nombre,
				Apu_Insumo_Id,
				Apu_Proyecto_Id,
				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,
				Apu_Rubro_Id,
				Apu_Rubro_Codigo,
				Apu_Rubro_Nombre,
				Apu_Rubro_Unidad,
				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,
				Costo_Insumo,
				Cantidad_Insumo,
				Costo_x_Cantidad,
				Int_Sucursal_Id,
				Apu_Proyecto_Rubro_Cantidad,
				Apu_Proyecto_Rubro_Costo_Directo,
				Apu_Proyecto_Rubro_Costo_Indirecto,
				Apu_Proyecto_Rubro_Costo,
				Apu_Proyecto_Rubro_Costo_Unitario,
				Apu_Proyecto_Rubro_Id

			FROM (
			SELECT     
					'TRA' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'TRA', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Material_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Material_Codigo (Apu_Material_Id) Apu_Insumo_Codigo,
					dbo._Apu_Material_Nombre (Apu_Material_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Material_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Material_Transporte_Costo_Diario_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

					dbo. _Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario  ,
					Apu_Proyecto_Rubro_Id,   
					ROW_NUMBER() OVER (ORDER BY Apu_Material_Id) AS RowNumber 

				FROM         Apu_Proyecto_Rubro_Material
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )
			) Apu_Proyecto_Rubro_Material
		WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
		and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))

END


IF (@p_Tipo ='MAN')
BEGIN
		SELECT 
				Tipo,
				Tipo_Nombre,
				Apu_Insumo_Id,
				Apu_Proyecto_Id,
				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,
				Apu_Rubro_Id,
				Apu_Rubro_Codigo,
				Apu_Rubro_Nombre,
				Apu_Rubro_Unidad,
				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,
				Costo_Insumo,
				Cantidad_Insumo,
				Costo_x_Cantidad,
				Int_Sucursal_Id,
				Apu_Proyecto_Rubro_Cantidad,
				Apu_Proyecto_Rubro_Costo_Directo,
				Apu_Proyecto_Rubro_Costo_Indirecto,
				Apu_Proyecto_Rubro_Costo,
				Apu_Proyecto_Rubro_Costo_Unitario,
				Apu_Proyecto_Rubro_Id

			FROM (
			SELECT     
					'MAN' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'MAN', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Mano_Obra_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Mano_Obra_Codigo (Apu_Mano_Obra_Id) Apu_Insumo_Codigo,
					dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Mano_Obra_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Mano_Obra_Costo_Hora_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

					dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind   (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,
					Apu_Proyecto_Rubro_Id,

					ROW_NUMBER() OVER (ORDER BY Apu_Mano_Obra_Id) AS RowNumber 


				FROM         Apu_Proyecto_Rubro_Mano_Obra
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) like @p_Apu_Insumo_Nombre )
			)	Apu_Proyecto_Rubro_Mano_Obra
		WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
		and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END

IF (@p_Tipo ='EQU')
BEGIN
		SELECT 
				Tipo,
				Tipo_Nombre,
				Apu_Insumo_Id,
				Apu_Proyecto_Id,
				Apu_Proyecto_Codigo,
				Apu_Proyecto_Nombre,
				Apu_Proyecto_Etapa,
				Apu_Rubro_Id,
				Apu_Rubro_Codigo,
				Apu_Rubro_Nombre,
				Apu_Rubro_Unidad,
				Apu_Insumo_Codigo,
				Apu_Insumo_Nombre,
				Costo_Insumo,
				Cantidad_Insumo,
				Costo_x_Cantidad,
				Int_Sucursal_Id,
				Apu_Proyecto_Rubro_Cantidad,
				Apu_Proyecto_Rubro_Costo_Directo,
				Apu_Proyecto_Rubro_Costo_Indirecto,
				Apu_Proyecto_Rubro_Costo,
				Apu_Proyecto_Rubro_Costo_Unitario,
				Apu_Proyecto_Rubro_Id

			FROM (
			SELECT     
					'EQU' Tipo,
					dbo.Dominio ('APU_PROYECTO_RUBRO_INSUMO', 'TIPO', 'EQU', @p_Ver_Version_Id ) Tipo_Nombre,

					Apu_Equipo_Id Apu_Insumo_Id,
				    
					dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id) Apu_Proyecto_Id,
					dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Codigo,
					dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Nombre,
					dbo._Apu_Proyecto_Etapa  (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) Apu_Proyecto_Etapa,

					dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id) Apu_Rubro_Id,
					dbo._Apu_Rubro_Codigo ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Codigo,
					dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Nombre,
					dbo._Apu_Rubro_Unidad ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id)) Apu_Rubro_Unidad,

					dbo._Apu_Equipo_Codigo (Apu_Equipo_Id) Apu_Insumo_Codigo,
					dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) Apu_Insumo_Nombre,

					0.00 --dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora (Id) 
					Costo_Insumo,
					dbo._Apu_Proyecto_Rubro_Equipo_Cantidad (Id) Cantidad_Insumo,
					0.00 --dbo._Apu_Proyecto_Rubro_Equipo_Costo_Hora_x_Cantidad (Id) 
					Costo_x_Cantidad,

					dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) Int_Sucursal_Id,

					dbo._Apu_Proyecto_Rubro_Cantidad (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Cantidad,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Directo,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo_Indirecto,
					0.00 --dbo._Apu_Proyecto_Rubro_Costo_Total_Indirecto (Apu_Proyecto_Rubro_Id) 
					Apu_Proyecto_Rubro_Costo,

					dbo._Apu_Proyecto_Rubro_Costo_Uni_Sin_Ind   (Apu_Proyecto_Rubro_Id) Apu_Proyecto_Rubro_Costo_Unitario,
					Apu_Proyecto_Rubro_Id,
					ROW_NUMBER() OVER (ORDER BY Apu_Equipo_Id) AS RowNumber 

				FROM         Apu_Proyecto_Rubro_Equipo
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre )
				) Apu_Proyecto_Rubro_Equipo
			WHERE  RowNumber > (@p_Numero_Registros* (@p_Pagina_Actual-1)) 
			and RowNumber <= (@p_Numero_Registros * (@p_Pagina_Actual))
END















