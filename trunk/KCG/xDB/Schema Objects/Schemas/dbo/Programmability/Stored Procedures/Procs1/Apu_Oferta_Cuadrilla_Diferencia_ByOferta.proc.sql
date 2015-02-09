
CREATE PROCEDURE [dbo].[Apu_Oferta_Cuadrilla_Diferencia_ByOferta]
(
  @p_Apu_Oferta_Id varchar (17),
  @p_int_empresa_id varchar(17)
)
AS
	SET NOCOUNT ON;
		DECLARE @p_mano_obra_id varchar(17),
		@p_categoria_id varchar(17),
	 	@v_Apu_Oferta_Id varchar(17),
		@v_Apu_Oferta_Codigo varchar(200),
		@v_Apu_Oferta_Nombre varchar(200) ,
		@v_Apu_Oferta_Etapa varchar(3),
		@v_Apu_Cuadrilla_Codigo varchar(200),
		@v_Apu_Cuadrilla_Nombre varchar(500),
		@v_Costo_Total numeric(17, 4),
		@v_Costo_Hora numeric(17, 4),
		@v_Numero_trabajadores numeric(17, 4),
		@v_Coeficiente numeric(17, 4),
		@v_Apu_Categoria_Id varchar(17),
		@v_Origen varchar(3)

	   

-- Se crea la tabla temporal
	CREATE TABLE #Apu_Oferta_Temporal(
		Apu_Oferta_Id [varchar](17) NULL,
		Apu_Oferta_Codigo [varchar](200)  NULL,
		Apu_Oferta_Nombre [varchar](200) NULL,
		Apu_Oferta_Etapa [varchar](3) NULL,
		Apu_Cuadrilla_Codigo [varchar](200) NULL,
		Apu_Cuadrilla_Nombre [varchar](500) NULL,
		Costo_Total [numeric](17, 2) NULL,
		Costo_Hora [numeric](17, 4) NULL,
		Numero_trabajadores [numeric](17, 4) NULL,
		Coeficiente [numeric](17, 3) NULL,
		Apu_Categoria_Id [varchar](17) NULL,
		Origen [varchar](3) NULL
	) 

	insert into  #Apu_Oferta_Temporal
	exec  dbo.Apu_Oferta_Cuadrilla_Select @p_Apu_Oferta_id;
	Select @p_Apu_Oferta_Id = Apu_Oferta_Id,
		@v_Apu_Oferta_Codigo =Apu_Oferta_Codigo,
		@v_Apu_Oferta_Nombre =Apu_Oferta_Nombre ,
		@v_Apu_Oferta_Etapa =Apu_Oferta_Etapa,
		@v_Apu_Cuadrilla_Codigo =Apu_Cuadrilla_Codigo,
		@v_Apu_Cuadrilla_Nombre =Apu_Cuadrilla_Nombre,
		@v_Costo_Total =Costo_Total,
		@v_Costo_Hora =Costo_Hora,
		@v_Numero_trabajadores =Numero_trabajadores,
		@v_Coeficiente =Coeficiente,
		@v_Apu_Categoria_Id =Apu_Categoria_Id,
		@v_Origen =Origen
	From #Apu_Oferta_Temporal
	Where Apu_Oferta_Id=@p_Apu_Oferta_Id

	Select  @v_Costo_Total= ISNULL(Round(Sum(Costo_Total),2),0)
	From #Apu_Oferta_Temporal
	Where Apu_Oferta_Id=@p_Apu_Oferta_Id

	drop table #Apu_Oferta_Temporal


    set @p_mano_obra_id=  (Select dbo._Apu_Oferta_MaximaCuadrilla(Id)
	    from Apu_Oferta
		Where id = @p_apu_oferta_id
		and (@v_Costo_Total  <> dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla(Id)
		or dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1(Id) <> 1))

	set @p_categoria_id = (
    Select ISNULL(Apu_Categoria_Id,'NULL')
   	From  Apu_Oferta_mano_obra
	where Apu_Mano_Obra_Id=@p_mano_obra_id
	and Apu_Oferta_Id=@p_apu_oferta_id)

select 
  id Apu_Oferta_Id,
  Codigo Apu_Oferta_Codigo,
  Nombre Apu_Oferta_Nombre,
  Etapa Apu_Oferta_Etapa,

  CASE @p_categoria_id WHEN  'NULL'
		THEN dbo._Apu_Mano_Obra_Codigo (dbo._Apu_Oferta_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Codigo(@p_categoria_id) END Apu_Cuadrilla_Codigo, 


  CASE @p_categoria_id WHEN  'NULL'
		THEN  dbo._Apu_Mano_Obra_Nombre (dbo._Apu_Oferta_MaximaCuadrilla(Id)) 
		ELSE dbo._Apu_Categoria_Nombre(@p_categoria_id) END Apu_Cuadrilla_Nombre, 


  (dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla (Id) -  @v_Costo_Total)  Costo_Total,

  0 Costo_Hora,
  0 Numero_trabajadores,
  (1 -  dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1	(Id) ) Coeficiente
from Apu_Oferta
Where id = @p_apu_oferta_id
and (@v_Costo_Total  <> dbo._Apu_Oferta_Costo_Mano_Obra_Cuadrilla(Id)
or dbo._Apu_Oferta_Cuadrilla_Coeficiente_Sumatoria1	(Id) <> 1)




