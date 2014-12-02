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
    public class DO_Com_DocTec
    {
	// adapter
    public Com_DocTecTableAdapter Adapter = new Com_DocTecTableAdapter();
	//Select
	public List<Com_DocTec> Get(Scope s)
    {
        List<Com_DocTec> lista = new List<Com_DocTec>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_DocTec(
				fila.Id,
fila.Nombre
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_DocTec n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Nombre
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_DocTec o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Nombre
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_DocTec o, Com_DocTec n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Nombre,
o.Id,
o.Nombre,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetById
		public List<Com_DocTec> GetById (Scope s , Int32 p_Id)
		{
			List<Com_DocTec> lista = new List<Com_DocTec>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_DocTec(
				fila.Id,
fila.Nombre
				));
			}
			return lista;
		}
		// GetByLikeNombre
		public List<Com_DocTec> GetByLikeNombre (Scope s , string p_Nombre)
		{
			List<Com_DocTec> lista = new List<Com_DocTec>();
			var tabla = Adapter.GetByLikeNombre( p_Nombre);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_DocTec(
				fila.Id,
fila.Nombre
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_DocTec n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Nombre
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
