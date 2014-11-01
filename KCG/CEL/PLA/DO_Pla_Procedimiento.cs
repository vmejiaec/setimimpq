using System;
using System.Collections.Generic;
using System.Linq;
using System.Text; 

using ADL.PlanificacionTableAdapters;
using AEL.PLA;
using BEL;
using System.Data.SqlClient;

namespace CEL.PLA
{
    public class DO_Pla_Procedimiento
    {
	// adapter
    public Pla_ProcedimientoTableAdapter Adapter = new Pla_ProcedimientoTableAdapter();
	//Select
	public List<Pla_Procedimiento> Get(Scope s)
    {
        List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Pla_Procedimiento(
				fila.Id,
fila.Nombre,
fila.Tipo,
fila.Valor_Min,
fila.Valor_Max
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Pla_Procedimiento n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Nombre,
n.Tipo,
n.Valor_Min,
n.Valor_Max
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Pla_Procedimiento o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Nombre,
o.Tipo,
o.Valor_Min,
o.Valor_Max
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Pla_Procedimiento o, Pla_Procedimiento n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Nombre,
n.Tipo,
n.Valor_Min,
n.Valor_Max,
o.Id,
o.Nombre,
o.Tipo,
o.Valor_Min,
o.Valor_Max,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Pla_Procedimiento> GetById (Scope s , Int32 p_Id)
		{
			List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Procedimiento(
				fila.Id,
fila.Nombre,
fila.Tipo,
fila.Valor_Min,
fila.Valor_Max
				));
			}
			return lista;
		}
		// GetByLikeNombre
		public List<Pla_Procedimiento> GetByLikeNombre (Scope s , string p_Nombre)
		{
			List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>();
			var tabla = Adapter.GetByLikeNombre( p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Procedimiento(
				fila.Id,
fila.Nombre,
fila.Tipo,
fila.Valor_Min,
fila.Valor_Max
				));
			}
			return lista;
		}
		// GetByLikeValor
		public List<Pla_Procedimiento> GetByLikeValor (Scope s , Decimal p_Valor)
		{
			List<Pla_Procedimiento> lista = new List<Pla_Procedimiento>();
			var tabla = Adapter.GetByLikeValor( p_Valor);
			foreach (var fila in tabla)
			{
				lista.Add(new Pla_Procedimiento(
				fila.Id,
fila.Nombre,
fila.Tipo,
fila.Valor_Min,
fila.Valor_Max
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Pla_Procedimiento n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Nombre,
n.Tipo,
n.Valor_Min,
n.Valor_Max
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
