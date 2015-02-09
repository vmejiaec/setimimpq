

CREATE FUNCTION [dbo].[Fis_Planilla_Anticipo_Devengar]
(
   @p_Fis_Planilla_Id varchar(17)	,
   @p_Apu_Presupuesto_Id varchar(17),
   @p_Tipo_Planilla char(3),
   @p_Anticipo_Devengar_Ingresado numeric(17,4),
   @p_Tipo_Transaccion varchar(1)	
)
RETURNS varchar(200)
BEGIN
	
	DECLARE @p_Apu_Origen_Id varchar(17)  ,
			@p_Origen char(3) ,
			@p_Costo_Total numeric(17, 4) ,

			@p_Codigo_Institucional varchar(200),
			@p_Anticipo_Porcentaje numeric(5,2) ,

			@p_Anticipo_Valor numeric(17,4),
			@p_Anticipo_x_Devengar numeric(17,4),
			@p_Anticipo_Devengado numeric(17,4),
			@p_Total_Planilla numeric(17,4),
			@p_Maximo_Devengar_Planilla numeric(17,4),
			@p_Anticipo_Valido_Devenga numeric(17,4),
			@resultado varchar(500)
			
			--Obtener la informacion de Apu_Presupuesto

				Select
						@p_Apu_Origen_Id = Apu_Origen_Id ,
						@p_Origen =Origen  ,
						@p_Costo_Total = Costo_Total 
			from Apu_Presupuesto
			where Id=@p_Apu_Presupuesto_Id


		Set @p_Codigo_Institucional = dbo._Apu_Presupuesto_Codigo_Institucional(@p_Origen, @p_Apu_Origen_Id)

		SELECT  @p_Anticipo_Porcentaje = Anticipo_Porcentaje
		FROM Fonsal_Contratos.dbo.FON_CON_Proyecto
		where Codigo_Institucional = @p_Codigo_Institucional


		Set @p_Anticipo_Valor=ISNULL(((@p_Costo_Total * @p_Anticipo_Porcentaje)/100),0.00)

		IF (@p_Tipo_Planilla='ANT')
			Set @resultado= 'A'+ Cast(@p_Anticipo_Valor as varchar)
		ELSE
		BEGIN

			Set @p_Total_Planilla = dbo.Fis_Planilla_Total (@p_Fis_Planilla_Id)

			
			--Si se va a Actualizar no se toma en cuenta el valor anterior de la planilla
			Set @p_Anticipo_Devengado =  dbo.Fis_Planilla_Anticipo_Devengado(@p_Apu_Presupuesto_Id,@p_Tipo_Transaccion,@p_Fis_Planilla_Id)
			

			Set @p_Anticipo_Valido_Devenga=@p_Anticipo_Valor-@p_Anticipo_Devengado
			
			IF (@p_Tipo_Planilla='AND')
				Set @p_Maximo_Devengar_Planilla=@p_Anticipo_Devengar_Ingresado
			ELSE
				Set @p_Maximo_Devengar_Planilla =  ISNULL(((@p_Total_Planilla * @p_Anticipo_Porcentaje)/100),0.00)


			-- Se valida si el anticipo a ingresar es menor en primer lugar al maximo permitido por planilla
			if (@p_Anticipo_Devengar_Ingresado <=@p_Maximo_Devengar_Planilla)
				Begin
				if (@p_Anticipo_Devengar_Ingresado>@p_Anticipo_Valido_Devenga)
					Set @resultado= 'V' + Cast(@p_Anticipo_Valido_Devenga as varchar)
				else
					Set @resultado='C'
				end
			else 
			    Set	@resultado='P'+ Cast(@p_Maximo_Devengar_Planilla as varchar)
			
			
		END

		return @resultado

END



--
--Select *
--from Fis_Planilla
--where Apu_Presupuesto_Id='00130010352702853'
--AND Id<>'00136014121236625'
--
--select .dbo.Fis_Planilla_Anticipo_Devengar ('00136011599881483','00130013155471823',2,26,'U')
--
--select dbo.Fis_Planilla_Total ('00136014121236625')*30/100
----
--select dbo.Fis_Planilla_Anticipo_Devengado('00130013155471823','I','00136014121236625')
----
----
--
--select dbo._Apu_Presupuesto_Codigo_Institucional('PRO', '00061012477658199')
--
--Select *
--from Apu_Presupuesto
--where Id='00130013155471823'
--
--


--select *
--from Fis_Planilla
--where Apu_Presupuesto_Id='00130013155471823'
--
--


