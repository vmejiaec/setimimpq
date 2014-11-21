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
    public class DO_Com_Contrato_DocTec
    {
	// adapter
    public Com_Contrato_DocTecTableAdapter Adapter = new Com_Contrato_DocTecTableAdapter();
	//Select
	public List<Com_Contrato_DocTec> Get(Scope s)
    {
        List<Com_Contrato_DocTec> lista = new List<Com_Contrato_DocTec>();
        var tabla = Adapter.Get();
        foreach (var fila in tabla)
        {
            lista.Add(new Com_Contrato_DocTec(
				fila.Id,
fila.Com_Contrato_Id,
fila.Nombre,
fila.Tiene
			));
        }
        return lista;
    } // xxx Fin de Select
	//Insert
	public int Insert(Com_Contrato_DocTec n)
    {
        int res;
        try {
            res = Adapter.Insert(
				n.Com_Contrato_Id,
n.Nombre,
n.Tiene
			);
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    } // xxx Fin de Insert
	//Delete
	public int Delete(Com_Contrato_DocTec o)
    {
        int res;
        try { 
            res = Adapter.Delete(
                    o.Id,
o.Com_Contrato_Id,
o.Nombre,
o.Tiene
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Delete
	//Update
	public int Update(Com_Contrato_DocTec o, Com_Contrato_DocTec n)
    {
        int res;
        try
        {
            res = Adapter.Update(
                    n.Com_Contrato_Id,
n.Nombre,
n.Tiene,
o.Id,
o.Com_Contrato_Id,
o.Nombre,
o.Tiene,
n.Id
			);
        }
        catch (SqlException e)
        { throw (new Exception(e.Message)); }
        return res;
    } // xxx Fin de Update
	// GetByCom_Contrato_Id
		public List<Com_Contrato_DocTec> GetByCom_Contrato_Id (Scope s , Int32 p_Com_Contrato_Id)
		{
			List<Com_Contrato_DocTec> lista = new List<Com_Contrato_DocTec>();
			var tabla = Adapter.GetByCom_Contrato_Id( p_Com_Contrato_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_DocTec(
				fila.Id,
fila.Com_Contrato_Id,
fila.Nombre,
fila.Tiene
				));
			}
			return lista;
		}
		// GetById
		public List<Com_Contrato_DocTec> GetById (Scope s , Int32 p_Id)
		{
			List<Com_Contrato_DocTec> lista = new List<Com_Contrato_DocTec>();
			var tabla = Adapter.GetById( p_Id);
			foreach (var fila in tabla)
			{
				lista.Add(new Com_Contrato_DocTec(
				fila.Id,
fila.Com_Contrato_Id,
fila.Nombre,
fila.Tiene
				));
			}
			return lista;
		}
		// InsertINT
		public int InsertINT(Com_Contrato_DocTec n)
    {
        int res;
        try {
            res = Convert.ToInt16( Adapter.InsertINT(
				n.Com_Contrato_Id,
n.Nombre,
n.Tiene
			));
        }
        catch (SqlException e)
        { throw (new Exception( e.Message)); }
        return res;
    }
	}
}
