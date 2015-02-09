CREATE PROCEDURE [dbo].[Fis_Planilla_Det_Reporte_ByPlanilla]
(
	@p_Ver_Version_Id varchar(17),
	@p_Fis_Planilla_Id varchar(17)
)
AS
	SET NOCOUNT ON;
BEGIN
	DECLARE
		@v_Apu_Presupuesto_Id varchar(17)

	Select @v_Apu_Presupuesto_Id = Id
	From Apu_Presupuesto
	Where Id =
		(Select Apu_Presupuesto_Id
		 From Fis_Planilla
		 Where Fis_Planilla.Id = @p_Fis_Planilla_Id)


	----------------------------------------------------------------------------------
	---------------- Select de Fis_Planilla_Det y Apu_Presupuesto_Rubro   ------------
	----------------------------------------------------------------------------------

	SELECT     
		FP.Id, 
		FP.Codigo, 
		FP.Estado, 
		FP.Descripcion, 
		FP.Apu_Prespuesto_Rubro_Id, 
	
		isnull(FP.Costo,0.00) Costo,  
		isnull(FP.Cantidad, 0.00) Cantidad,
		@p_Fis_Planilla_Id,
		Convert(numeric(17,2),Round(isnull((FP.Costo * FP.Cantidad),0),2)) Costo_x_Cantidad,

		
		--Cantidad Anterior = Se suma las cantidades anteriores a la planilla actual
		Isnull(convert(numeric(17,2),round(
		(Select sum(Cantidad)
		 From Fis_Planilla_Det FPD
		 Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
		       --dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		 --And 
		AP.Id = FPD.Apu_Prespuesto_Rubro_Id
		 And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
			),2)),0.00)	Cantidad_Anterior,


		-- Cantidad Actual = Cantidad del detalle de la planilla actual
		isnull(FP.Cantidad, 0.00)	Cantidad_Actual,


		-- Cantidad Total = Es la cantidad hasta la planilla actual
		Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
		From Fis_Planilla_Det FPD
		Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(@p_Fis_Planilla_Id)=
		       --dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		--And 
		AP.Id = FPD.Apu_Prespuesto_Rubro_Id
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< =
			convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
			),2)),0.00)  Cantidad_Total,


		-- Importe Anterior. Costo * Cantidad, de las planillas anteriores a la actual
		Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
		       --dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		--And 
		AP.Id = FPD.Apu_Prespuesto_Rubro_Id
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
			),2)),0.00)			Importe_Anterior,


		
		-- Importe Actual = Cantidad * Costo de la Planilla Actual
		Convert(numeric(17,2),Round(isnull((FP.Costo * FP.Cantidad),0),2))	Importe_Actual,




		--Importe Total = Cantidad * Costo, hasta la Planilla Actual
		Isnull(convert(numeric(17,2),Round((Select Sum(FPD.Costo * FPD.Cantidad)
		From Fis_Planilla_Det FPD
		Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
		       --dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
		--And 
		AP.Id = FPD.Apu_Prespuesto_Rubro_Id
		And 
			convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
			< =
			convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
			),2)),0.00)	Importe_Total,




		-- Incremento  Cantidad =
		--if (Cantidad_Presupuesto < Cantidad_Anterior)
		--	Cantidad_Incremento = Cantidad_Actual
		--else if (cantidad_total - Cantidad_presupuesto) < 0
		--	Cantidad_Incremento = 0
		--else 
		--	Cantidad_Incremento = Cantidad_Total - Cantidad_Presupuesto
		dbo.Fis_Planilla_Det_Incremento_Cantidad_1
		(
			-- Cantidad Anterior
			(
			  Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
			  From Fis_Planilla_Det FPD
			  Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
		         --dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
			  --And 
				AP.Id = FPD.Apu_Prespuesto_Rubro_Id
			  And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
				),2)),0.00)		
			)
			,
			(
				AP.Apu_Rubro_Cantidad -- Cantidad Presupuesto
			)
			,
			(
				isnull(FP.Cantidad, 0.00) -- Cantidad Actual
			)
			,
			--- Cantidfad_Total
			(
				Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
				From Fis_Planilla_Det FPD
				Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(@p_Fis_Planilla_Id)=
						--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				--And 
				AP.Id = FPD.Apu_Prespuesto_Rubro_Id
				And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< =
				convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
				),2)),0.00) 	
			)
		) Incremento_Cantidad_1,





		-- Incremento Importe 1 = Incremento Cantidad * Precio del Presupuesto
		convert(numeric(17,2),round(
		dbo.Fis_Planilla_Det_Incremento_Cantidad_1
		(
			-- Cantidad Anterior
			(
			  Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
			  From Fis_Planilla_Det FPD
			  Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
		         --dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
			  --And 
				AP.Id = FPD.Apu_Prespuesto_Rubro_Id
			  And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
				),2)),0.00)		
			)
			,
			(
				AP.Apu_Rubro_Cantidad -- Cantidad Presupuesto
			)
			,
			(
				isnull(FP.Cantidad, 0.00) -- Cantidad Actual
			)
			,
			--- Cantidfad_Total
			(
				Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
				From Fis_Planilla_Det FPD
				Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(@p_Fis_Planilla_Id)=
						--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				--And 
				AP.Id = FPD.Apu_Prespuesto_Rubro_Id
				And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< =
				convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
				),2)),0.00) 	
			)
		)
		* 
		-- Costo Unitario del Presupuesto 
		AP.Costo_Unitario,2))
		Incremento_Importe_1,




		-- Incremento Cantidad Acumulado = 
		--Incremento_Cantidad_2 =
		--(
		--Incremento_Cantidad_1
		--+
			--if (Cantidad_anterior > Cantidad_Prespuesto)
				--Cantidad_Anterior  - Cantidad_Presupuesto
			--Else
					--0
		--)
		dbo.Fis_Planilla_Det_Incremento_Cantidad_2(
			-- Cantidad_Anterior
			(
				Isnull(convert(numeric(17,2),round(
				(Select sum(Cantidad)
				From Fis_Planilla_Det FPD
				Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
				--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				--And 
				AP.Id = FPD.Apu_Prespuesto_Rubro_Id
				And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
				),2)),0.00)	
			)
			,
			(
				AP.Apu_Rubro_Cantidad -- Cantidad Presupuesto
			)  	
			,
			-- Incremento_Cantidad_1
			(
				--Inicio 
				dbo.Fis_Planilla_Det_Incremento_Cantidad_1
				(
					-- Cantidad Anterior
					(
					Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
					From Fis_Planilla_Det FPD
					Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
					--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
					--And 
					AP.Id = FPD.Apu_Prespuesto_Rubro_Id
					And 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
					),2)),0.00)		
				)
				,
				(
					AP.Apu_Rubro_Cantidad -- Cantidad Presupuesto
				)
				,
				(
					isnull(FP.Cantidad, 0.00) -- Cantidad Actual
				)
				,
				--- Cantidfad_Total
				(
					Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
					From Fis_Planilla_Det FPD
					Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(@p_Fis_Planilla_Id)=
						--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
					--And 
					AP.Id = FPD.Apu_Prespuesto_Rubro_Id
					And 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< =
					convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
					),2)),0.00) 	
				)
				)	 
				-- Fin
			)
			
		)	Incremento_Cantidad_2,  --Incremento_Cantidad_Acumulada

        


		--Incremento_Cantidad_Acumulado * Precio_Presupuesto
		convert(numeric(17,2),round(
		(
			dbo.Fis_Planilla_Det_Incremento_Cantidad_2(
			(	
				-- Cantidad_Anterior
				Isnull(convert(numeric(17,2),round(
				(Select sum(Cantidad)
				From Fis_Planilla_Det FPD
				Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
				--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
				--And 
				AP.Id = FPD.Apu_Prespuesto_Rubro_Id
				And 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
				< 
				convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
				),2)),0.00)	
			)
			,
			(
				AP.Apu_Rubro_Cantidad -- Cantidad Presupuesto
			)  	
			,
			(
			-- Inicio
				dbo.Fis_Planilla_Det_Incremento_Cantidad_1
				(
					-- Cantidad Anterior
					(
					Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
					From Fis_Planilla_Det FPD
					Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(FP.Fis_Planilla_Id)=
					--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
					--And 
					AP.Id = FPD.Apu_Prespuesto_Rubro_Id
					And 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
					),2)),0.00)		
				)
				,
				(
					AP.Apu_Rubro_Cantidad -- Cantidad Presupuesto
				)
				,
				(
					isnull(FP.Cantidad, 0.00) -- Cantidad Actual
				)
				,
				--- Cantidfad_Total
				(
					Isnull(convert(numeric(17,2),round((Select sum(Cantidad)
					From Fis_Planilla_Det FPD
					Where --dbo.Fis_Planilla_Apu_Presupuesto_Id(@p_Fis_Planilla_Id)=
						--dbo.Fis_Planilla_Apu_Presupuesto_Id(FPD.Fis_Planilla_Id)
					--And 
					AP.Id = FPD.Apu_Prespuesto_Rubro_Id
					And 
					convert(int,dbo.Fis_Planilla_Numero_Planilla(FPD.Fis_Planilla_Id)) 
					< =
					convert(int,dbo.Fis_Planilla_Numero_Planilla(@p_Fis_Planilla_Id))
					),2)),0.00) 	
				)
				)
			--Fin
			)
		))
		*
		(
			AP.Costo_Unitario
		),2))
		Incremento_Importe_2,


		-------------------------- Datos de Apu_Prespuesto_Rubro ---------------------
		
		AP.Id Apu_Presupuesto_Rubro_Id,
		AP.Codigo Apu_Presupuesto_Rubro_Codigo,
		AP.Estado Apu_Presupuesto_Rubro_Estado,
		AP.Descripcion	Apu_Presupuesto_Rubro_Descripcion,
		AP.Apu_Presupuesto_Id Apu_Prespuesto_Id,
		AP.Apu_Rubro_Id Apu_Rubro_Id,
		AP.Apu_Rubro_Codigo Apu_Rubro_Codigo,
		AP.Apu_Rubro_Nombre Apu_Rubro_Nombre,
		AP.Apu_Rubro_Unidad Apu_Rubro_Unidad,
		AP.Apu_Rubro_Cantidad Apu_Rubro_Cantidad,
		convert(numeric(17,2),round (AP.Costo_Unitario,2)) Apu_Rubro_Costo_Unitario,
		convert(numeric(17,2),round(AP.Costo_Total,2)) Apu_Rubro_Costo_Total,
		AP.Apu_Subtitulo_Id Apu_Subtitulo_Id,
		dbo._Apu_Subtitulo_Nombre (AP.Apu_Subtitulo_Id) Apu_Subtitulo_Nombre,
		dbo._Apu_Subtitulo_Apu_Titulo_Id (AP.Apu_Subtitulo_Id) Apu_Titulo_Id,
		dbo._Apu_Titulo_Nombre (DBO._Apu_Subtitulo_Apu_Titulo_Id (AP.Apu_Subtitulo_Id)) Apu_Titulo_Nombre

	From Apu_Presupuesto_Rubro  AP
		left outer join Fis_Planilla_Det FP
		On AP.Id=FP.Apu_Prespuesto_Rubro_id And FP.Fis_Planilla_Id = @p_Fis_Planilla_Id 
	Where AP.Apu_Presupuesto_Id = @v_Apu_Presupuesto_Id
	And AP.Estado = 'DIS'
	Order by Apu_Rubro_Nombre ASC

END
