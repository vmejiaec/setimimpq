
CREATE PROCEDURE [dbo].[Apu_Proyecto_Cuadrilla_Diferencia_ByProyecto]
(
  @p_apu_proyecto_id varchar (17),
  @p_int_empresa_id varchar(17)
)
AS
	SET NOCOUNT ON;

	DECLARE 	@v_Apu_Proyecto_Id varchar(17),
		@v_Apu_proyecto_Codigo varchar(200),
		@v_Apu_Proyecto_Nombre varchar(200) ,
		@v_Apu_proyecto_Etapa varchar(3),
		@v_Apu_Cuadrilla_Codigo varchar(200),
		@v_Apu_Cuadrilla_Nombre varchar(500),
		@v_Costo_Total numeric(17, 2),
		@v_Costo_Hora numeric(17, 2),
		@v_Numero_trabajadores numeric(17, 2),
		@v_Coeficiente numeric(17, 2),
		@v_Apu_Categoria_Id varchar(17),
		@v_Origen varchar(3),
		@p_mano_obra_id varchar(17),
		@p_categoria_id varchar(17)

	set @p_mano_obra_id=  (Select dbo._Apu_Proyecto_MaximaCuadrilla(Id)
	    from Apu_Proyecto
		Where id = @p_apu_proyecto_id
		and ( @v_Costo_Total <> dbo._Apu_Proyecto_Costo_Mano_Obra_Cuadrilla (Id)
		or dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria1	(Id) <> 1))


	set @p_categoria_id = (
    Select ISNULL(Apu_Categoria_Id,'NULL')
   	From  apu_proyecto_mano_obra
	where apu_proyecto_id = @p_apu_proyecto_id
    and Apu_Mano_Obra_Id=@p_mano_obra_id)


-- Se crea la tabla temporal
	CREATE TABLE #Apu_Proyecto_Temporal(
		Apu_Proyecto_Id [varchar](17) NULL,
		Apu_proyecto_Codigo [varchar](200)  NULL,
		Apu_Proyecto_Nombre [varchar](200) NULL,
		Apu_proyecto_Etapa [varchar](3) NULL,
		Apu_Cuadrilla_Codigo [varchar](200) NULL,
		Apu_Cuadrilla_Nombre [varchar](500) NULL,
		Costo_Total [numeric](17, 4) NULL,
		Costo_Hora [numeric](17, 2) NULL,
		Numero_trabajadores [numeric](17, 2) NULL,
		Coeficiente [numeric](17, 2) NULL,
		Apu_Categoria_Id [varchar](17) NULL,
		Origen [varchar](3) NULL
	) 

	insert into  #Apu_Proyecto_Temporal
	exec  dbo.Apu_Proyecto_Cuadrilla_Select @p_apu_proyecto_id;
	Select @v_Apu_Proyecto_Id = Apu_Proyecto_Id,
		@v_Apu_proyecto_Codigo =Apu_proyecto_Codigo,
		@v_Apu_Proyecto_Nombre =Apu_Proyecto_Nombre ,
		@v_Apu_proyecto_Etapa =Apu_proyecto_Etapa,
		@v_Apu_Cuadrilla_Codigo =Apu_Cuadrilla_Codigo,
		@v_Apu_Cuadrilla_Nombre =Apu_Cuadrilla_Nombre,
		@v_Costo_Total =Costo_Total,
		@v_Costo_Hora =Costo_Hora,
		@v_Numero_trabajadores =Numero_trabajadores,
		@v_Coeficiente =Coeficiente,
		@v_Apu_Categoria_Id =Apu_Categoria_Id,
		@v_Origen =Origen
	From #Apu_Proyecto_Temporal
	Where Apu_Proyecto_Id=@p_apu_proyecto_id

	Select  @v_Costo_Total= ISNULL(Round( Sum(Costo_Total),2),0)
	From #Apu_Proyecto_Temporal
	Where Apu_Proyecto_Id=@p_apu_proyecto_id

	drop table #Apu_Proyecto_Temporal

select 
  id Apu_Proyecto_Id,

  Codigo Apu_proyecto_Codigo,
  Nombre Apu_proyecto_Nombre,
  Etapa Apu_proyecto_Etapa,


  CASE @p_categoria_id WHEN  'NULL'
		THEN dbo._Apu_Mano_Obra_Codigo (dbo._Apu_Proyecto_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Codigo(@p_categoria_id) END Apu_Cuadrilla_Codigo, 


  CASE @p_categoria_id WHEN  'NULL'
		THEN  dbo._Apu_Mano_Obra_Nombre (dbo._Apu_Proyecto_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Nombre(@p_categoria_id) END Apu_Cuadrilla_Nombre, 

  dbo._Apu_Proyecto_Costo_Mano_Obra_Cuadrilla (Id) -  @v_Costo_Total Costo_Total,
  0 Costo_Hora,
  0 Numero_trabajadores,
  (1 -dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria1 (Id) ) Coeficiente
from Apu_Proyecto
Where id = @p_apu_proyecto_id
--and (v_apu_proyecto.costo_mano_obra  <> v_apu_proyecto.cuadrilla_sumatoria
--or v_apu_proyecto.cuadrilla_coeficiente_sumatoria <> 1)
--MODIFICADO JPU 05-08-2009
and ( @v_Costo_Total <> dbo._Apu_Proyecto_Costo_Mano_Obra_Cuadrilla (Id)
or dbo._Apu_Proyecto_Cuadrilla_Coeficiente_Sumatoria1	(Id) <> 1)







