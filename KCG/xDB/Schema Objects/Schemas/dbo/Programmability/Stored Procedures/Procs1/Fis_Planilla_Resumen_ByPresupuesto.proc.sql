CREATE PROCEDURE [dbo].[Fis_Planilla_Resumen_ByPresupuesto]
(
   @p_Ver_Version_Id varchar (17) ,
   @p_Apu_Presupuesto_Id varchar (17)
)
AS
	SET NOCOUNT ON;
BEGIN
	DECLARE
		@v_Factor_Reajuste_Provisional NUMERIC(17,4),
		@v_Factor_Reajuste_Definitivo NUMERIC(17,4),
		@v_Apu_Presupuesto_Costo_Total numeric(17,4),
	    @v_Importe_Total  numeric(17,4),
		@v_Fis_Catalogo_Fecha_Publicacion_1_DIS smalldatetime,
		@v_Fis_Catalogo_Fecha_Publicacion_1_REA smalldatetime;
		
		SET @v_Factor_Reajuste_Provisional = 1;
		SET @v_Factor_Reajuste_Definitivo = 1;


	SELECT      
			Id, 
			Codigo, 
			Estado, 
			Descripcion, 
			Tipo_Planilla, 
			Apu_Presupuesto_Id, 
			Fecha_Inicio_Ingreso, 
			Fecha_Inicial, 
			Fecha_Final, 
			Fecha_Ultimo_Ingreso, 
			Porcentaje_Iva, 
			Porcentaje_Retencion, 
			Fecha_Reajuste_Provisional, 
			Fecha_Reajuste_Definitivo, 
			CASE Numero_Planilla WHEN '0' THEN 'ANTICIPO' ELSE Numero_Planilla END Numero_Planilla, 
			Descripcion_Provisional, 
			Descripcion_Definitiva, 
			Anticipo_Devengar ,
			
			0.00 Fis_Planilla_Total,
			0.00 Anticipo_Devengado,
			0.00 Valor_A_Reajustar,
			0.00 Valor_Iva,
			0.00 Valor_Retencion,
			0.00 Valor_A_Pagar,

			-------------------------------------------------------------------------------------
			-------------------- Recuadro Provisional -------------------------------------------
			-------------------------------------------------------------------------------------
			0.00  Factor_Reajuste_Provisional,
			0.00  Valor_Reajuste_Provisional,
			0.00 Valor_Iva_Provisional,


			0.00 Valor_Retencion_Provisional,

			
			0.00 Valor_A_Pagar_Provisional,
			

			-------------------------------------------------------------------------------------
			-------------------- Recuadro Definitivo  -------------------------------------------
			-------------------------------------------------------------------------------------
			
			0.00  Factor_Reajuste_Definitivo,
			
			0.00 Valor_Reajuste_Definitivo,

			0.00 Valor_Iva_Definitivo,

			0.00 Valor_Retencion_Definitivo,

			
			0.00 Valor_A_Pagar_Definitivo ,

			
			-----------------------------------------------------------------------------------------------------
			---------------------- DAtos del REcuadro de Fechas
			Datediff (day,Fecha_Inicial, Fecha_Final)		Numero_Dias_Periodo,
			
			100		Numero_Dias_Acumulado,
			
			space(50) Publicacion_Reajuste_Provisional,
			space(50) Publicacion_Reajuste_Definitivo,

			------------------------- Datos para el reporte de REAJUSTE DE PRECIOS-------------------------------
			-----------------------------------------------------------------------------------------------------
			space(200) Contratista_Per_Personal_Nombre,
					
			space(17)Contratista_Per_Personal_Id,

			convert(numeric(17,2),0)Apu_Presupuesto_Costo_Total,

			convert(numeric(5,2),0) Apu_Presupuesto_Anticipo_Porcentaje,

			getDate() Apu_Presupuesto_Fecha_Oferta_Cierre,
		
			Year (Fecha_Inicial) Fis_Planilla_Anio,

			getDate()   Apu_Presupuesto_Fecha_Pago ,

		----------------------- Campos por el reporte de Reajuste de precios -------------------
			----------------------------------------------------------------------------------------

		Convert (numeric(17,4),0) 	Sum_Coeficiente_DIS,
		Convert (numeric(17,4),0) 	Sum_Coeficiente_REA,
		Convert (numeric(17,3),0) 	Sum_SRD_x_Coeficiente_DIS,
		Convert (numeric(17,3),0) 	Sum_SRD_x_Coeficiente_REA,
		Convert (numeric(17,3),0) 	Sum_Costo_Planilla_x_Coeficiente_DIS,
		Convert (numeric(17,3),0) 	Sum_Costo_Planilla_x_Coeficiente_REA,

		convert (numeric(17,4),0)	Sum_Coeficiente_Formula_DIS,
		convert (numeric(17,4),0)	Sum_Valor_Actual_DIS,
		convert (numeric(17,3),0)	Sum_Coeficiente_x_Relacion_DIS,
		convert (numeric(17,4),0)	Sum_Coeficiente_Formula_REA,
		convert (numeric(17,4),0)	Sum_Valor_Actual_REA,
		convert (numeric(17,3),0)	Sum_Coeficiente_x_Relacion_REA,
		convert(numeric(5,2),0)			Porcentaje_Reajuste_DIS,
		convert(numeric(5,2),0)			Porcentaje_Reajuste_REA,
		convert(numeric(5,2),0)	 Valor_Del_Reajuste_Provisional,
		convert(numeric(5,2),0)	 Valor_Del_Reajuste_Definitivo,


		------------------------------------------------------------------------------------------
		---------------- Información para el Reporte de Detalles de Planillas --------------------

		convert(numeric(17,2),0)	Sum_Importe_Anterior,
		convert(numeric(17,2),0)	Sum_Importe_Anterior_Anticipo,
		convert(numeric(17,2),0)	Sum_Importe_Anterior_Iva,
		convert(numeric(17,2),0)	Sum_Importe_Anterior_Deducciones,
		convert(numeric(17,2),0)	Sum_Importe_Anterior_Pagar,

		convert(numeric(17,2),0)	Sum_Importe_Actual,
		convert(numeric(17,2),0)	Sum_Importe_Actual_Anticipo,
		convert(numeric(17,2),0)	Sum_Importe_Actual_Iva,
		convert(numeric(17,2),0)	Sum_Importe_Actual_Deducciones,
		convert(numeric(17,2),0)	Sum_Importe_Actual_Pagar,

		convert(numeric(17,2),0)	Sum_Importe_Total,
		convert(numeric(17,2),0)	Sum_Importe_Total_Anticipo,
		convert(numeric(17,2),0)	Sum_Importe_Total_Iva,
		convert(numeric(17,2),0)	Sum_Importe_Total_Deducciones,
		convert(numeric(17,2),0)	Sum_Importe_Total_Pagar,
		
		convert(numeric(17,2),0)	Sum_Incremento_Monto_1,
		convert(numeric(17,2),0)	Sum_Incremento_Monto_2,

