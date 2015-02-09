
CREATE PROCEDURE [dbo].[Apu_Proyecto_Rubro_Insumo_ByTotalPaginas]
(
  @p_Ver_Version_Id varchar (17),
   @p_Int_sucursal_id varchar (17),
   @p_Numero_Registros int,
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

if (@p_Tipo = '%' ) 
BEGIN
	SELECT  CASE WHEN  ((Count_Material+Count_Material2+Count_Mano_Obra+Count_Equipo)%@p_Numero_Registros) >0 
				 THEN  ((Count_Material+Count_Material2+Count_Mano_Obra+Count_Equipo)/@p_Numero_Registros) +1  
				 ELSE  ((Count_Material+Count_Material2+Count_Mano_Obra+Count_Equipo)/@p_Numero_Registros) END  Total_Paginas
            FROM
			(SELECT Count(*) Count_Material
			FROM  Apu_Proyecto_Rubro_Material
			where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
			AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
			AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )
            )Apu_Proyecto_Material,
			(SELECT Count(*) Count_Material2
			FROM  Apu_Proyecto_Rubro_Material
			where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
			AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
			AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )
            )Apu_Proyecto_Material2,
	
	        (
			SELECT Count(*) Count_Mano_Obra    
			FROM         Apu_Proyecto_Rubro_Mano_Obra
				where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
				AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
				AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
				AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
				AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) like @p_Apu_Insumo_Nombre )
            )Apu_Proyecto_Mano_Obra,
			(
			SELECT Count(*) Count_Equipo   
			FROM         Apu_Proyecto_Rubro_Equipo
			where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
			AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
			AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre )
			)Apu_Proyecto_Equipo

END

IF (@p_Tipo ='MAT' OR @p_Tipo ='TRA' ) 
BEGIN
	        SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
						THEN (Count(*) / @p_Numero_Registros) + 1 
						ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
			FROM  Apu_Proyecto_Rubro_Material
			where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
			AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
			AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Material_Nombre (Apu_Material_Id) like @p_Apu_Insumo_Nombre )
END

IF (@p_Tipo ='MAN' ) 
BEGIN
			SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
						THEN (Count(*) / @p_Numero_Registros) + 1 
						ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
			FROM  Apu_Proyecto_Rubro_Mano_Obra
			where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
			AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
			AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Mano_Obra_Nombre (Apu_Mano_Obra_Id) like @p_Apu_Insumo_Nombre )
END

IF (@p_Tipo ='EQU') 
BEGIN
			SELECT CASE WHEN (Count(*) % @p_Numero_Registros)>0 
						THEN (Count(*) / @p_Numero_Registros) + 1 
						ELSE (Count(*) / @p_Numero_Registros) END Total_Paginas
			FROM         Apu_Proyecto_Rubro_Equipo
			where  dbo._Apu_Proyecto_Rubro_Int_Sucursal_Id (Apu_Proyecto_Rubro_Id) = @p_int_sucursal_id
			AND ( @p_Apu_Proyecto_Codigo ='%'  OR dbo._Apu_Proyecto_Codigo (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id))like @p_Apu_Proyecto_Codigo )
			AND ( @p_Apu_Proyecto_Nombre ='%'  OR dbo._Apu_Proyecto_Nombre (dbo._Apu_Proyecto_Rubro_Apu_Proyecto_Id (Apu_Proyecto_rubro_Id)) like  @p_Apu_Proyecto_Nombre)
			AND ( @p_Apu_Rubro_Nombre ='%'  OR dbo._Apu_Rubro_Nombre ( dbo._Apu_Proyecto_Rubro_Apu_Rubro_Id (Apu_Proyecto_Rubro_Id))like @p_Apu_Rubro_Nombre)
			AND ( @p_Apu_Insumo_Nombre ='%'  OR dbo._Apu_Equipo_Nombre (Apu_Equipo_Id) like @p_Apu_Insumo_Nombre )

END

