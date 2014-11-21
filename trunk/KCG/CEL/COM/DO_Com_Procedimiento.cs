using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using ADL.ComprasTableAdapters;
using AEL.COM;
using BEL;
using System.Data.SqlClient;
 
namespace CEL.COM
{
    public class DO_Com_Procedimiento
    {
	// adapter
    public Com_ProcedimientoTableAdapter Adapter = new Com_ProcedimientoTableAdapter();
	//Select
	public List<Com_Procedimiento> Get(Scope s)
    {
        List<Com_Procedimiento> lista = new List<Com_Procedimiento>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Procedimiento(
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
	public int Insert(Com_Procedimiento n)
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
	public int Delete(Com_Procedimiento o)
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
	public int Update(Com_Procedimiento o, Com_Procedimiento n)
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
		public List<Com_Procedimiento> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Procedimiento> lista = new List<Com_Procedimiento>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Procedimiento(
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
		public List<Com_Procedimiento> GetByLikeNombre (Scope s , string p_Nombre)
		{
			List<Com_Procedimiento> lista = new List<Com_Procedimiento>();
			var tabla = Adapter.GetByLikeNombre( p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Procedimiento(
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
		public List<Com_Procedimiento> GetByLikeValor (Scope s , Decimal p_Valor)
		{
			List<Com_Procedimiento> lista = new List<Com_Procedimiento>();
			var tabla = Adapter.GetByLikeValor( p_Valor);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Procedimiento(
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
		public int InsertINT(Com_Procedimiento n)
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