-----------------------------------------------------------------------------------
		------------- Campos para la página Fis_Planilla_Resumen --------------------------

		--% de incremente: (Monto Acumulado - Monto del Contrato) / Monto del Contrato * 100
		-- Este campo se presenta en Fis_Planilla_Resumen. se llama % DE INCREMENTO
		Convert(Numeric(5,2),0)	Porcentaje_Incremento,
		convert(numeric(17,2),0)  Total_Costo_Mas_Porcentaje,
		Convert(Numeric(5,2),0) Porcentaje_Costo_Mas_Porcentaje,

		Convert (numeric(17,2),0) Deduccion_Acumulada,
		Convert (numeric(17,2),0) Saldo,

		convert(numeric(17,2),0) Sum_Cantidad_Total,
		convert(numeric(17,2),0) Monto_Total_Ejecutarse,

		getdate() Fecha_Ini_Contrato,
		Convert(numeric(17,2), 0.00)  Anticipo_por_Devengar ,

		-- Este campo sirve para Fis_Planilla_Det_Resumen. La etiqeuta es Monto_Total (USD)
		ISNULL(@v_Importe_Total,0) Monto_Total,

	--	 Fecha Publicacion del INDICE Cero
		getdate() Fis_Catalogo_Fecha_Publicacion_0,

--	 Fecha Publicacion del INDICE UNO DIS
	isnull(@v_Fis_Catalogo_Fecha_Publicacion_1_DIS,getdate()) Fis_Catalogo_Fecha_Publicacion_1_DIS,

-- Fecha de Publicacion INDICE UNO REA
    isnull(@v_Fis_Catalogo_Fecha_Publicacion_1_REA,getdate()) Fis_Catalogo_Fecha_Publicacion_1_REA,
		convert(numeric(17,2),0) Incremento_Real_Obra

	FROM Fis_Planilla P
	WHERE Apu_Presupuesto_Id= @p_Apu_Presupuesto_Id
	ORDER BY  CONVERT(int, Numero_Planilla)
	
END